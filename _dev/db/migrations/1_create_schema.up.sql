# 1 create initial schemas - up;
# TODO confirm if down is triggered if up fails, I don't think it does;
SET autocommit = 0;

START TRANSACTION;

CREATE
    TABLE
    IF NOT EXISTS app_user
(
    id         BIGINT(20)  NOT NULL AUTO_INCREMENT,
    active     BOOLEAN     NOT NULL,
    created_by VARCHAR(20) NOT NULL,
    created_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by VARCHAR(20) NOT NULL,
    updated_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_general_ci;

CREATE INDEX active ON app_user (active);

CREATE
    TABLE
    IF NOT EXISTS entity
(
    id          BIGINT(20)  NOT NULL AUTO_INCREMENT,
    app_user_id BIGINT(20),
    created_by  VARCHAR(20) NOT NULL,
    created_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by  VARCHAR(20) NOT NULL,
    updated_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS event
(
    id          BIGINT(20)  NOT NULL AUTO_INCREMENT,
    admin_id    BIGINT(20)  NOT NULL,
    name        VARCHAR(255),
    description TEXT,
    created_by  VARCHAR(20) NOT NULL,
    created_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by  VARCHAR(20) NOT NULL,
    updated_at  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (admin_id)
        REFERENCES app_user (id)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_general_ci;

COMMIT;

SET autocommit = 1;