prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_default_workspace_id=>1490829234200157
);
end;
/
prompt  WORKSPACE 1490829234200157
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   23:38 Wednesday June 3, 2020
--   Exported By:     PVASSIL
--   Export Type:     Workspace Export
--   Version:         19.1.0.00.15
--   Instance ID:     260125158295479
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_190100
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>1490829234200157);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace PVASSIL...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 1490948284200176
 ,p_provisioning_company_id => 1490829234200157
 ,p_short_name => 'PVASSIL'
 ,p_display_name => 'PVASSIL'
 ,p_first_schema_provisioned => 'PVASSIL'
 ,p_company_schemas => 'PVASSIL'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'PVASSIL'
 ,p_webservice_logging_yn => 'Y'
 ,p_path_prefix => 'PVASSIL'
 ,p_files_version => 1
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1330366998417054,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1330242514417054,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_fnd_user_api.create_user_group (
  p_id => 1330103778417053,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1490779292200157',
  p_user_name                    => 'ADMIN',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'shinnin_ipk@hotmail.com',
  p_web_password                 => '3FA0E3D04BD32E918032B2C85F0B2321FF073CCCE20A855A962C1A5CCEBD993AC8C4497AD6050F09B393A49ED606A187372A6F26381C612D7FFCAEC17DE8D571',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'PVASSIL',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202002222154','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'Y',
  p_first_password_use_occurred  => 'N',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '1500651213205845',
  p_user_name                    => 'PVASSIL',
  p_first_name                   => '',
  p_last_name                    => '',
  p_description                  => '',
  p_email_address                => 'shinnin_ipk@hotmail.com',
  p_web_password                 => 'F4CE11F6100CD86C8934BAF137B85CB44F9D1F822DC7FB837730EFEAF550888142CE930FAA739C2D3527A2558EDC44174EB6C7918724C167CF2B7C06EAB3FE8E',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'PVASSIL',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('202004301706','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 0,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--App Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--csv data loading
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_flow_api.create_password_history (
    p_id => 1491110749200209,
    p_user_id => 1490779292200157,
    p_password => '3FA0E3D04BD32E918032B2C85F0B2321FF073CCCE20A855A962C1A5CCEBD993AC8C4497AD6050F09B393A49ED606A187372A6F26381C612D7FFCAEC17DE8D571');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 1500727180205876,
    p_user_id => 1500651213205845,
    p_password => 'F4CE11F6100CD86C8934BAF137B85CB44F9D1F822DC7FB837730EFEAF550888142CE930FAA739C2D3527A2558EDC44174EB6C7918724C167CF2B7C06EAB3FE8E');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 3017899910501393,
    p_user_id => 1500651213205845,
    p_password => 'F4CE11F6100CD86C8934BAF137B85CB44F9D1F822DC7FB837730EFEAF550888142CE930FAA739C2D3527A2558EDC44174EB6C7918724C167CF2B7C06EAB3FE8E');
end;
/
----------------
--preferences
--
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1647497436218048,
    p_user_id => 'PVASSIL',
    p_preference_name => 'F4000_1157687726908338238_SPLITTER_STATE',
    p_attribute_value => '252:false');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3087724643034032,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP_IR_4000_P4110_W1548412223182178',
    p_attribute_value => '1550029190194632____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3164490128592418,
    p_user_id => 'PVASSIL',
    p_preference_name => 'PD_PE_CODE_EDITOR_DLG_W',
    p_attribute_value => '1104');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3167390304613270,
    p_user_id => 'PVASSIL',
    p_preference_name => 'F4000_203904827661009901_SPLITTER_STATE',
    p_attribute_value => '332:false');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3236319777132126,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP4000_P194_R115839224419800245_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3236493002132126,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP4000_P194_R224505023496694888_SORT',
    p_attribute_value => 'fsp_sort_1_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3236505022133293,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP4000_P195_R225787614827384691_SORT',
    p_attribute_value => 'fsp_sort_2_desc');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3589099294679268,
    p_user_id => 'PVASSIL',
    p_preference_name => 'APEX_IG_712080000591813402_CURRENT_REPORT',
    p_attribute_value => '712386498335634625:GRID');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1646282669214937,
    p_user_id => 'PVASSIL',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1646492419214973,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1646579276214990,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '100');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1871259457342614,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1871670286350632,
    p_user_id => 'PVASSIL',
    p_preference_name => 'PD_GAL_CUR_TAB',
    p_attribute_value => '1');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 1881022868370998,
    p_user_id => 'PVASSIL',
    p_preference_name => 'WIZARD_SQL_SOURCE_TYPE',
    p_attribute_value => 'TABLE');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3584887751583850,
    p_user_id => 'PVASSIL',
    p_preference_name => 'FSP_IR_4000_P939_W451352700445603348',
    p_attribute_value => '451353909559603360____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 3117638096382823,
    p_user_id => 'PVASSIL',
    p_preference_name => 'F4000_203906404237009921_SPLITTER_STATE',
    p_attribute_value => '475:false');
end;
/
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--user access log
--
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202004301706','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 3,
    p_custom_status_text => 'Password Expired');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202004301706','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202004302246','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202005010003','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202004301708','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202005071854','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202005071734','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202005071734','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006021902','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202006021912','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202005271336','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202006022354','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006030005','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006031524','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006031954','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202006031959','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006032337','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202005271336','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202005271303','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006022353','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Application Express Authentication',
    p_app => 100,
    p_owner => 'PVASSIL',
    p_access_date => to_date('202006031524','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log2$ (
    p_login_name => 'PVASSIL',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_190100',
    p_access_date => to_date('202006032017','YYYYMMDDHH24MI'),
    p_ip_address => '::1',
    p_remote_user => 'ANONYMOUS',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
prompt Check Compatibility...
begin
-- This date identifies the minimum version required to import this file.
wwv_flow_team_api.check_version(p_version_yyyy_mm_dd=>'2010.05.13');
end;
/
 
begin wwv_flow.g_import_in_progress := true; wwv_flow.g_user := USER; end; 
/
 
--
prompt ...news
--
begin
null;
end;
/
--
prompt ...links
--
begin
null;
end;
/
--
prompt ...bugs
--
begin
null;
end;
/
--
prompt ...events
--
begin
null;
end;
/
--
prompt ...feature types
--
begin
null;
end;
/
--
prompt ...features
--
begin
null;
end;
/
--
prompt ...feature map
--
begin
null;
end;
/
--
prompt ...tasks
--
begin
null;
end;
/
--
prompt ...feedback
--
begin
null;
end;
/
--
prompt ...task defaults
--
begin
null;
end;
/
 
prompt ...workspace objects
 
 
prompt ...RESTful Services
 
-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'PVASSIL';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA PVASSIL - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_190100
-- Exported 23:38 Wednesday June 3, 2020 by: PVASSIL
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 23:38 Wednesday June 3, 2020 by: PVASSIL
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'PVASSIL';
 
end;
/

begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
