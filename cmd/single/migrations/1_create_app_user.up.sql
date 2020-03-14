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
    PRIMARY KEY (id),
    INDEX idx_app_user_active (active)
)
    ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_general_ci;