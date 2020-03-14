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