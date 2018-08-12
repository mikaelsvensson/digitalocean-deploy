CREATE DATABASE {{app_db_name}};

\c {{app_db_name}}

CREATE ROLE {{app_db_user_name}} WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE ENCRYPTED PASSWORD '{{app_db_user_pw}}';

GRANT CREATE, CONNECT ON DATABASE {{app_db_name}} TO {{app_db_user_name}};
