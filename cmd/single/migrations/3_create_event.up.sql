CREATE TABLE IF NOT EXISTS `event`
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