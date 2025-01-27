USE [IVRrule_ngdb]
GO
/****** Object:  Schema [rule_engine]    Script Date: 18-Oct-22 2:43:43 PM ******/
CREATE SCHEMA [rule_engine]
GO
/****** Object:  StoredProcedure [rule_engine].[sp_copy_approved_rule]    Script Date: 18-Oct-22 2:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [rule_engine].[sp_copy_approved_rule](
	@paramRuleId integer,@ruleName varchar(100),@userId varchar(100),@message varchar(100) OUTPUT)
AS
BEGIN
	SET NOCOUNT ON
	declare @ruleId integer;
	begin try
		
		insert into rule_engine.rule_config_details_temp(
			rule_name,rule_description, category_id,category_name, channel_id,channel_name,
			active_status,created_date,updated_date,user_id,updated_by,user_name,domain_id,domain_name,bu_id,bu_name,preferred_flag,priority,approve_status)
		select
			concat( 'Copy of ',rule_name),rule_description, category_id,category_name, channel_id,channel_name,
			active_status,getdate(),getdate(),@userId,@userId,@userId,domain_id,domain_name,bu_id,bu_name,preferred_flag,priority,'NEW'
			from  rule_engine.rule_config_details
			where rule_id=@paramRuleId;

			select @ruleId=rule_id from  rule_engine.rule_config_details_temp where rule_name=concat( 'Copy of ',@ruleName)
			
		INSERT INTO [rule_engine].[rule_group_condition_temp]([group_id],[rule_id],[operator])
		select  [group_id],@ruleId,[operator] from [rule_engine].rule_group_condition where rule_id=@paramRuleId;
 
		insert into rule_engine.rule_condition_details_temp(
			rule_id,variable_id,variable_name,operation, operation_values,active_status, created_date,updated_date,
			user_id,group_id,operator)
		select
			@ruleId,variable_id,variable_name,operation, operation_values,active_status, getdate(),getdate(),
			@userId,group_id,operator
			from  rule_engine.rule_condition_details
			where rule_id=@paramRuleId;
 
		insert into rule_engine.rule_action_details_temp(
			rule_id,action_type,action_value, active_status, created_date,updated_date,user_id,fail_action_type,fail_action_value)
		select
			@ruleId,action_type,action_value, active_status, getdate(),getdate(),@userId,fail_action_type,fail_action_value
			from  rule_engine.rule_action_details
			where rule_id=@paramRuleId;

		select @message='Rule Copied Sucessfully';

	end try
	BEGIN CATCH
       /* SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;*/
		select @message='failed';
    END CATCH
END;


GO
/****** Object:  StoredProcedure [rule_engine].[sp_log_approve_status]    Script Date: 18-Oct-22 2:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [rule_engine].[sp_log_approve_status](
	@paramRuleId integer,
	@paramTransactionStatus varChar(20),
	@paramTransactionId integer,
	@paramChecker varChar(50),
	@paramComment varChar(200))
AS
BEGIN
   insert into rule_engine.rule_config_details_audit(
approval_status_id,rule_id,rule_name,rule_description, category_id,category_name, channel_id,channel_name,
active_status,created_date,updated_date,user_id,domain_id,domain_name,bu_id,bu_name,approve_status,app_rule_id,get_approval_flag,submitted_date,maker_name,checker_name,checker_act_date,status,comments)
select
 @paramTransactionId,rule_id,rule_name,rule_description, category_id,category_name, channel_id,channel_name,
active_status,created_date,updated_date,user_id,domain_id,domain_name,bu_id,bu_name,approve_status,app_rule_id,get_approval_flag,updated_date,user_name,@paramChecker,getdate(),@paramTransactionStatus,@paramComment
 from  rule_engine.rule_config_details_temp
 where rule_id=@paramRuleId;
 
 insert into rule_engine.rule_condition_details_audit(
approval_status_id,condition_id,rule_id,variable_id,variable_name,operation, operation_values,active_status, created_date,updated_date,
user_id)
select
 @paramTransactionId,condition_id,rule_id,variable_id,variable_name,operation, operation_values,active_status, created_date,updated_date,
user_id
 from  rule_engine.rule_condition_details_temp
 where rule_id=@paramRuleId;
 
insert into rule_engine.rule_action_details_audit(
	approval_status_id,action_id,rule_id,action_type,action_value, active_status, created_date,updated_date,user_id)
select
	@paramTransactionId,action_id,rule_id,action_type,action_value, active_status, created_date,updated_date,user_id
from  rule_engine.rule_action_details_temp
where rule_id=@paramRuleId;
END;

GO
/****** Object:  Table [rule_engine].[audit_log]    Script Date: 18-Oct-22 2:43:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[audit_log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](45) NOT NULL,
	[user_email] [varchar](100) NOT NULL,
	[source_ip] [varchar](45) NULL,
	[created_at] [datetime2](0) NULL,
	[action] [varchar](45) NOT NULL,
	[domain] [varchar](45) NOT NULL,
	[old_value] [nvarchar](max) NULL,
	[new_value] [nvarchar](max) NULL,
 CONSTRAINT [PK_audit_log_audit_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[business_unit_category_mapping]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[business_unit_category_mapping](
	[bu_cat_id] [int] IDENTITY(16,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[domain_id] [int] NOT NULL,
	[bu_id] [int] NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NULL,
 CONSTRAINT [PK_business_unit_category_mapping_bu_cat_id] PRIMARY KEY CLUSTERED 
(
	[bu_cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [business_unit_category_mapping$bu_cat_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[bu_cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[business_unit_mast]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[business_unit_mast](
	[bu_id] [int] IDENTITY(8,1) NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
 CONSTRAINT [PK_business_unit_mast_bu_id] PRIMARY KEY CLUSTERED 
(
	[bu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [business_unit_mast$bu_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[bu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[category_mast]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[category_mast](
	[category_id] [int] IDENTITY(8,1) NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
 CONSTRAINT [PK_category_mast_category_id] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[channel_mast]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[channel_mast](
	[channel_id] [int] IDENTITY(9,1) NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
 CONSTRAINT [PK_channel_mast_channel_id] PRIMARY KEY CLUSTERED 
(
	[channel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[domain_mast]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[domain_mast](
	[domain_id] [int] IDENTITY(4,1) NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
 CONSTRAINT [PK_domain_mast_domain_id] PRIMARY KEY CLUSTERED 
(
	[domain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [domain_mast$domain_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[domain_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[group_rule_details]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[group_rule_details](
	[group_id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_rule] [nvarchar](50) NULL,
	[group_description] [nvarchar](150) NULL,
	[domain_id] [int] NULL,
	[domain_name] [nvarchar](50) NULL,
	[bu_id] [int] NULL,
	[bu_name] [nvarchar](50) NULL,
	[category_id] [int] NULL,
	[category_name] [nvarchar](50) NULL,
	[channel_id] [int] NULL,
	[channel_name] [nvarchar](50) NULL,
	[rule_id] [nvarchar](50) NULL,
	[rule_name] [varchar](1000) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_on] [datetime] NULL,
	[updated_on] [datetime] NULL,
	[active_status] [bit] NULL,
	[creation_status] [nvarchar](50) NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
 CONSTRAINT [PK_rule_engine.group_rule_detail] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[group_rule_details_approved]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[group_rule_details_approved](
	[group_id] [bigint] NOT NULL,
	[group_rule] [nvarchar](50) NULL,
	[group_description] [nvarchar](150) NULL,
	[domain_id] [int] NULL,
	[domain_name] [nvarchar](50) NULL,
	[bu_id] [int] NULL,
	[bu_name] [nvarchar](50) NULL,
	[category_id] [int] NULL,
	[category_name] [nvarchar](50) NULL,
	[channel_id] [int] NULL,
	[channel_name] [nvarchar](50) NULL,
	[rule_id] [nvarchar](50) NULL,
	[rule_name] [varchar](1000) NULL,
	[creation_status] [nvarchar](50) NULL,
	[approved_by] [nvarchar](50) NULL,
	[created_by] [nvarchar](50) NULL,
	[created_on] [datetime] NULL,
	[updated_on] [datetime] NULL,
	[active_status] [bit] NULL,
	[edit_flag] [bit] NULL,
	[comment] [nvarchar](500) NULL,
	[Approved_date] [datetime2] NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
 CONSTRAINT [PK_rule_engine.group_rule_detail_approved] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[lead_details]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[lead_details](
	[lead_Id] [int] IDENTITY(121,1) NOT NULL,
	[reference_id] [nvarchar](50) NOT NULL,
	[created_by] [nvarchar](45) NULL,
	[created_date] [datetime2](0) NOT NULL,
	[domain_name] [nvarchar](45) NULL,
	[bu_name] [nvarchar](45) NULL,
	[channel] [nvarchar](45) NULL,
	[source] [nvarchar](45) NULL,
	[rule_id] [int] NULL,
	[rule_name] [nvarchar](45) NULL,
	[rule_description] [nvarchar](200) NULL,
	[customer_info] [nvarchar](max) NULL,
	[input_info] [nvarchar](max) NULL,
	[exe_id] [int] NULL,
 CONSTRAINT [PK_lead_details_lead_Id] PRIMARY KEY CLUSTERED 
(
	[lead_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[log_rule_condition_execution]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[log_rule_condition_execution](
	[autogen_id] [int] IDENTITY(306,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[variable_id] [int] NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[operation] [varchar](45) NOT NULL,
	[operation_values] [nvarchar](4000) NULL,
	[operator] [varchar](45) NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NULL,
	[success_flag] [int] NULL,
	[failure_flag] [int] NULL,
	[group_id] [int] NULL,
	[condition_id] [int] NOT NULL,
	[input_value] [varchar](45) NULL,
	[exe_id] [int] NOT NULL,
 CONSTRAINT [PK_log_rule_condition_execution_autogen_id] PRIMARY KEY CLUSTERED 
(
	[autogen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[log_rule_execution]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[log_rule_execution](
	[log_id] [int] IDENTITY(599,1) NOT NULL,
	[exe_id] [int] NOT NULL,
	[exe_seq_num] [int] NOT NULL,
	[rule_id] [int] NOT NULL,
	[rule_name] [nvarchar](45) NOT NULL,
	[rule_description] [nvarchar](250) NULL,
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [nvarchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [nvarchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [nvarchar](45) NOT NULL,
	[transaction_status] [nvarchar](45) NOT NULL,
	[failure_reason] [nvarchar](500) NOT NULL,
	[executed_date] [datetime2](0) NOT NULL,
	[user_id] [nvarchar](45) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[type] [varchar](20) NULL,
	[input_info] [nvarchar](max) NULL,
	[detail_snapshot] [nvarchar](max) NULL,
 CONSTRAINT [PK_log_rule_execution_log_id] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [log_rule_execution$log_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_action_details]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_action_details](
	[action_id] [int] IDENTITY(17,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[action_type] [nvarchar](45) NOT NULL,
	[action_value] [nvarchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [nvarchar](45) NOT NULL,
	[fail_action_type] [nvarchar](50) NULL,
	[fail_action_value] [nvarchar](50) NULL,
 CONSTRAINT [PK_rule_action_details_action_id] PRIMARY KEY CLUSTERED 
(
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_action_details_audit]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_action_details_audit](
	[audit_id] [int] IDENTITY(11,1) NOT NULL,
	[approval_status_id] [int] NOT NULL,
	[action_id] [int] NOT NULL,
	[rule_id] [int] NOT NULL,
	[action_type] [nvarchar](45) NOT NULL,
	[action_value] [nvarchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_rule_action_details_audit_audit_id] PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_action_details_temp]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_action_details_temp](
	[action_id] [int] IDENTITY(34,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[action_type] [nvarchar](45) NOT NULL,
	[action_value] [nvarchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [nvarchar](45) NOT NULL,
	[fail_action_type] [nvarchar](50) NULL,
	[fail_action_value] [nvarchar](50) NULL,
 CONSTRAINT [PK_rule_action_details_temp_action_id] PRIMARY KEY CLUSTERED 
(
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_approval_status_log]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_approval_status_log](
	[status_id] [int] IDENTITY(38,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[rule_name] [nvarchar](45) NOT NULL,
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [nvarchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [nvarchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [nvarchar](45) NOT NULL,
	[approval_status] [nvarchar](45) NOT NULL,
	[rejected_reason] [nvarchar](150) NOT NULL,
	[executed_date] [datetime2](0) NOT NULL,
	[user_id] [nvarchar](45) NOT NULL,
	[user_name] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_rule_approval_status_log_status_id] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [rule_approval_status_log$status_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_condition_details]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_condition_details](
	[condition_id] [int] IDENTITY(56,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[variable_id] [int] NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[operation] [varchar](45) NOT NULL,
	[operation_values] [nvarchar](4000) NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NOT NULL,
	[group_id] [int] NULL,
	[operator] [varchar](15) NULL,
 CONSTRAINT [PK_rule_condition_details_condition_id] PRIMARY KEY CLUSTERED 
(
	[condition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_condition_details_audit]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_condition_details_audit](
	[audit_id] [int] IDENTITY(61,1) NOT NULL,
	[approval_status_id] [int] NOT NULL,
	[condition_id] [int] NOT NULL,
	[rule_id] [int] NOT NULL,
	[variable_id] [int] NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[operation] [varchar](45) NOT NULL,
	[operation_values] [nvarchar](4000) NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NOT NULL,
 CONSTRAINT [PK_rule_condition_details_audit_audit_id] PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_condition_details_report_log]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_condition_details_report_log](
	[autogen_id] [int] IDENTITY(24,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[variable_id] [int] NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[operation] [varchar](45) NOT NULL,
	[operation_values] [nvarchar](4000) NULL,
	[operator] [varchar](45) NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NULL,
	[no_of_success] [int] NULL,
	[no_of_failure] [int] NULL,
	[group_id] [int] NULL,
	[condition_id] [int] NOT NULL,
 CONSTRAINT [PK_rule_condition_details_report_log_autogen_id] PRIMARY KEY CLUSTERED 
(
	[autogen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_condition_details_temp]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_condition_details_temp](
	[condition_id] [int] IDENTITY(105,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[variable_id] [int] NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[operation] [varchar](45) NOT NULL,
	[operation_values] [nvarchar](4000) NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NOT NULL,
	[group_id] [int] NULL,
	[operator] [varchar](15) NULL,
 CONSTRAINT [PK_rule_condition_details_temp_condition_id] PRIMARY KEY CLUSTERED 
(
	[condition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_config_details]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_config_details](
	[rule_id] [int] IDENTITY(17,1) NOT NULL,
	[rule_name] [varchar](45) NOT NULL,
	[rule_description] [varchar](500) NULL,
	[category_id] [bigint] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NOT NULL,
	[user_name] [varchar](50) NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[preferred_flag] [varchar](10) NULL,
	[priority] [int] NULL,
	[approve_status] [varchar](45) NULL,
	[editflag] [bit] NULL,
	[Approved_By] [varchar](50) NULL,
	[Approved_date] [datetime2](0) NULL,
	[comment] [varchar](200) NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
 CONSTRAINT [PK_rule_config_details_rule_id] PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_config_details_audit]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_config_details_audit](
	[audit_id] [int] IDENTITY(11,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[approval_status_id] [int] NOT NULL,
	[rule_name] [varchar](45) NOT NULL,
	[rule_description] [varchar](45) NULL,
	[category_id] [bigint] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[approve_status] [varchar](45) NULL,
	[app_rule_id] [int] NULL,
	[get_approval_flag] [smallint] NULL,
	[maker_name] [varchar](50) NULL,
	[submitted_date] [datetime2](0) NULL,
	[checker_name] [varchar](50) NULL,
	[checker_act_date] [datetime2](0) NULL,
	[status] [varchar](50) NULL,
	[comments] [varchar](200) NULL,
 CONSTRAINT [PK_rule_config_details_audit_audit_id] PRIMARY KEY CLUSTERED 
(
	[audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_config_details_report_log]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_config_details_report_log](
	[autogen_id] [int] IDENTITY(15,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[rule_name] [varchar](45) NOT NULL,
	[category_id] [int] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [int] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[no_of_execution] [int] NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NULL,
 CONSTRAINT [PK_rule_config_details_report_log_autogen_id] PRIMARY KEY CLUSTERED 
(
	[autogen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [rule_config_details_report_log$created_date_UNIQUE] UNIQUE NONCLUSTERED 
(
	[created_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_config_details_temp]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_config_details_temp](
	[rule_id] [int] IDENTITY(34,1) NOT NULL,
	[rule_name] [varchar](45) NOT NULL,
	[rule_description] [varchar](500) NULL,
	[category_id] [bigint] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2](0) NULL,
	[updated_date] [datetime2](0) NULL,
	[user_id] [varchar](45) NOT NULL,
	[user_name] [varchar](50) NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[preferred_flag] [varchar](10) NULL,
	[priority] [int] NULL,
	[approve_status] [varchar](45) NULL,
	[app_rule_id] [int] NULL,
	[get_approval_flag] [smallint] NULL,
	[comment] [varchar](200) NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
 CONSTRAINT [PK_rule_config_details_temp_rule_id] PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_group_condition]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_group_condition](
	[id] [int] IDENTITY(25,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[rule_id] [int] NOT NULL,
	[operator] [nvarchar](15) NULL,
 CONSTRAINT [PK_rule_group_condition_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_group_condition_temp]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_group_condition_temp](
	[id] [int] IDENTITY(47,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[rule_id] [int] NOT NULL,
	[operator] [nvarchar](15) NULL,
 CONSTRAINT [PK_rule_group_condition_temp_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_log_data]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [rule_engine].[rule_log_data](
	[log_id] [int] IDENTITY(32,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[rule_name] [nvarchar](45) NOT NULL,
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [nvarchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [nvarchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [nvarchar](45) NOT NULL,
	[transaction_status] [nvarchar](45) NOT NULL,
	[failure_reason] [nvarchar](1500) NOT NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_rule_log_data_log_id] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [rule_log_data$log_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[rule_util_det]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_util_det](
	[util_det_id] [bigint] IDENTITY(1,1) NOT NULL,
	[util_id] [bigint] NOT NULL,
	[row_name] [varchar](150) NULL,
	[column_name] [varchar](150) NULL,
	[value] [varchar](150) NULL,
	[row_num] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[util_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_util_det_approved]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_util_det_approved](
	[util_det_id] [bigint] NOT NULL,
	[util_id] [bigint] NOT NULL,
	[row_name] [varchar](150) NULL,
	[column_name] [varchar](150) NULL,
	[value] [varchar](150) NULL,
	[row_num] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[util_det_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_utility]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_utility](
	[util_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[util_type] [varchar](150) NOT NULL,
	[key_param] [varchar](150) NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](50) NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](50) NULL,
	[channel_id] [varchar](50) NULL,
	[channel_name] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[app_util_id] [bigint] NULL,
	[created_by] [varchar](50) NULL,
	[created_on] [datetime] NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
	[UPDATED_ON] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[util_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[rule_utility_approved]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[rule_utility_approved](
	[util_id] [bigint] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[util_type] [varchar](150) NOT NULL,
	[key_param] [varchar](150) NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](50) NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](50) NULL,
	[channel_id] [varchar](50) NULL,
	[channel_name] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[edit_flag] [bit] NULL,
	[Approved_by] [varchar](50) NULL,
	[created_on] [datetime] NULL,
	[comment] [varchar](200) NULL,
	[Approved_date] [datetime2](0) NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
	[UPDATED_ON] [datetime] NULL,
	[CREATED_BY] [nvarchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[util_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [rule_engine].[variable_inventory]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[variable_inventory](
	[variable_id] [bigint] IDENTITY(38,1) NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[data_type] [varchar](45) NOT NULL,
	[variable_value] [varchar](max) NULL,
	[property_id] [int] NULL,
	[property_name] [varchar](45) NULL,
	[category_id] [int] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [int] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[approve_status] [varchar](45) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [rule_engine].[variable_inventory] ADD [approved_variable_id] [varchar](30) NULL
SET ANSI_PADDING ON
ALTER TABLE [rule_engine].[variable_inventory] ADD [map_list_id] [varchar](10) NULL
ALTER TABLE [rule_engine].[variable_inventory] ADD [UPDATED_BY] [nvarchar](45) NULL
 CONSTRAINT [PK_variable_inventory_variable_id] PRIMARY KEY CLUSTERED 
(
	[variable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[variable_inventory_approved]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[variable_inventory_approved](
	[variable_id] [bigint] IDENTITY(38,1) NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[data_type] [varchar](45) NOT NULL,
	[variable_value] [varchar](max) NULL,
	[property_id] [int] NULL,
	[property_name] [varchar](45) NULL,
	[category_id] [int] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[channel_id] [int] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[edit_flag] [bit] NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
	[approve_status] [varchar](45) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[APPROVED_BY] [nvarchar](30) NULL,
	[APROVER_COMMENT] [nvarchar](230) NULL,
	[map_list_id] [varchar](10) NULL,
	[Approved_date] [datetime2] NULL,
 CONSTRAINT [PK_variable_inventory_variable_approved_id] PRIMARY KEY CLUSTERED 
(
	[variable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[variable_inventory_audit]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[variable_inventory_audit](
	[variable_audit_id] [bigint] IDENTITY(1,1) NOT NULL,
	[variable_id] [bigint] NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[data_type] [varchar](45) NOT NULL,
	[variable_value] [varchar](230) NULL,
	[property_id] [int] NULL,
	[property_name] [varchar](45) NULL,
	[category_id] [int] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [int] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [bit] NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[created_by] [varchar](45) NULL,
	[updated_by] [varchar](45) NULL,
	[approve_status] [varchar](45) NULL,
	[user_action] [varchar](45) NOT NULL,
 CONSTRAINT [PK_variable_inventory_variable_audit_id] PRIMARY KEY CLUSTERED 
(
	[variable_audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[variable_list_data]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[variable_list_data](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[variable_id] [bigint] NOT NULL,
	[data] [varchar](75) NOT NULL,
	[other_data] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rule_engine].[variable_list_data_approved]    Script Date: 18-Oct-22 2:43:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rule_engine].[variable_list_data_approved](
	[id] [bigint] NOT NULL,
	[variable_id] [bigint] NOT NULL,
	[data] [varchar](75) NOT NULL,
	[other_data] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [rule_engine].[audit_log] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [rule_engine].[business_unit_category_mapping] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[group_rule_details] ADD  CONSTRAINT [DF_rule_engine.group_rule_details_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [rule_engine].[group_rule_details] ADD  CONSTRAINT [DF_rule_engine.group_rule_details_updated_on]  DEFAULT (getdate()) FOR [updated_on]
GO
ALTER TABLE [rule_engine].[group_rule_details] ADD  CONSTRAINT [DF_status]  DEFAULT ((1)) FOR [active_status]
GO
ALTER TABLE [rule_engine].[group_rule_details_approved] ADD  CONSTRAINT [DF_rule_engine.group_rule_details_app_created_on]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [rule_engine].[group_rule_details_approved] ADD  CONSTRAINT [DF_rule_engine.group_rule_details_app_updated_on]  DEFAULT (getdate()) FOR [updated_on]
GO
ALTER TABLE [rule_engine].[group_rule_details_approved] ADD  CONSTRAINT [DF_status_Grp_App]  DEFAULT ((1)) FOR [active_status]
GO
ALTER TABLE [rule_engine].[group_rule_details_approved] ADD  DEFAULT (getdate()) FOR [Approved_date]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (N'0') FOR [reference_id]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [created_by]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [domain_name]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [bu_name]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [channel]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [source]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [rule_id]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [rule_name]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [rule_description]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [customer_info]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [input_info]
GO
ALTER TABLE [rule_engine].[lead_details] ADD  DEFAULT (NULL) FOR [exe_id]
GO
ALTER TABLE [rule_engine].[log_rule_execution] ADD  DEFAULT (getdate()) FOR [executed_date]
GO																					   
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT (NULL) FOR [operator]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT ((0)) FOR [success_flag]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT ((0)) FOR [failure_flag]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT (NULL) FOR [group_id]
GO
ALTER TABLE [rule_engine].[log_rule_condition_execution] ADD  DEFAULT (NULL) FOR [input_value]
GO
ALTER TABLE [rule_engine].[log_rule_execution] ADD  DEFAULT (NULL) FOR [rule_description]
GO
ALTER TABLE [rule_engine].[log_rule_execution] ADD  DEFAULT (NULL) FOR [user_name]
GO
ALTER TABLE [rule_engine].[rule_action_details] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_action_details] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_action_details] ADD  DEFAULT (NULL) FOR [fail_action_type]
GO
ALTER TABLE [rule_engine].[rule_action_details] ADD  DEFAULT (NULL) FOR [fail_action_value]
GO
ALTER TABLE [rule_engine].[rule_action_details_audit] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_action_details_audit] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_action_details_temp] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_action_details_temp] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_action_details_temp] ADD  DEFAULT (NULL) FOR [fail_action_type]
GO
ALTER TABLE [rule_engine].[rule_action_details_temp] ADD  DEFAULT (NULL) FOR [fail_action_value]
GO
ALTER TABLE [rule_engine].[rule_condition_details] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details] ADD  DEFAULT ((1)) FOR [group_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details] ADD  DEFAULT (NULL) FOR [operator]
GO
ALTER TABLE [rule_engine].[rule_condition_details_audit] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details_audit] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT (NULL) FOR [operator]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT ((0)) FOR [no_of_success]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT ((0)) FOR [no_of_failure]
GO
ALTER TABLE [rule_engine].[rule_condition_details_report_log] ADD  DEFAULT (NULL) FOR [group_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp] ADD  DEFAULT ((1)) FOR [group_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp] ADD  DEFAULT (NULL) FOR [operator]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (NULL) FOR [rule_description]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (NULL) FOR [user_name]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (NULL) FOR [preferred_flag]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (NULL) FOR [priority]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (NULL) FOR [Approved_By]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (getdate()) FOR [Approved_date]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (NULL) FOR [comment]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [rule_description]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [app_rule_id]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT ((0)) FOR [get_approval_flag]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [maker_name]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [submitted_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [checker_name]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [checker_act_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [rule_engine].[rule_config_details_audit] ADD  DEFAULT (NULL) FOR [comments]
GO
ALTER TABLE [rule_engine].[rule_config_details_report_log] ADD  DEFAULT ((0)) FOR [no_of_execution]
GO
ALTER TABLE [rule_engine].[rule_config_details_report_log] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_report_log] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_report_log] ADD  DEFAULT (NULL) FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [rule_description]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [user_name]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [preferred_flag]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [priority]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [app_rule_id]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT ((0)) FOR [get_approval_flag]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [comment]
GO
ALTER TABLE [rule_engine].[rule_group_condition] ADD  DEFAULT (NULL) FOR [operator]
GO
ALTER TABLE [rule_engine].[rule_group_condition_temp] ADD  DEFAULT (NULL) FOR [operator]
GO
ALTER TABLE [rule_engine].[rule_utility] ADD  DEFAULT ('New') FOR [status]
GO
ALTER TABLE [rule_engine].[rule_utility] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [rule_engine].[rule_utility] ADD  DEFAULT (getdate()) FOR [UPDATED_ON]
GO
ALTER TABLE [rule_engine].[rule_utility_approved] ADD  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [rule_engine].[rule_utility_approved] ADD  DEFAULT (getdate()) FOR [Approved_date]
GO
ALTER TABLE [rule_engine].[rule_utility_approved] ADD  DEFAULT (getdate()) FOR [UPDATED_ON]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (NULL) FOR [variable_value]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (NULL) FOR [property_id]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (NULL) FOR [property_name]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (getdate()) FOR [updated_date]
GO								  
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [variable_value]								
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [property_id]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [property_name]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [edit_flag]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [UPDATED_BY]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [APPROVED_BY]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (NULL) FOR [APROVER_COMMENT]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (getdate()) FOR [Approved_date]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [rule_engine].[variable_inventory_audit] ADD  DEFAULT (NULL) FOR [variable_value]
GO
ALTER TABLE [rule_engine].[variable_inventory_audit] ADD  DEFAULT (NULL) FOR [property_id]
GO
ALTER TABLE [rule_engine].[variable_inventory_audit] ADD  DEFAULT (NULL) FOR [property_name]
GO
ALTER TABLE [rule_engine].[variable_inventory_audit] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [rule_engine].[business_unit_category_mapping]  WITH NOCHECK ADD  CONSTRAINT [business_unit_category_mapping$category_rel] FOREIGN KEY([category_id])
REFERENCES [rule_engine].[category_mast] ([category_id])
GO
ALTER TABLE [rule_engine].[business_unit_category_mapping] CHECK CONSTRAINT [business_unit_category_mapping$category_rel]
GO
ALTER TABLE [rule_engine].[business_unit_category_mapping]  WITH NOCHECK ADD  CONSTRAINT [business_unit_category_mapping$domain_rel] FOREIGN KEY([domain_id])
REFERENCES [rule_engine].[domain_mast] ([domain_id])
GO
ALTER TABLE [rule_engine].[business_unit_category_mapping] CHECK CONSTRAINT [business_unit_category_mapping$domain_rel]
GO
ALTER TABLE [rule_engine].[business_unit_mast]  WITH NOCHECK ADD  CONSTRAINT [business_unit_mast$domain_bu_rel] FOREIGN KEY([domain_id])
REFERENCES [rule_engine].[domain_mast] ([domain_id])
GO
ALTER TABLE [rule_engine].[business_unit_mast] CHECK CONSTRAINT [business_unit_mast$domain_bu_rel]
GO
ALTER TABLE [rule_engine].[rule_action_details]  WITH NOCHECK ADD  CONSTRAINT [rule_action_details$action_rule_id] FOREIGN KEY([rule_id])
REFERENCES [rule_engine].[rule_config_details] ([rule_id])
GO
ALTER TABLE [rule_engine].[rule_action_details] CHECK CONSTRAINT [rule_action_details$action_rule_id]
GO
ALTER TABLE [rule_engine].[rule_action_details_temp]  WITH NOCHECK ADD  CONSTRAINT [rule_action_details_temp$action_rule_id_temp] FOREIGN KEY([rule_id])
REFERENCES [rule_engine].[rule_config_details_temp] ([rule_id])
GO
ALTER TABLE [rule_engine].[rule_action_details_temp] CHECK CONSTRAINT [rule_action_details_temp$action_rule_id_temp]
GO
ALTER TABLE [rule_engine].[rule_condition_details]  WITH NOCHECK ADD  CONSTRAINT [rule_condition_details$rule_id] FOREIGN KEY([rule_id])
REFERENCES [rule_engine].[rule_config_details] ([rule_id])
GO
ALTER TABLE [rule_engine].[rule_condition_details] CHECK CONSTRAINT [rule_condition_details$rule_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp]  WITH NOCHECK ADD  CONSTRAINT [rule_condition_details_temp$rule_id_temp] FOREIGN KEY([rule_id])
REFERENCES [rule_engine].[rule_config_details_temp] ([rule_id])
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp] CHECK CONSTRAINT [rule_condition_details_temp$rule_id_temp]
GO
ALTER TABLE [rule_engine].[rule_util_det]  WITH CHECK ADD FOREIGN KEY([util_id])
REFERENCES [rule_engine].[rule_utility] ([util_id])
GO
ALTER TABLE [rule_engine].[rule_util_det_approved]  WITH CHECK ADD FOREIGN KEY([util_id])
REFERENCES [rule_engine].[rule_utility_approved] ([util_id])

/** Audit fields default value*/
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[variable_inventory_approved] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details_temp] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_condition_details] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_action_details] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[rule_action_details_temp] ADD  DEFAULT (N'System') FOR [user_id]
GO
ALTER TABLE [rule_engine].[group_rule_details] ADD  DEFAULT (N'System') FOR [created_by]
GO
ALTER TABLE [rule_engine].[group_rule_details_approved] ADD  DEFAULT (N'System') FOR [created_by]
GO
ALTER TABLE [rule_engine].[rule_utility] ADD  DEFAULT (N'System') FOR [created_by]
GO
ALTER TABLE [rule_engine].[rule_utility_approved] ADD  DEFAULT (N'System') FOR [created_by]
GO
ALTER TABLE [rule_engine].[variable_inventory] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [rule_engine].[rule_config_details_temp] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [rule_engine].[rule_config_details] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [rule_engine].[group_rule_details] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [rule_engine].[group_rule_details_approved] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [rule_engine].[rule_utility] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [rule_engine].[rule_utility_approved] ADD  DEFAULT (N'System') FOR [updated_by]
