## Import Database
### file: graphs_2020_06_03.dmp

Open a terminal to the folder where the file is located and execute the command:

> imp USERID=pvassil/pvassil@localhost:1521/XEPDB1 FILE=graphs_2020_06_03.dmp FROMUSER=pvassil TOUSER=pvassil

PS: user(touser) pvassil has to be created before import command.

## Import Workspace to Oracle Apex
### files: WORKSPACE_PVASSIL.sql 

Log in as admin in server:apex_port/apex/apex_admin, or in workspace "INTERNAL" with admin credentials in server:apex_port/apex/.

Through "Manage Workspaces" import the workspace file.

## Import Application
### files: GRAPHS_PVASSIL.sql
Logged in as developer/admin to workspace "pvassil" import the application file.


