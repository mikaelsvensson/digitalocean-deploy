SELECT 'CREATE DATABASE {{ item.db_name }}' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '{{ item.db_name }}')\gexec

\c {{ item.db_name }}

SELECT 'CREATE ROLE {{ item.db_user_name }} WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE ENCRYPTED PASSWORD ''{{ item.db_user_pw }}''' WHERE NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = '{{ item.db_user_name }}')\gexec

GRANT CREATE, CONNECT ON DATABASE {{ item.db_name }} TO {{ item.db_user_name }};
