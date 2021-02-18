DROP EXTENSION IF EXISTS pgcrypto;
SET DATESTYLE TO 'ISO';

DROP TABLE IF EXISTS hospital,
    hospital_hub_user,
    department,
    doctor,
    patient,
    process,
    comment,
    registration,
    prescription CASCADE;


DROP TYPE IF EXISTS gender_type;
DROP TYPE IF EXISTS identity_type;
DROP TYPE IF EXISTS doctor_type;
DROP TYPE IF EXISTS order_type;


-- 使用 pgcrypto 作为密码加密解密的模块
CREATE EXTENSION pgcrypto;

-- 创建自定义枚举类型
CREATE TYPE gender_type AS ENUM ('unknown', 'male','female');
CREATE TYPE identity_type AS ENUM ('doctor','patient');
CREATE TYPE doctor_type AS ENUM ('normal','professional');
CREATE TYPE order_type AS ENUM ('unpaid', 'paid', 'sent');


CREATE TABLE hospital
(
    hospital_id        SERIAL PRIMARY KEY,
    hospital_name      TEXT  NOT NULL DEFAULT '',
    hospital_address   TEXT  NOT NULL DEFAULT '',
    department_id_list INT[] NOT NULL DEFAULT array []::INT[]
);

CREATE TABLE hospital_hub_user
(
    user_id      SERIAL PRIMARY KEY,
    username     TEXT          NOT NULL,
    password     TEXT          NOT NULL UNIQUE,
    email        TEXT          NOT NULL UNIQUE,
    balance      MONEY         NOT NULL DEFAULT 0.00,
    portrait_url TEXT          NOT NULL DEFAULT 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2561659095,299912888&fm=26&gp=0.jpg',
    tag          identity_type NOT NULL,
    true_name    TEXT          NOT NULL DEFAULT '',
    gender       gender_type   NOT NULL DEFAULT 'unknown',
    age          INT           NOT NULL
);


CREATE TABLE department
(
    department_id       SERIAL PRIMARY KEY,
    hospital_id         INT  NOT NULL REFERENCES hospital,
    department_name     TEXT NOT NULL DEFAULT '',
    doctor_id_list      INT[]         DEFAULT ARRAY []::INT[],
    department_capacity INT  NOT NULL DEFAULT 0,
    department_remain   INT  NOT NULL DEFAULT 0,
    department_waiting  INT  NOT NULL DEFAULT 0
);

CREATE TABLE doctor
(
    user_id       INT         NOT NULL REFERENCES hospital_hub_user,
    department_id INT         NOT NULL REFERENCES department,
    major         TEXT        NOT NULL DEFAULT '',
    hospital_id   INT         NOT NULL REFERENCES hospital,
    experience    TEXT        NOT NULL DEFAULT '',
    education     TEXT        NOT NULL DEFAULT '',
    arrangement   BOOLEAN[]   NOT NULL DEFAULT ARRAY []::BOOLEAN[],
    score         NUMERIC     NOT NULL DEFAULT 0,
    on_duty       BOOLEAN     NOT NULL DEFAULT false,
    type          doctor_type NOT NULL DEFAULT 'normal',
    capacity      INT         NOT NULL DEFAULT 0,
    finish        INT         NOT NULL DEFAULT 0
);


CREATE TABLE patient
(
    user_id         INT  NOT NULL REFERENCES hospital_hub_user,
    history         TEXT NOT NULL DEFAULT '',
    patient_address TEXT NOT NULL DEFAULT ''
);


DROP SEQUENCE IF EXISTS serial_seq;
CREATE SEQUENCE serial_seq START WITH 1;


CREATE TABLE registration
(
    registration_id   TEXT      NOT NULL PRIMARY KEY DEFAULT current_date || '-' || nextval('serial_seq'::regclass)::TEXT,
    patient_id        INT       NOT NULL REFERENCES hospital_hub_user (user_id),
    doctor_id         INT       NOT NULL REFERENCES hospital_hub_user (user_id),
    hospital_id       INT       NOT NULL REFERENCES hospital,
    department_id     INT       NOT NULL REFERENCES department,
    registration_time TIMESTAMP NOT NULL             DEFAULT now()::timestamp(0)
);


CREATE TABLE comment
(
    comment_id   SERIAL PRIMARY KEY,
    patient_id   INT       NOT NULL REFERENCES hospital_hub_user (user_id),
    doctor_id    INT       NOT NULL REFERENCES hospital_hub_user (user_id),
    content      TEXT      NOT NULL DEFAULT '',
    publish_time TIMESTAMP NOT NULL DEFAULT now()::timestamp(0)
);


CREATE TABLE process
(
    registration_id TEXT    NOT NULL REFERENCES registration,
    doctor_id       INT     NOT NULL REFERENCES hospital_hub_user (user_id),
    description     TEXT[]  NOT NULL DEFAULT ARRAY []::TEXT[],
    accessory_name  TEXT    NOT NULL DEFAULT '',
    accessory_url   TEXT    NOT NULL DEFAULT '',
    state           BOOLEAN NOT NULL DEFAULT false
);


CREATE TABLE prescription
(
    prescription_id     SERIAL PRIMARY KEY,
    registration_id     TEXT       NOT NULL REFERENCES registration,
    patient_id          INT        NOT NULL REFERENCES hospital_hub_user (user_id),
    doctor_id           INT        NOT NULL REFERENCES hospital_hub_user (user_id),
    prescription_time   TIMESTAMP  NOT NULL DEFAULT now()::timestamp(0),
    prescription_detail TEXT       NOT NULL DEFAULT '',
    status              order_type NOT NULL DEFAULT 'unpaid',
    medicine_id         TEXT       NOT NULL DEFAULT '',
    total_price         MONEY      NOT NULL DEFAULT 0.00
);