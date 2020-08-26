-- nslord database
CREATE DATABASE pdns;
CREATE USER 'pdns'@'%' IDENTIFIED BY 'dbpassword';
GRANT SELECT, INSERT, UPDATE, DELETE ON pdns.* TO 'pdns'@'%';
