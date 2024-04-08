/****** METADATA Scripts    Script Date: 10/19/2022 11:30:00 ******/
USE [IVRrule_ngdb]
GO
SET ANSI_PADDING OFF
GO

GO
SET IDENTITY_INSERT [rule_engine].[category_mast] ON 

INSERT [rule_engine].[category_mast] ([category_id], [category_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (1, N'Demographic', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[category_mast] ([category_id], [category_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (2, N'Relationship', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[category_mast] ([category_id], [category_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (3, N'Behaviour', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[category_mast] ([category_id], [category_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (4, N'Response', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[category_mast] ([category_id], [category_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (7, N'Personal', 1, getdate(), getdate(), N'DBA')
SET IDENTITY_INSERT [rule_engine].[category_mast] OFF

GO
SET IDENTITY_INSERT [rule_engine].[channel_mast] ON 

INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (1, N'ALL', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (2, N'Mobile', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (3, N'Whatsapp', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (4, N'IVR', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (5, N'Online', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (6, N'Agent', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (7, N'Web', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (8, N'CTI', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (9, N'Mail', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[channel_mast] ([channel_id], [channel_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (10, N'Facebook', 1, getdate(), getdate(), N'DBA')
SET IDENTITY_INSERT [rule_engine].[channel_mast] OFF

GO
SET IDENTITY_INSERT [rule_engine].[domain_mast] ON 

INSERT [rule_engine].[domain_mast] ([domain_id], [domain_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (1, N'Banking', 1, getdate(), getdate(), N'DBA')

/* Additional domains - Commented  */
/*
INSERT [rule_engine].[domain_mast] ([domain_id], [domain_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (2, N'Telecom', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[domain_mast] ([domain_id], [domain_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (4, N'Finance', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[domain_mast] ([domain_id], [domain_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (5, N'Healthcare', 0, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[domain_mast] ([domain_id], [domain_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (6, N'marketing', 1, getdate(), getdate(), N'DBA')
INSERT [rule_engine].[domain_mast] ([domain_id], [domain_name], [active_status], [created_date], [updated_date], [user_id]) VALUES (7, N'n', 0, getdate(), getdate(), N'DBA')
*/

SET IDENTITY_INSERT [rule_engine].[domain_mast] OFF

GO
SET IDENTITY_INSERT [rule_engine].[business_unit_mast] ON 

INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (1, N'Retail', 1, getdate(), getdate(), N'DBA', 1)

/* Additional Business Units  - Commented*/
/*
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (2, N'Whole sale', 1, getdate(), getdate(), N'DBA', 1)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (3, N'Inbound', 1, getdate(), getdate(), N'DBA', 2)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (4, N'Outbound', 0, getdate(), getdate(), N'DBA', 2)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (6, N'Wealth management', 0, getdate(), getdate(), N'DBA', 1)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (7, N'Collections', 1, getdate(), getdate(), N'DBA', 2)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (8, N'Marketing', 1, getdate(), getdate(), N'DBA', 4)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (9, N'Payroll', 1, getdate(), getdate(), N'DBA', 4)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (10, N'IT', 0, getdate(), getdate(), N'DBA', 4)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (11, N'Retail Pharmacy', 0, getdate(), getdate(), N'DBA', 5)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (12, N'Fitness Centre', 0, getdate(), getdate(), N'DBA', 5)
INSERT [rule_engine].[business_unit_mast] ([bu_id], [bu_name], [active_status], [created_date], [updated_date], [user_id], [domain_id]) VALUES (13, N'Life Insurance', 0, getdate(), getdate(), N'DBA', 5)
*/

SET IDENTITY_INSERT [rule_engine].[business_unit_mast] OFF
