USE [IVRrule_engdb_UM]
GO
/****** Object:  Schema [user_rule]    Script Date: 18-Oct-22 2:45:58 PM ******/
CREATE SCHEMA [user_rule]
GO
/****** Object:  Table [user_rule].[agent_mapping]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[agent_mapping](
	[AUTOGEN_AGENT_MAPPING_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AGENT_ID] [nvarchar](20) NULL,
	[AGENT_NAME] [nvarchar](30) NULL,
	[AUDITOR_ID] [nvarchar](20) NULL,
	[AUDITOR_NAME] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_agent_mapping_AUTOGEN_AGENT_MAPPING_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_AGENT_MAPPING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[audit_log]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[audit_log](
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
/****** Object:  Table [user_rule].[client_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[client_details](
	[AUTOGEN_CLIENT_DETAILS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[INVENTORY_CLIENT_ID] [bigint] NULL,
	[INVENTORY_CLIENT_NAME] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](20) NULL,
	[MOBILE_NUMBER] [nvarchar](20) NULL,
	[INVENTORY_REGION_ID] [bigint] NULL,
	[INVENTORY_REGION_NAME] [nvarchar](20) NULL,
	[INVENTORY_CENTER_ID] [bigint] NULL,
	[INVENTORY_CENTER_NAME] [nvarchar](20) NULL,
	[LOGO] [varbinary](max) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[CREATED_BY] [nvarchar](20) NULL,
	[UPDATED_BY] [nvarchar](20) NULL,
	[STATUS] [nvarchar](45) NULL,
	[LOGO_NAME] [nvarchar](30) NULL,
	[LOGO_TYPE] [nvarchar](10) NULL,
 CONSTRAINT [PK_client_details_AUTOGEN_CLIENT_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_CLIENT_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[client_report_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[client_report_map](
	[AUTOGEN_CLIENT_REPORT_MAP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_CONTACT_DETAILS_ID] [bigint] NULL,
	[INVENTORY_PROCESS_ID] [bigint] NULL,
	[INVENTORY_PROCESS_NAME] [nvarchar](20) NULL,
	[AUTOGEN_REPORT_MASTER_ID] [bigint] NULL,
	[REPORT_NAME] [nvarchar](20) NULL,
	[AUTOGEN_FREQUENCY_MASTER_ID] [bigint] NULL,
	[FREQUENCY_NAME] [nvarchar](100) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_client_report_map_AUTOGEN_CLIENT_REPORT_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_CLIENT_REPORT_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[contact_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[contact_details](
	[AUTOGEN_CONTACT_DETAILS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_CLIENT_DETAILS_ID] [bigint] NULL,
	[PERSON_NAME] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](20) NULL,
	[MOBILE_NUMBER] [nvarchar](20) NULL,
	[NOTIFICATION_STATUS] [nvarchar](20) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[CREATED_BY] [nvarchar](20) NULL,
	[UPDATED_BY] [nvarchar](20) NULL,
	[STATUS] [nvarchar](10) NULL,
 CONSTRAINT [PK_contact_details_AUTOGEN_CONTACT_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_CONTACT_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[evaluation_record]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[evaluation_record](
	[EVALUATION_RECORD_ID] [int] NOT NULL,
	[AGENT_CATEGORY] [nvarchar](255) NULL,
	[AGENT_ID] [nvarchar](255) NULL,
	[AGENT_NAME] [nvarchar](255) NULL,
	[IS_ASSIGNED] [nvarchar](255) NULL,
	[ASSIGNED_AUDITOR_ID] [nvarchar](255) NULL,
	[ASSIGNED_AUDITOR_NAME] [nvarchar](255) NULL,
	[AUDITOR_ID] [nvarchar](255) NULL,
	[AUDITOR_NAME] [nvarchar](255) NULL,
	[AUDDITOR_UPDATED_DATE] [datetime2](0) NULL,
	[IS_CALIBRATION] [nvarchar](255) NULL,
	[CALL_NATURE] [nvarchar](255) NULL,
	[CALL_TYPE] [nvarchar](255) NULL,
	[CENTER_ID] [int] NULL,
	[CENTER_NAME] [nvarchar](255) NULL,
	[CLIENT_ID] [int] NULL,
	[CLIENT_NAME] [nvarchar](255) NULL,
	[CREATED_DATE] [datetime2](0) NULL,
	[DATE] [datetime2](0) NULL,
	[PARENT_ID] [int] NULL,
	[MASTER_RECORD] [nvarchar](255) NULL,
	[MSISDN] [nvarchar](255) NULL,
	[PROCESS_ID] [int] NULL,
	[PROCESS_NAME] [nvarchar](255) NULL,
	[REGION_ID] [int] NULL,
	[REGION_NAME] [nvarchar](255) NULL,
	[REQUEST_TYPE] [nvarchar](255) NULL,
	[STATUS] [nvarchar](255) NULL,
	[AGENT_AUDIT_STATUS] [nvarchar](255) NULL,
	[UPDATED_BY] [nvarchar](255) NULL,
	[UPDATED_DATE] [datetime2](0) NULL,
	[EVALUATION_FORM] [int] NULL,
	[CALL_SUB_TYPE_1] [nvarchar](255) NULL,
	[CALL_SUB_TYPE_2] [nvarchar](255) NULL,
	[CALL_SUB_TYPE_3] [nvarchar](255) NULL,
	[CALL_SUB_TYPE_4] [nvarchar](255) NULL,
	[CASE_TYPE] [nvarchar](255) NULL,
	[SKILL_SET_NAME] [nvarchar](255) NULL,
	[TENURE] [nvarchar](255) NULL,
	[TL_NAME] [nvarchar](255) NULL,
	[TL_ID] [nvarchar](255) NULL,
	[START_TIME] [nvarchar](45) NULL,
	[END_TIME] [nvarchar](45) NULL,
	[CALL_DATE] [datetime2] NULL,
	[HANDLING_TIME] [nvarchar](45) NULL,
	[AUDIT_STARTTIME] [datetime2](0) NULL,
	[AUDIT_ENDTIME] [datetime2](0) NULL,
	[AUDIT_MINUTES] [int] NULL,
	[PROCESS_FLAG] [nvarchar](255) NULL,
 CONSTRAINT [PK_evaluation_record_EVALUATION_RECORD_ID] PRIMARY KEY CLUSTERED 
(
	[EVALUATION_RECORD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[frequency_master]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[frequency_master](
	[AUTOGEN_FREQUENCY_MASTER_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FREQUENCY_NAME] [nvarchar](30) NULL,
	[DURATION_DAYS_COUNT] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_frequency_master_AUTOGEN_FREQUENCY_MASTER_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_FREQUENCY_MASTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[inventory_mapping]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[inventory_mapping](
	[AUTOGEN_INVENTORY_MAPPING_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[INVENTORY_REGION_ID] [bigint] NULL,
	[INVENTORY_REGION_NAME] [nvarchar](45) NULL,
	[INVENTORY_CENTER_ID] [bigint] NULL,
	[INVENTORY_CENTER_NAME] [nvarchar](45) NULL,
	[INVENTORY_CLIENT_ID] [bigint] NULL,
	[INVENTORY_CLIENT_NAME] [nvarchar](45) NULL,
	[INVENTORY_PROCESS_ID] [bigint] NULL,
	[INVENTORY_PROCESS_NAME] [nvarchar](45) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_inventory_mapping_AUTOGEN_INVENTORY_MAPPING_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_INVENTORY_MAPPING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[inventory_master]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[inventory_master](
	[AUTOGEN_INVENTORY_MASTER_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[INVENTORY_TYPE] [nvarchar](10) NULL,
	[NAME] [nvarchar](20) NULL,
	[STATUS] [nvarchar](10) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[CREATED_BY] [nvarchar](20) NULL,
	[UPDATED_BY] [nvarchar](20) NULL,
 CONSTRAINT [PK_inventory_master_AUTOGEN_INVENTORY_MASTER_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_INVENTORY_MASTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[login_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[login_details](
	[AUTOGEN_LOGIN_DETAILS_ID] [bigint] IDENTITY(1862,1) NOT NULL,
	[EMPLOYEE_ID] [nvarchar](20) NULL,
	[LOGIN_TIME] [datetime] NOT NULL,
	[LOGOUT_TIME] [datetime] NULL,
	[NO_OF_ATTEMPT] [bigint] NULL,
	[REMARKS] [nvarchar](max) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[source_ip] [varchar](45) NULL,
	[user_email] [varchar](100) NULL,
 CONSTRAINT [PK_login_details_AUTOGEN_LOGIN_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_LOGIN_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[module_master]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[module_master](
	[AUTOGEN_MODULE_MASTER_ID] [bigint] IDENTITY(13,1) NOT NULL,
	[MODULE_UID] [nvarchar](100) NULL,
	[MODULE_NAME] [nvarchar](100) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_module_master_AUTOGEN_MODULE_MASTER_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_MODULE_MASTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [module_master$MODULE_UID] UNIQUE NONCLUSTERED 
(
	[MODULE_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[report_master]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[report_master](
	[AUTOGEN_REPORT_MASTER_ID] [bigint] IDENTITY(3,1) NOT NULL,
	[REPORT_NAME] [nvarchar](100) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_report_master_AUTOGEN_REPORT_MASTER_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_REPORT_MASTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[role_access_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[role_access_map](
	[AUTOGEN_ROLE_ACCESS_MAP_ID] [bigint] IDENTITY(31,1) NOT NULL,
	[AUTOGEN_ROLES_ID] [bigint] NULL,
	[ROLES_NAME] [nvarchar](30) NOT NULL,
	[AUTOGEN_MODULE_MASTER_ID] [bigint] NULL,
	[MODULE_UID] [nvarchar](100) NOT NULL,
	[ACCESS_TYPE] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_role_access_map_ROLES_NAME] PRIMARY KEY CLUSTERED 
(
	[ROLES_NAME] ASC,
	[MODULE_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[roles]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[roles](
	[AUTOGEN_ROLES_ID] [bigint] IDENTITY(6,1) NOT NULL,
	[ROLES_NAME] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[CREATED_BY] [nvarchar](45) NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
	[description] [varchar](200) NULL,
	[ROLE_CREATE_STATUS] [varchar](50)  NULL,
 CONSTRAINT [PK_roles_AUTOGEN_ROLES_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_ROLES_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [roles$ROLE_NAME] UNIQUE NONCLUSTERED 
(
	[ROLES_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[roles_approved]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[roles_approved](
	[AUTOGEN_ROLES_ID] [bigint] NOT NULL,
	[ROLES_NAME] [nvarchar](30) NULL,
	[DESCRIPTION] [varchar](200) NULL,
	[STATUS] [nvarchar](10) NULL,
	[ROLE_CREATE_STATUS] [varchar](50) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[APPROVED_BY] [nvarchar](100) NULL,
	[CREATED_BY] [nvarchar](45) NULL,
	[UPDATED_BY] [nvarchar](45) NULL,
	[comment] [nvarchar](4000) NULL,
	[edit_flag] [bit] NULL,
	[APPROVED_ON] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[rule_action_details_temp]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[rule_action_details_temp](
	[action_id] [int] IDENTITY(7,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[action_type] [nvarchar](45) NOT NULL,
	[action_value] [nvarchar](45) NOT NULL,
	[active_status] [binary](1) NOT NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_rule_action_details_temp_action_id] PRIMARY KEY CLUSTERED 
(
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[rule_config_details_temp]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[rule_config_details_temp](
	[rule_id] [int] IDENTITY(8,1) NOT NULL,
	[rule_name] [varchar](45) NOT NULL,
	[rule_description] [varchar](45) NULL,
	[category_id] [bigint] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [bigint] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [binary](1) NOT NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[approve_status] [varchar](45) NULL,
 CONSTRAINT [PK_rule_config_details_temp_rule_id] PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[score_calculation]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[score_calculation](
	[autogen_id] [bigint] NOT NULL,
	[score_calculation] [nvarchar](max) NULL,
	[overall_max_score] [real] NULL,
	[overall_actual_score] [real] NULL,
	[overall_attribute_score] [nvarchar](10) NULL,
	[evaluation_record_id] [int] NULL,
	[fatal] [nvarchar](5) NULL,
	[max_score_fatal] [real] NULL,
	[actual_score_fatal] [real] NULL,
	[overall_score_fatal] [nvarchar](10) NULL,
	[created_by] [nvarchar](100) NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_score_calculation_autogen_id] PRIMARY KEY CLUSTERED 
(
	[autogen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[score_calculation_rpt]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[score_calculation_rpt](
	[AUTOGEN_SCORE_ID] [bigint] NOT NULL,
	[EVALUATION_RECORD_ID] [int] NOT NULL,
	[QUALITY_PARAM] [nvarchar](255) NULL,
	[QUALITY_ATTRIBUTE] [nvarchar](255) NULL,
	[ATTRIBUTE_SCORE] [nvarchar](255) NULL,
	[UPDATED_DATE] [datetime] NULL,
	[QUESTION] [nvarchar](500) NULL,
	[QUESTION_SCORE] [nvarchar](10) NULL,
	[RATING_FLAG] [binary](1) NULL,
 CONSTRAINT [PK_score_calculation_rpt_AUTOGEN_SCORE_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_SCORE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[screen_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[screen_map](
	[AUTOGEN_SCREEN_MAP_ID] [bigint] IDENTITY(11,1) NOT NULL,
	[AUTOGEN_MODULE_MASTER_ID] [bigint] NULL,
	[MODULE_UID] [nvarchar](100) NOT NULL,
	[AUTOGEN_SCREEN_MASTER_ID] [bigint] NULL,
	[SCREEN_UID] [nvarchar](100) NOT NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[module_Name] [varchar](100) NULL,
	[screen_Name] [varchar](100) NULL,
	[ACCESS_PERMISSION] [nvarchar](30) NULL,
	[SUPER_ADMIN_ACCESS] [bit] NULL,
 CONSTRAINT [PK_screen_map_MODULE_UID] PRIMARY KEY CLUSTERED 
(
	[MODULE_UID] ASC,
	[SCREEN_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[screen_master]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[screen_master](
	[AUTOGEN_SCREEN_MASTER_ID] [bigint] IDENTITY(17,1) NOT NULL,
	[SCREEN_UID] [nvarchar](100) NULL,
	[SCREEN_NAME] [nvarchar](100) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_screen_master_AUTOGEN_SCREEN_MASTER_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_SCREEN_MASTER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [screen_master$SCREEN_UID] UNIQUE NONCLUSTERED 
(
	[SCREEN_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[token_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[token_details](
	[AUTOGEN_TOKEN_DETAILS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EMPLOYEE_ID] [nvarchar](20) NOT NULL,
	[TOKEN] [nvarchar](2000) NULL,
	[REFRESH_TOKEN] [nvarchar](500) NULL,
	[expiry_seconds] [int] NULL,
	[expiry_Date] [datetime] NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_token_details_AUTOGEN_TOKEN_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_TOKEN_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[user_domain_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_domain_map](
	[AUTOGEN_USER_DOMAIN_MAP_ID] [bigint] IDENTITY(37,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[DOMAIN_ID] [bigint] NULL,
	[DOMAIN_NAME] [nvarchar](30) NULL,
	[BUSINESS_UNIT_ID] [bigint] NULL,
	[BUSINESS_UNIT_NAME] [nvarchar](30) NULL,
	[CATEGORY_ID] [bigint] NULL,
	[CATEGORY_NAME] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_user_domain_map_AUTOGEN_USER_DOMAIN_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_DOMAIN_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_domain_map_approved]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_domain_map_approved](
	[AUTOGEN_USER_DOMAIN_MAP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[DOMAIN_ID] [bigint] NULL,
	[DOMAIN_NAME] [nvarchar](30) NULL,
	[BUSINESS_UNIT_ID] [bigint] NULL,
	[BUSINESS_UNIT_NAME] [nvarchar](30) NULL,
	[CATEGORY_ID] [bigint] NULL,
	[CATEGORY_NAME] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_user_domain_map_APP_AUTOGEN_USER_DOMAIN_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_DOMAIN_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_groups]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_groups](
	[AUTOGEN_USER_GROUPS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[GROUP_NAME] [nvarchar](30) NULL,
	[GROUP_ID] [nvarchar](20) NULL,
	[STATUS] [nvarchar](10) NULL,
	[REC_ADD_DT] [datetime2](0) NULL,
	[REC_UPDATE_DT] [datetime2](0) NULL,
 CONSTRAINT [PK_user_groups_AUTOGEN_USER_GROUPS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_GROUPS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_groups_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_groups_map](
	[AUTOGEN_USER_GROUPS_MAP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_USER_GROUPS_ID] [bigint] NOT NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[STATUS] [nvarchar](10) NULL,
	[REC_ADD_DT] [datetime2](0) NULL,
	[REC_UPDATE_DT] [datetime2](0) NULL,
 CONSTRAINT [PK_user_groups_map_AUTOGEN_USER_GROUPS_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_GROUPS_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_inventory_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_inventory_map](
	[AUTOGEN_USER_INVENTORY_MAP_ID] [bigint] IDENTITY(27,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[INVENTORY_REGION_ID] [bigint] NULL,
	[INVENTORY_REGION_NAME] [nvarchar](30) NULL,
	[INVENTORY_CENTER_ID] [bigint] NULL,
	[INVENTORY_CENTER_NAME] [nvarchar](30) NULL,
	[INVENTORY_CLIENT_ID] [bigint] NULL,
	[INVENTORY_CLIENT_NAME] [nvarchar](30) NULL,
	[INVENTORY_PROCESS_ID] [bigint] NULL,
	[INVENTORY_PROCESS_NAME] [nvarchar](30) NULL,
	[INVENTORY_CATEGORY_ID] [bigint] NULL,
	[INVENTORY_CATEGORY_NAME] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_user_inventory_map_AUTOGEN_USER_INVENTORY_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_INVENTORY_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_leave_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_leave_details](
	[AUTOGEN_USER_LEAVE_DETAILS_ID] [bigint] IDENTITY(5,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[FROM_DATE] [datetime2] NULL,
	[TO_DATE] [datetime2] NULL,
	[NO_OF_DAYS] [bigint] NULL,
	[REASONS] [nvarchar](100) NULL,
	[COMMENTS] [nvarchar](100) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[CREATED_BY] [nvarchar](20) NULL,
	[UPDATED_BY] [nvarchar](20) NULL,
	[STATUS] [nvarchar](45) NULL,
 CONSTRAINT [PK_user_leave_details_AUTOGEN_USER_LEAVE_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_LEAVE_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_report_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_report_map](
	[AUTOGEN_USER_REPORT_MAP_ID] [bigint] IDENTITY(3,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[AUTOGEN_REPORT_MASTER_ID] [bigint] NULL,
	[REPORT_NAME] [nvarchar](100) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_user_report_map_AUTOGEN_USER_REPORT_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_REPORT_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_roles_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_roles_map](
	[AUTOGEN_USER_ROLES_MAP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[AUTOGEN_ROLES_ID] [bigint] NOT NULL,
	[ROLES_NAME] [nvarchar](30) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_user_domain_map_AUTOGEN_USER_ROLES_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_ROLES_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_roles_map_approved]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_roles_map_approved](
	[AUTOGEN_USER_ROLES_MAP_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_USERS_DETAILS_ID] [bigint] NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[AUTOGEN_ROLES_ID] [bigint] NOT NULL,
	[ROLES_NAME] [nvarchar](30) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_user_domain_map_APP_AUTOGEN_USER_ROLES_MAP_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USER_ROLES_MAP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_screen_map]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_screen_map](
	[AUTOGEN_USER_SCREEN_MAP_ID] [bigint] IDENTITY(29,1) NOT NULL,
	[ROLES_NAME] [nvarchar](30) NOT NULL,
	[AUTOGEN_MODULE_MASTER_ID] [bigint] NOT NULL,
	[MODULE_UID] [nvarchar](100) NOT NULL,
	[MODULE_NAME] [nvarchar](100) NULL,
	[AUTOGEN_SCREEN_MASTER_ID] [bigint] NOT NULL,
	[SCREEN_UID] [nvarchar](100) NOT NULL,
	[SCREEN_NAME] [nvarchar](100) NULL,
	[ACCESS_PERMISSION] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[AUTOGEN_ROLE_ID] [bigint] NULL,
 CONSTRAINT [PK_user_screen_map_ROLES_NAME] PRIMARY KEY CLUSTERED 
(
	[ROLES_NAME] ASC,
	[MODULE_UID] ASC,
	[SCREEN_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_screen_map_approved]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_screen_map_approved](
	[AUTOGEN_USER_SCREEN_MAP_ID] [bigint] NOT NULL,
	[AUTOGEN_ROLE_ID] [bigint] NULL,
	[ROLES_NAME] [nvarchar](30) NOT NULL,
	[AUTOGEN_MODULE_MASTER_ID] [bigint] NOT NULL,
	[MODULE_UID] [nvarchar](100) NOT NULL,
	[MODULE_NAME] [nvarchar](100) NULL,
	[AUTOGEN_SCREEN_MASTER_ID] [bigint] NOT NULL,
	[SCREEN_UID] [nvarchar](100) NOT NULL,
	[SCREEN_NAME] [nvarchar](100) NULL,
	[ACCESS_PERMISSION] [nvarchar](30) NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[user_survey_mapping]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[user_survey_mapping](
	[autogen_id] [bigint] IDENTITY(33,1) NOT NULL,
	[autogen_user_id] [bigint] NOT NULL,
	[employee_id] [nvarchar](255) NULL,
	[survey_id] [int] NOT NULL,
	[survey_name] [nvarchar](255) NOT NULL,
	[status] [nvarchar](45) NULL,
	[created_by] [nvarchar](255) NULL,
	[rec_add_dt] [datetime2](0) NULL,
	[updated_by] [nvarchar](255) NULL,
	[rec_update_dt] [datetime2](0) NULL,
 CONSTRAINT [PK_user_survey_mapping_autogen_id] PRIMARY KEY CLUSTERED 
(
	[autogen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[users]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[users](
	[AUTOGEN_USERS_ID] [bigint] IDENTITY(37,1) NOT NULL,
	[EMPLOYEE_ID] [nvarchar](20) NOT NULL,
	[PASSWORD] [nvarchar](500) NOT NULL,
	[FIRST_NAME] [nvarchar](30) NULL,
	[LAST_NAME] [nvarchar](30) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[MOBILE_NUMBER] [nvarchar](20) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[Approved_UserId] [varchar](50) NULL,
 CONSTRAINT [PK_users_AUTOGEN_USERS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USERS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [users$EMPLOYEE_ID_UNIQUE] UNIQUE NONCLUSTERED 
(
	[EMPLOYEE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[users_approved]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[users_approved](
	[AUTOGEN_USERS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EMPLOYEE_ID] [nvarchar](20) NOT NULL,
	[PASSWORD] [nvarchar](500) NOT NULL,
	[FIRST_NAME] [nvarchar](30) NULL,
	[LAST_NAME] [nvarchar](30) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[MOBILE_NUMBER] [nvarchar](20) NULL,
	[EDIT_FLAG] [bit] NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
	[STATUS] [nvarchar](10) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[APPROVED_BY] [nvarchar](30) NULL,
	[APROVER_COMMENT] [nvarchar](230) NULL,
	[LAST_LOGIN_TIME] [datetime] NULL,
	[APPROVED_ON] [datetime] NULL,
 CONSTRAINT [PK_users_approved_AUTOGEN_USERS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USERS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [users$EMPLOYEE_ID_UNIQUE_APP] UNIQUE NONCLUSTERED 
(
	[EMPLOYEE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[users_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[users_details](
	[AUTOGEN_USERS_DETAILS_ID] [bigint] IDENTITY(15,1) NOT NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[SUPERVISOR_USERS_ID] [nvarchar](30) NULL,
	[SUPERVISOR_USERS_NAME] [nvarchar](30) NULL,
	[INVENTORY_CATEGORY_ID] [bigint] NULL,
	[INVENTORY_CATEGORY_NAME] [nvarchar](30) NULL,
	[AUTOGEN_ROLES_ID] [bigint] NULL,
	[ROLES_NAME] [nvarchar](45) NULL,
	[DOMAIN_ID] [int] NULL,
	[DOMAIN_NAME] [nvarchar](50) NULL,
	[BU_ID] [int] NULL,
	[BU_NAME] [nvarchar](50) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_users_details_AUTOGEN_USERS_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USERS_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[users_details_approved]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[users_details_approved](
	[AUTOGEN_USERS_DETAILS_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[AUTOGEN_USERS_ID] [bigint] NULL,
	[SUPERVISOR_USERS_ID] [nvarchar](30) NULL,
	[SUPERVISOR_USERS_NAME] [nvarchar](30) NULL,
	[INVENTORY_CATEGORY_ID] [bigint] NULL,
	[INVENTORY_CATEGORY_NAME] [nvarchar](30) NULL,
	[AUTOGEN_ROLES_ID] [bigint] NULL,
	[ROLES_NAME] [nvarchar](45) NULL,
	[DOMAIN_ID] [int] NULL,
	[DOMAIN_NAME] [nvarchar](50) NULL,
	[BU_ID] [int] NULL,
	[BU_NAME] [nvarchar](50) NULL,
	[CREATED_BY] [nvarchar](30) NULL,
	[UPDATED_BY] [nvarchar](30) NULL,
	[REC_ADD_DT] [datetime] NULL,
	[REC_UPDATE_DT] [datetime] NULL,
 CONSTRAINT [PK_users_details_APP_AUTOGEN_USERS_DETAILS_ID] PRIMARY KEY CLUSTERED 
(
	[AUTOGEN_USERS_DETAILS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [user_rule].[variable_inventory_temp]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[variable_inventory_temp](
	[variable_id] [bigint] IDENTITY(10,1) NOT NULL,
	[variable_name] [varchar](45) NOT NULL,
	[data_type] [varchar](45) NOT NULL,
	[property_id] [int] NOT NULL,
	[property_name] [varchar](45) NOT NULL,
	[category_id] [int] NOT NULL,
	[category_name] [varchar](45) NOT NULL,
	[channel_id] [int] NOT NULL,
	[channel_name] [varchar](45) NOT NULL,
	[active_status] [binary](1) NOT NULL,
	[created_date] [date] NOT NULL,
	[updated_date] [date] NOT NULL,
	[user_id] [varchar](45) NOT NULL,
	[domain_id] [int] NOT NULL,
	[domain_name] [varchar](45) NOT NULL,
	[bu_id] [int] NOT NULL,
	[bu_name] [varchar](45) NOT NULL,
	[approve_status] [varchar](45) NULL,
 CONSTRAINT [PK_variable_inventory_temp_variable_id] PRIMARY KEY CLUSTERED 
(
	[variable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[variance_auditor_score_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [user_rule].[variance_auditor_score_details](
	[variance_auditor_score_id] [int] IDENTITY(499,1) NOT NULL,
	[AUDITOR_ID] [nvarchar](45) NOT NULL,
	[AUDITOR_NAME] [nvarchar](45) NOT NULL,
	[no_of_rating] [nvarchar](45) NULL,
	[no_of_rating_match] [nvarchar](45) NULL,
	[Score] [nvarchar](45) NULL,
	[parameter_variance] [nvarchar](45) NULL,
	[score_variance] [nvarchar](45) NULL,
	[MSISDN] [nvarchar](45) NOT NULL,
	[STATUS] [nvarchar](45) NOT NULL,
	[MASTER_FLAG] [binary](1) NULL,
	[created_date] [datetime2] NOT NULL,
	[updated_date] [datetime2] NULL,
 CONSTRAINT [PK_variance_auditor_score_details_variance_auditor_score_id] PRIMARY KEY CLUSTERED 
(
	[variance_auditor_score_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [variance_auditor_score_details$variance_auditor_score_id_UNIQUE] UNIQUE NONCLUSTERED 
(
	[variance_auditor_score_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [user_rule].[variance_call_details]    Script Date: 18-Oct-22 2:45:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [user_rule].[variance_call_details](
	[Call_Details_ID] [int] IDENTITY(36,1) NOT NULL,
	[MSISDN] [nvarchar](45) NOT NULL,
	[CALL_DATE] [datetime2] NOT NULL,
	[MASTER_AUDITOR_ID] [nvarchar](45) NOT NULL,
	[REGION] [nvarchar](45) NOT NULL,
	[CENTER] [nvarchar](45) NOT NULL,
	[CLIENT] [nvarchar](45) NOT NULL,
	[PROCESS] [nvarchar](45) NOT NULL,
	[OVERALL_SCORE_VARIANCE] [nvarchar](45) NULL,
	[OVERALL_PARAMETER_VARIANCE] [nvarchar](45) NULL,
	[AVERAGE_AUDITORS_SCORE] [nvarchar](45) NULL,
	[STATUS] [nvarchar](45) NOT NULL,
	[overall_rating_match] [nvarchar](45) NULL,
 CONSTRAINT [PK_variance_call_details_Call_Details_ID] PRIMARY KEY CLUSTERED 
(
	[Call_Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [variance_call_details$Call_Details_ID_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Call_Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (NULL) FOR [AGENT_ID]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (NULL) FOR [AGENT_NAME]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (NULL) FOR [AUDITOR_ID]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (NULL) FOR [AUDITOR_NAME]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[agent_mapping] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [INVENTORY_CLIENT_ID]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [INVENTORY_CLIENT_NAME]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [EMAIL]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [MOBILE_NUMBER]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [INVENTORY_REGION_ID]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [INVENTORY_REGION_NAME]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [INVENTORY_CENTER_ID]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [INVENTORY_CENTER_NAME]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [LOGO_NAME]
GO
ALTER TABLE [user_rule].[client_details] ADD  DEFAULT (NULL) FOR [LOGO_TYPE]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_CONTACT_DETAILS_ID]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [INVENTORY_PROCESS_ID]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [INVENTORY_PROCESS_NAME]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_REPORT_MASTER_ID]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [REPORT_NAME]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_FREQUENCY_MASTER_ID]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (NULL) FOR [FREQUENCY_NAME]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[client_report_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (NULL) FOR [AUTOGEN_CLIENT_DETAILS_ID]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (NULL) FOR [PERSON_NAME]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (NULL) FOR [EMAIL]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (NULL) FOR [MOBILE_NUMBER]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (NULL) FOR [NOTIFICATION_STATUS]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[contact_details] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AGENT_CATEGORY]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AGENT_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AGENT_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [IS_ASSIGNED]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [ASSIGNED_AUDITOR_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [ASSIGNED_AUDITOR_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AUDITOR_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AUDITOR_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AUDDITOR_UPDATED_DATE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [IS_CALIBRATION]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_NATURE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_TYPE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CENTER_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CENTER_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CLIENT_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CLIENT_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CREATED_DATE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [DATE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [PARENT_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [MASTER_RECORD]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [MSISDN]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [PROCESS_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [PROCESS_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [REGION_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [REGION_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [REQUEST_TYPE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [STATUS]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (nchar((0))) FOR [AGENT_AUDIT_STATUS]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (getdate()) FOR [UPDATED_DATE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [EVALUATION_FORM]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_SUB_TYPE_1]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_SUB_TYPE_2]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_SUB_TYPE_3]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_SUB_TYPE_4]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CASE_TYPE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [SKILL_SET_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [TENURE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [TL_NAME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [TL_ID]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [START_TIME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [END_TIME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [CALL_DATE]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [HANDLING_TIME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AUDIT_STARTTIME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (NULL) FOR [AUDIT_ENDTIME]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT ((0)) FOR [AUDIT_MINUTES]
GO
ALTER TABLE [user_rule].[evaluation_record] ADD  DEFAULT (nchar((0))) FOR [PROCESS_FLAG]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (NULL) FOR [FREQUENCY_NAME]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (NULL) FOR [DURATION_DAYS_COUNT]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[frequency_master] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_REGION_ID]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_REGION_NAME]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_CENTER_ID]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_CENTER_NAME]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_CLIENT_ID]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_CLIENT_NAME]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_PROCESS_ID]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (NULL) FOR [INVENTORY_PROCESS_NAME]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[inventory_mapping] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (NULL) FOR [INVENTORY_TYPE]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (NULL) FOR [NAME]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[inventory_master] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (NULL) FOR [EMPLOYEE_ID]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (getdate()) FOR [LOGIN_TIME]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (NULL) FOR [LOGOUT_TIME]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (NULL) FOR [NO_OF_ATTEMPT]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (NULL) FOR [REMARKS]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[login_details] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (NULL) FOR [MODULE_UID]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (NULL) FOR [MODULE_NAME]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[module_master] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[report_master] ADD  DEFAULT (NULL) FOR [REPORT_NAME]
GO
ALTER TABLE [user_rule].[report_master] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[report_master] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[report_master] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[report_master] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[report_master] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_ROLES_ID]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_MODULE_MASTER_ID]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (NULL) FOR [ACCESS_TYPE]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[role_access_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT (NULL) FOR [ROLES_NAME]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT (NULL) FOR [STATUS]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[roles] ADD  DEFAULT ('New') FOR [ROLE_CREATE_STATUS]
GO
ALTER TABLE [user_rule].[roles_approved] ADD  DEFAULT (getdate()) FOR [APPROVED_ON]
GO
ALTER TABLE [user_rule].[rule_config_details_temp] ADD  DEFAULT (NULL) FOR [rule_description]
GO
ALTER TABLE [user_rule].[rule_config_details_temp] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [overall_max_score]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [overall_actual_score]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [overall_attribute_score]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [evaluation_record_id]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (N'N') FOR [fatal]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [max_score_fatal]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [actual_score_fatal]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (NULL) FOR [overall_score_fatal]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (N'System') FOR [created_by]
GO
ALTER TABLE [user_rule].[score_calculation] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (NULL) FOR [QUALITY_PARAM]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (NULL) FOR [QUALITY_ATTRIBUTE]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (NULL) FOR [ATTRIBUTE_SCORE]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (getdate()) FOR [UPDATED_DATE]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (NULL) FOR [QUESTION]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (NULL) FOR [QUESTION_SCORE]
GO
ALTER TABLE [user_rule].[score_calculation_rpt] ADD  DEFAULT (NULL) FOR [RATING_FLAG]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_MODULE_MASTER_ID]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_SCREEN_MASTER_ID]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[screen_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (NULL) FOR [SCREEN_UID]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (NULL) FOR [SCREEN_NAME]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[screen_master] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (NULL) FOR [TOKEN]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (NULL) FOR [REFRESH_TOKEN]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (NULL) FOR [expiry_seconds]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (NULL) FOR [expiry_Date]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[token_details] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_DETAILS_ID]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_ID]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [DOMAIN_ID]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [DOMAIN_NAME]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [BUSINESS_UNIT_ID]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [BUSINESS_UNIT_NAME]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [CATEGORY_ID]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (NULL) FOR [CATEGORY_NAME]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_domain_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_DETAILS_ID]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_ID]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [DOMAIN_ID]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [DOMAIN_NAME]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [BUSINESS_UNIT_ID]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [BUSINESS_UNIT_NAME]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [CATEGORY_ID]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (NULL) FOR [CATEGORY_NAME]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_domain_map_approved] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_groups] ADD  DEFAULT (NULL) FOR [GROUP_NAME]
GO
ALTER TABLE [user_rule].[user_groups] ADD  DEFAULT (NULL) FOR [GROUP_ID]
GO
ALTER TABLE [user_rule].[user_groups] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_groups] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_groups] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_groups_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_ID]
GO
ALTER TABLE [user_rule].[user_groups_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_groups_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_groups_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_DETAILS_ID]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_REGION_ID]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_REGION_NAME]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_CENTER_ID]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_CENTER_NAME]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_CLIENT_ID]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_CLIENT_NAME]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_PROCESS_ID]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_PROCESS_NAME]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_CATEGORY_ID]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (NULL) FOR [INVENTORY_CATEGORY_NAME]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_inventory_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_DETAILS_ID]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (NULL) FOR [FROM_DATE]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (NULL) FOR [TO_DATE]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (NULL) FOR [NO_OF_DAYS]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (NULL) FOR [REASONS]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (NULL) FOR [COMMENTS]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_leave_details] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_DETAILS_ID]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (NULL) FOR [AUTOGEN_REPORT_MASTER_ID]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (NULL) FOR [REPORT_NAME]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_report_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_roles_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_roles_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_roles_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_roles_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_roles_map_approved] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_roles_map_approved] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_roles_map_approved] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_roles_map_approved] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (NULL) FOR [MODULE_NAME]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (NULL) FOR [SCREEN_NAME]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (NULL) FOR [ACCESS_PERMISSION]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (N'ACTIVE') FOR [STATUS]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[user_screen_map] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[user_survey_mapping] ADD  DEFAULT (NULL) FOR [employee_id]
GO
ALTER TABLE [user_rule].[user_survey_mapping] ADD  DEFAULT (NULL) FOR [status]
GO
ALTER TABLE [user_rule].[user_survey_mapping] ADD  DEFAULT (N'System') FOR [created_by]
GO
ALTER TABLE [user_rule].[user_survey_mapping] ADD  DEFAULT (getdate()) FOR [rec_add_dt]
GO
ALTER TABLE [user_rule].[user_survey_mapping] ADD  DEFAULT (N'System') FOR [updated_by]
GO
ALTER TABLE [user_rule].[user_survey_mapping] ADD  DEFAULT (getdate()) FOR [rec_update_dt]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (NULL) FOR [FIRST_NAME]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (NULL) FOR [LAST_NAME]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (NULL) FOR [EMAIL]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (NULL) FOR [MOBILE_NUMBER]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (NULL) FOR [STATUS]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[users] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [FIRST_NAME]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [LAST_NAME]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [EMAIL]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [MOBILE_NUMBER]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [EDIT_FLAG]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [STATUS]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [APPROVED_BY]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (NULL) FOR [APROVER_COMMENT]
GO
ALTER TABLE [user_rule].[users_approved] ADD  DEFAULT (getdate()) FOR [APPROVED_ON]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_ID]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [SUPERVISOR_USERS_ID]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [SUPERVISOR_USERS_NAME]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [INVENTORY_CATEGORY_ID]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [INVENTORY_CATEGORY_NAME]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [AUTOGEN_ROLES_ID]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [ROLES_NAME]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [DOMAIN_ID]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [DOMAIN_NAME]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [BU_ID]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (NULL) FOR [BU_NAME]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[users_details] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [AUTOGEN_USERS_ID]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [SUPERVISOR_USERS_ID]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [SUPERVISOR_USERS_NAME]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [INVENTORY_CATEGORY_ID]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [INVENTORY_CATEGORY_NAME]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [AUTOGEN_ROLES_ID]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [ROLES_NAME]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [DOMAIN_ID]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [DOMAIN_NAME]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [BU_ID]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (NULL) FOR [BU_NAME]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (N'System') FOR [CREATED_BY]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (N'System') FOR [UPDATED_BY]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (getdate()) FOR [REC_ADD_DT]
GO
ALTER TABLE [user_rule].[users_details_approved] ADD  DEFAULT (getdate()) FOR [REC_UPDATE_DT]
GO
ALTER TABLE [user_rule].[variable_inventory_temp] ADD  DEFAULT (N'NEW') FOR [approve_status]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (NULL) FOR [no_of_rating]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (NULL) FOR [no_of_rating_match]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (NULL) FOR [Score]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (NULL) FOR [parameter_variance]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (NULL) FOR [score_variance]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (0x00) FOR [MASTER_FLAG]
GO
ALTER TABLE [user_rule].[variance_auditor_score_details] ADD  DEFAULT (NULL) FOR [updated_date]
GO
ALTER TABLE [user_rule].[variance_call_details] ADD  DEFAULT (NULL) FOR [OVERALL_SCORE_VARIANCE]
GO
ALTER TABLE [user_rule].[variance_call_details] ADD  DEFAULT (NULL) FOR [OVERALL_PARAMETER_VARIANCE]
GO
ALTER TABLE [user_rule].[variance_call_details] ADD  DEFAULT (NULL) FOR [AVERAGE_AUDITORS_SCORE]
GO
ALTER TABLE [user_rule].[variance_call_details] ADD  DEFAULT (NULL) FOR [overall_rating_match]
GO
ALTER TABLE [user_rule].[rule_action_details_temp]  WITH NOCHECK ADD  CONSTRAINT [rule_action_details_temp$action_rule_id_temp] FOREIGN KEY([rule_id])
REFERENCES [user_rule].[rule_config_details_temp] ([rule_id])
GO
ALTER TABLE [user_rule].[rule_action_details_temp] CHECK CONSTRAINT [rule_action_details_temp$action_rule_id_temp]
GO
