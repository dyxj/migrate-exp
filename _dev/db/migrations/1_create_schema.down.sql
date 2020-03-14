SET autocommit = 0;

START TRANSACTION;

DROP TABLE app_user;
DROP TABLE person;
DROP TABLE event;

COMMIT;

SET autocommit = 1;