create user test;
alter user test account unlock;
alter user test IDENTIFIED BY test;
GRANT ALL PRIVILEGES TO test IDENTIFIED BY test WITH ADMIN OPTION;