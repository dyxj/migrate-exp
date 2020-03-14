# 1 create initial schemas - down;
SET autocommit = 0;

START TRANSACTION;

DROP TABLE IF EXISTS app_user;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS event;

COMMIT;

SET autocommit = 1;