USE [IVRrule_engdb_UM]
GO
SET IDENTITY_INSERT [user_rule].[module_master] ON 
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, N'DOMAIN_MASTER', N'Domain Master', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (2, N'MAP_DOMAINS', N'Map Domain and Business Units', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (3, N'VARIABLES_MASTER', N'Parameter Master', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (4, N'UNAPPROVED_RULES', N'Define Rules', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (5, N'RULE_DEFINITIONS', N'Approved Rules', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (6, N'RULE_UTIL', N'Rule Utility', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (7, N'GROUP_RULES', N'Group Rules', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (8, N'TRIGGER_RULE', N'Simulator', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (9, N'USER_MANAGEMENT', N'User Management', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (10, N'ROLE_MANAGEMENT', N'Role Management', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (11, N'CUSTOMER_INSIGHT', N'Customer Insight', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (12, N'REPORTS', N'Reports', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (13, N'user_rule', N'user_rule', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (14, N'SEARCH_SCREEN', N'Search Screen', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[module_master] ([AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (15, N'DEPLOY_SCREEN', N'Deploy Screen', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())


GO
SET IDENTITY_INSERT [user_rule].[module_master] OFF

/*
GO
SET IDENTITY_INSERT [user_rule].[report_master] ON 

INSERT [user_rule].[report_master] ([AUTOGEN_REPORT_MASTER_ID], [REPORT_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, N'Individual Question Based Statics Report', N'ACTIVE', N'DBA', NULL, getdate(), NULL)
INSERT [user_rule].[report_master] ([AUTOGEN_REPORT_MASTER_ID], [REPORT_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (2, N'Summary user_rule on Customer Responses', N'ACTIVE', N'DBA', NULL, getdate(), NULL)
SET IDENTITY_INSERT [user_rule].[report_master] OFF
*/

GO
SET IDENTITY_INSERT [user_rule].[roles] ON 
GO
INSERT [user_rule].[roles] ([AUTOGEN_ROLES_ID], [ROLES_NAME], [STATUS], [REC_ADD_DT], [REC_UPDATE_DT], [CREATED_BY], [UPDATED_BY], [description], [ROLE_CREATE_STATUS]) VALUES (1, N'Super Admin', N'ACTIVE', getdate(), getdate(), N'DBA', N'DBA', N'description', N'Approved')

SET IDENTITY_INSERT [user_rule].[roles] OFF

GO
INSERT [user_rule].[roles_approved] ([AUTOGEN_ROLES_ID], [ROLES_NAME], [DESCRIPTION], [STATUS], [ROLE_CREATE_STATUS], [REC_ADD_DT], [REC_UPDATE_DT], [CREATED_BY], [UPDATED_BY], [APPROVED_BY], [comment], [edit_flag]) VALUES (1, N'Super Admin', NULL, N'ACTIVE', N'Approved', getdate(), getdate(), N'DBA', N'DBA', N'DBA', N'DBA', 0)
/*
GO
SET IDENTITY_INSERT [user_rule].[role_access_map] ON 
GO
INSERT [user_rule].[role_access_map] ([AUTOGEN_ROLE_ACCESS_MAP_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [ACCESS_TYPE], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, 1, N'Super Admin', 1, N'DOMAIN_MASTER', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA',getdate(), getdate())
INSERT [user_rule].[role_access_map] ([AUTOGEN_ROLE_ACCESS_MAP_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [ACCESS_TYPE], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (2, 1, N'Super Admin', 2, N'MAP_DOMAINS', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA',getdate(), getdate())
INSERT [user_rule].[role_access_map] ([AUTOGEN_ROLE_ACCESS_MAP_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [ACCESS_TYPE], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (9, 1, N'Super Admin', 9, N'USER_MANAGEMENT', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA',getdate(), getdate())
INSERT [user_rule].[role_access_map] ([AUTOGEN_ROLE_ACCESS_MAP_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [ACCESS_TYPE], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (10, 1, N'Super Admin', 10, N'ROLE_MANAGEMENT', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA',getdate(), getdate())
INSERT [user_rule].[role_access_map] ([AUTOGEN_ROLE_ACCESS_MAP_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [ACCESS_TYPE], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (11, 1, N'Super Admin', 11, N'CUSTOMER_INSIGHT', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', CAST(N'2020-10-14T03:28:29.000' AS DateTime), getdate())
INSERT [user_rule].[role_access_map] ([AUTOGEN_ROLE_ACCESS_MAP_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [ACCESS_TYPE], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (12, 1, N'Super Admin', 12, N'REPORTS', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA',getdate(), getdate())

GO
SET IDENTITY_INSERT [user_rule].[role_access_map] OFF
*/

GO
SET IDENTITY_INSERT [user_rule].[users_approved] ON 

INSERT [user_rule].[users_approved] ([AUTOGEN_USERS_ID], [EMPLOYEE_ID], [PASSWORD], [FIRST_NAME], [LAST_NAME], [EMAIL], [MOBILE_NUMBER], [EDIT_FLAG], [REC_ADD_DT], [REC_UPDATE_DT], [STATUS], [CREATED_BY], [UPDATED_BY], [APPROVED_BY], [APROVER_COMMENT]) VALUES (1, N'SuperAdmin', N'$2a$10$xaB352fwWRbjKLM1NxZHv.NKCkfwTT2Z7F/8Nxzz0yB8gXyAnihHy', N'SuperAdmin', N'SuperAdmin1', N'superAdmin1@gmail.com', N'5644424566', 0, getdate(), getdate(), N'ACTIVE', N'DBA', N'DBA', N'DBA', NULL)

SET IDENTITY_INSERT [user_rule].[users_approved] OFF
GO
SET IDENTITY_INSERT [user_rule].[users_details_approved] ON 

INSERT [user_rule].[users_details_approved] ([AUTOGEN_USERS_DETAILS_ID], [AUTOGEN_USERS_ID], [SUPERVISOR_USERS_ID], [SUPERVISOR_USERS_NAME], [INVENTORY_CATEGORY_ID], [INVENTORY_CATEGORY_NAME], [AUTOGEN_ROLES_ID], [ROLES_NAME], [DOMAIN_ID], [DOMAIN_NAME], [BU_ID], [BU_NAME], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, 1, NULL, NULL, NULL, NULL, 1, N'Super Admin', 0, NULL, 0, NULL, N'DBA', N'DBA', getdate(), getdate())

SET IDENTITY_INSERT [user_rule].[users_details_approved] OFF
GO
SET IDENTITY_INSERT [user_rule].[user_domain_map_approved] ON 

INSERT [user_rule].[user_domain_map_approved] ([AUTOGEN_USER_DOMAIN_MAP_ID], [AUTOGEN_USERS_DETAILS_ID], [AUTOGEN_USERS_ID], [DOMAIN_ID], [DOMAIN_NAME], [BUSINESS_UNIT_ID], [BUSINESS_UNIT_NAME], [CATEGORY_ID], [CATEGORY_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (30021, 1, 1, 1, N'Banking', 1, N'Retail', NULL, NULL, N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
SET IDENTITY_INSERT [user_rule].[user_domain_map_approved] OFF

GO
SET IDENTITY_INSERT [user_rule].[user_roles_map_approved] ON 

INSERT [user_rule].[user_roles_map_approved] ([AUTOGEN_USER_ROLES_MAP_ID], [AUTOGEN_USERS_DETAILS_ID], [AUTOGEN_USERS_ID], [AUTOGEN_ROLES_ID], [ROLES_NAME], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, 1, 1, 1, N'Super Admin', N'DBA', N'DBA', getdate(), getdate())
SET IDENTITY_INSERT [user_rule].[user_roles_map_approved] OFF

GO
SET IDENTITY_INSERT [user_rule].[screen_master] ON 
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, N'DOMAIN_MASTER_HOME', N'Domain Master', N'ACTIVE', N'DBA', N'DBA', getdate(), CAST(N'2020-09-01T23:38:38.000' AS DateTime))
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (2, N'MAP_DOMAINS_HOME', N'Map Domain and Business Units', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (3, N'VARIABLES_MASTER_HOME', N'Parameter Master', N'ACTIVE', N'DBA', N'DBA', getdate(), CAST(N'2020-09-01T23:58:43.000' AS DateTime))
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (4, N'UNAPPROVED_RULES_HOME', N'Define Rules', N'ACTIVE', N'DBA', N'DBA', getdate(), CAST(N'2020-10-14T00:31:15.000' AS DateTime))
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (5, N'RULE_DEFINITIONS_HOME', N'Approved Rules', N'ACTIVE', N'DBA', N'DBA', getdate(), CAST(N'2020-09-01T23:58:43.000' AS DateTime))
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (6, N'RULE_UTIL_HOME', N'Rule Utility', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (7, N'GROUP_RULES_HOME', N'Group Rules', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (8, N'TRIGGER_RULE_HOME', N'Simulator', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (9, N'HOME_USER', N'User Management', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (10, N'ROLE_MANAGEMENT_HOME', N'Role Management', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (11, N'CUSTOMER_INSIGHT', N'Customer Insight', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (12, N'REPORTS', N'Reports', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (13, N'CRM_DATA_FETCH', N'HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (14, N'user_rule_HOME', N'user_rule_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (15, N'SEARCH_SCREEN_HOME', N'SEARCH_SCREEN_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[screen_master] ([AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (16, N'DEPLOY_HOME', N'DEPLOY HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())

GO
SET IDENTITY_INSERT [user_rule].[screen_master] OFF

GO
SET IDENTITY_INSERT [user_rule].[screen_map] ON 
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (1, 1, N'DOMAIN_MASTER', 1, N'DOMAIN_MASTER_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Domain Master', N'Domain Master','READ,MAKER,CHECKER',1)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (2, 2, N'MAP_DOMAINS', 2, N'MAP_DOMAINS_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Map Domain and Business Units', N'Map Domain and Business Units','READ,MAKER,CHECKER',1)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (3, 3, N'VARIABLES_MASTER', 3, N'VARIABLES_MASTER_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Parameter Master', N'Parameter Master',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (4, 4, N'UNAPPROVED_RULES', 4, N'UNAPPROVED_RULES_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Define Rules', N'Define Rules',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (5, 5, N'RULE_DEFINITIONS', 5, N'RULE_DEFINITIONS_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Approved Rules', N'Approved Rules',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (6, 6, N'RULE_UTIL', 6, N'RULE_UTIL_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Rule Utility', N'Rule Utility',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (7, 7, N'GROUP_RULES', 7, N'GROUP_RULES_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Group Rules', N'Group Rules',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (8, 8, N'TRIGGER_RULE', 8, N'TRIGGER_RULE_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Simulator', N'Simulator',N'READ',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (9, 9, N'USER_MANAGEMENT', 9, N'HOME_USER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'User Management', N'User Management',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (10, 10, N'ROLE_MANAGEMENT', 10, N'ROLE_MANAGEMENT_HOME', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Role Management', N'Role Management',N'READ,MAKER,CHECKER',0)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (11, 11, N'CUSTOMER_INSIGHT', 11, N'CRM_DATA_FETCH', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Customer Insight', N'Customer Insight','READ,MAKER,CHECKER',1)
GO
INSERT [user_rule].[screen_map] ([AUTOGEN_SCREEN_MAP_ID], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT], [module_Name], [screen_Name],[ACCESS_PERMISSION],[SUPER_ADMIN_ACCESS]) VALUES (12, 12, N'REPORTS', 12, N'REPORTS', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate(), N'Reports', N'Reports',N'READ',0)

GO
SET IDENTITY_INSERT [user_rule].[screen_map] OFF

GO
SET IDENTITY_INSERT [user_rule].[user_screen_map] ON

/**Super Admin **/
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, 1, N'Super Admin', 1, N'DOMAIN_MASTER', N'Domain Master', 1, N'DOMAIN_MASTER_HOME', N'Domain Master Home', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (2, 1, N'Super Admin', 2, N'MAP_DOMAINS', N'Map Domain and Business Units', 2, N'MAP_DOMAINS_HOME', N'Map Domain and Business Units', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (3, 1, N'Super Admin', 3, N'VARIABLES_MASTER', N'Parameter Master', 3, N'VARIABLES_MASTER_HOME', N'Parameter Master', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (4, 1, N'Super Admin', 4, N'UNAPPROVED_RULES', N'Define Rules', 4, N'UNAPPROVED_RULES_HOME', N'Define Rules', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (5, 1, N'Super Admin', 5, N'RULE_DEFINITIONS', N'Approved Rules', 5, N'RULE_DEFINITIONS_HOME', N'Approved Rules', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (6, 1, N'Super Admin', 6, N'RULE_UTIL', N'Rule Utility', 6, N'RULE_UTIL_HOME', N'Rule Utility', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (7, 1, N'Super Admin', 7, N'GROUP_RULES', N'Group Rules', 7, N'GROUP_RULES_HOME', N'GROUP_RULES_HOME', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (8, 1, N'Super Admin', 8, N'TRIGGER_RULE', N'Simulator', 8, N'TRIGGER_RULE_HOME', N'Simulator', N'READ', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (9, 1, N'Super Admin', 9, N'USER_MANAGEMENT', N'User Management', 9, N'HOME_USER', N'User Management', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (10, 1, N'Super Admin', 10, N'ROLE_MANAGEMENT', N'Role Management', 10, N'ROLE_MANAGEMENT_HOME', N'Role Management', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (11, 1, N'Super Admin', 11, N'CUSTOMER_INSIGHT', N'Customer Insight', 11, N'CUSTOMER_INSIGHT', N'Customer Insight', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (12, 1, N'Super Admin', 12, N'REPORTS', N'Reports', 12, N'REPORTS', N'Reports', N'READ', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())

SET IDENTITY_INSERT [user_rule].[user_screen_map] OFF


GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, 1, N'Super Admin', 1, N'DOMAIN_MASTER', N'Domain Master', 1, N'DOMAIN_MASTER_HOME', N'Domain Master Home', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (2, 1, N'Super Admin', 2, N'MAP_DOMAINS', N'Map Domain and Business Units', 2, N'MAP_DOMAINS_HOME', N'Map Domain and Business Units', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (3, 1, N'Super Admin', 3, N'VARIABLES_MASTER', N'Parameter Master', 3, N'VARIABLES_MASTER_HOME', N'Parameter Master', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (4, 1, N'Super Admin', 4, N'UNAPPROVED_RULES', N'Define Rules', 4, N'UNAPPROVED_RULES_HOME', N'Define Rules', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (5, 1, N'Super Admin', 5, N'RULE_DEFINITIONS', N'Approved Rules', 5, N'RULE_DEFINITIONS_HOME', N'Approved Rules', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (6, 1, N'Super Admin', 6, N'RULE_UTIL', N'Rule Utility', 6, N'RULE_UTIL_HOME', N'Rule Utility', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (7, 1, N'Super Admin', 7, N'GROUP_RULES', N'Group Rules', 7, N'GROUP_RULES_HOME', N'GROUP_RULES_HOME', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (8, 1, N'Super Admin', 8, N'TRIGGER_RULE', N'Simulator', 8, N'TRIGGER_RULE_HOME', N'Simulator', N'READ', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (9, 1, N'Super Admin', 9, N'USER_MANAGEMENT', N'User Management', 9, N'HOME_USER', N'User Management', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (10, 1, N'Super Admin', 10, N'ROLE_MANAGEMENT', N'Role Management', 10, N'ROLE_MANAGEMENT_HOME', N'Role Management', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (11, 1, N'Super Admin', 11, N'CUSTOMER_INSIGHT', N'Customer Insight', 11, N'CUSTOMER_INSIGHT', N'Customer Insight', N'READ,MAKER,CHECKER', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())
GO
INSERT [user_rule].[user_screen_map_approved] ([AUTOGEN_USER_SCREEN_MAP_ID], [AUTOGEN_ROLE_ID], [ROLES_NAME], [AUTOGEN_MODULE_MASTER_ID], [MODULE_UID], [MODULE_NAME], [AUTOGEN_SCREEN_MASTER_ID], [SCREEN_UID], [SCREEN_NAME], [ACCESS_PERMISSION], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (12, 1, N'Super Admin', 12, N'REPORTS', N'Reports', 12, N'REPORTS', N'Reports', N'READ', N'ACTIVE', N'DBA', N'DBA', getdate(), getdate())

/*

GO
SET IDENTITY_INSERT [user_rule].[user_inventory_map] ON 

INSERT [user_rule].[user_inventory_map] ([AUTOGEN_USER_INVENTORY_MAP_ID], [AUTOGEN_USERS_DETAILS_ID], [INVENTORY_REGION_ID], [INVENTORY_REGION_NAME], [INVENTORY_CENTER_ID], [INVENTORY_CENTER_NAME], [INVENTORY_CLIENT_ID], [INVENTORY_CLIENT_NAME], [INVENTORY_PROCESS_ID], [INVENTORY_PROCESS_NAME], [INVENTORY_CATEGORY_ID], [INVENTORY_CATEGORY_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (18, 1, 1, N'UAE', 1, N'Abu Dhabi', 1, N'FDF', 1, N'Survey Process', NULL, NULL, N'INACTIVE', N'DBA', N'DBA', getdate(), getdate())

SET IDENTITY_INSERT [user_rule].[user_inventory_map] OFF
GO
SET IDENTITY_INSERT [user_rule].[user_report_map] ON 
INSERT [user_rule].[user_report_map] ([AUTOGEN_USER_REPORT_MAP_ID], [AUTOGEN_USERS_DETAILS_ID], [AUTOGEN_REPORT_MASTER_ID], [REPORT_NAME], [STATUS], [CREATED_BY], [UPDATED_BY], [REC_ADD_DT], [REC_UPDATE_DT]) VALUES (1, 1, 1, N'Individual Question Based Statics Report', N'INACTIVE', N'DBA', N'DBA', getdate(), getdate())
SET IDENTITY_INSERT [user_rule].[user_report_map] OFF
GO
SET IDENTITY_INSERT [user_rule].[user_survey_mapping] ON 
GO
INSERT [user_rule].[user_survey_mapping] ([autogen_id], [autogen_user_id], [employee_id], [survey_id], [survey_name], [status], [created_by], [rec_add_dt], [updated_by], [rec_update_dt]) VALUES (1, 1, N'SuperAdmin', 1, N'Agent Related', N'ACTIVE', N'Admin', getdate(), N'Admin', getdate())
GO
SET IDENTITY_INSERT [user_rule].[user_survey_mapping] OFF
*/
USE [master]
GO
ALTER DATABASE [IVRrule_ngdb] SET  READ_WRITE 
GO
