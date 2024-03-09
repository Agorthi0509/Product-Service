
CREATE TABLE category
(
    id        BIGINT       NOT NULL,
    create_dt datetime     NULL,
    update_dt datetime     NULL,
    name      VARCHAR(255) NULL,
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE jt_instructor
(
    user_id        BIGINT       NOT NULL,
    avg_rating     DOUBLE       NULL,
    specialization VARCHAR(255) NULL,
    CONSTRAINT pk_jt_instructor PRIMARY KEY (user_id)
);

CREATE TABLE jt_mentor
(
    user_id    BIGINT       NOT NULL,
    avg_rating DOUBLE       NULL,
    company    VARCHAR(255) NULL,
    CONSTRAINT pk_jt_mentor PRIMARY KEY (user_id)
);

CREATE TABLE jt_user
(
    id       BIGINT       NOT NULL,
    name     VARCHAR(255) NULL,
    email    VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    CONSTRAINT pk_jt_user PRIMARY KEY (id)
);

CREATE TABLE msp_instructor
(
    id             BIGINT       NOT NULL,
    name           VARCHAR(255) NULL,
    email          VARCHAR(255) NULL,
    password       VARCHAR(255) NULL,
    avg_rating     DOUBLE       NULL,
    specialization VARCHAR(255) NULL,
    CONSTRAINT pk_msp_instructor PRIMARY KEY (id)
);

CREATE TABLE msp_mentor
(
    id         BIGINT       NOT NULL,
    name       VARCHAR(255) NULL,
    email      VARCHAR(255) NULL,
    password   VARCHAR(255) NULL,
    avg_rating DOUBLE       NULL,
    company    VARCHAR(255) NULL,
    CONSTRAINT pk_msp_mentor PRIMARY KEY (id)
);

CREATE TABLE product
(
    id            BIGINT       NOT NULL,
    create_dt     datetime     NULL,
    update_dt     datetime     NULL,
    name          VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    price         BIGINT       NULL,
    image         VARCHAR(255) NULL,
    category_id   BIGINT       NULL,
    CONSTRAINT pk_product PRIMARY KEY (id)
);

CREATE TABLE st_user
(
    id             BIGINT       NOT NULL,
    `user-type`    INT          NULL,
    name           VARCHAR(255) NULL,
    email          VARCHAR(255) NULL,
    password       VARCHAR(255) NULL,
    avg_rating     DOUBLE       NULL,
    company        VARCHAR(255) NULL,
    specialization VARCHAR(255) NULL,
    CONSTRAINT pk_st_user PRIMARY KEY (id)
);

CREATE TABLE tpc_instructor
(
    id             BIGINT       NOT NULL,
    name           VARCHAR(255) NULL,
    email          VARCHAR(255) NULL,
    password       VARCHAR(255) NULL,
    avg_rating     DOUBLE       NULL,
    specialization VARCHAR(255) NULL,
    CONSTRAINT pk_tpc_instructor PRIMARY KEY (id)
);

CREATE TABLE tpc_mentor
(
    id         BIGINT       NOT NULL,
    name       VARCHAR(255) NULL,
    email      VARCHAR(255) NULL,
    password   VARCHAR(255) NULL,
    avg_rating DOUBLE       NULL,
    company    VARCHAR(255) NULL,
    CONSTRAINT pk_tpc_mentor PRIMARY KEY (id)
);

CREATE TABLE tpc_user
(
    id       BIGINT       NOT NULL,
    name     VARCHAR(255) NULL,
    email    VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    CONSTRAINT pk_tpc_user PRIMARY KEY (id)
);

ALTER TABLE jt_instructor
    ADD CONSTRAINT FK_JT_INSTRUCTOR_ON_USER FOREIGN KEY (user_id) REFERENCES jt_user (id);

ALTER TABLE jt_mentor
    ADD CONSTRAINT FK_JT_MENTOR_ON_USER FOREIGN KEY (user_id) REFERENCES jt_user (id);

ALTER TABLE product
    ADD CONSTRAINT FK_PRODUCT_ON_CATEGORY FOREIGN KEY (category_id) REFERENCES category (id);