-- 使用 pgcrypto 作为密码加密解密的模块
DROP EXTENSION IF EXISTS pgcrypto;
CREATE EXTENSION pgcrypto;

-- 创建自定义枚举类型
DROP TYPE IF EXISTS gender_type;
CREATE TYPE gender_type AS ENUM ('unknown', 'male','female');
DROP TYPE IF EXISTS identity_type;
CREATE TYPE identity_type AS ENUM ('doctor','patient');
DROP TYPE IF EXISTS doctor_type;
CREATE TYPE doctor_type AS ENUM ('normal','professional');



DROP DATABASE IF EXISTS hospital_hub;
CREATE DATABASE hospital_hub;

DROP TABLE IF EXISTS hospital;
CREATE TABLE hospital
(
    hospital_id        SERIAL PRIMARY KEY,
    hospital_name      TEXT  NOT NULL DEFAULT '',
    hospital_address   TEXT  NOT NULL DEFAULT '',
    department_id_list INT[] NOT NULL DEFAULT array []::INT[]
);


DROP TABLE IF EXISTS hospital_hub_user;
CREATE TABLE hospital_hub_user
(
    user_id       SERIAL PRIMARY KEY,
    username      TEXT          NOT NULL,
    password      TEXT          NOT NULL,
    email         TEXT          NOT NULL UNIQUE,
    balance       MONEY         NOT NULL DEFAULT 0.00,
    portrait_url  TEXT          NOT NULL,
    order_id_list INT[]         NOT NULL DEFAULT array []::INT[],
    tag           identity_type NOT NULL,
    true_name     TEXT          NOT NULL DEFAULT '',
    gender        gender_type   NOT NULL DEFAULT 'unknown',
    age           INT           NOT NULL
);

DROP TABLE IF EXISTS doctor;
CREATE TABLE doctor
(
    user_id       INT         NOT NULL REFERENCES hospital_hub_user,
    department_id INT         NOT NULL REFERENCES department,
    major         TEXT        NOT NULL DEFAULT '',
    hospital_id   INT         NOT NULL REFERENCES hospital,
    experience    TEXT        NOT NULL DEFAULT '',
    education     TEXT        NOT NULL DEFAULT '',
    arrangement   DATE[]      NOT NULL DEFAULT ARRAY []::DATE[],
    score         NUMERIC,
    comment_id    INT[]       NOT NULL DEFAULT ARRAY []::INT[],
    on_duty       BOOLEAN     NOT NULL DEFAULT false,
    type          doctor_type NOT NULL DEFAULT 'normal',
    capacity      INT,
    finish        INT
);

DROP TABLE IF EXISTS patient;
CREATE TABLE patient
(
    user_id              INT   NOT NULL REFERENCES hospital_hub_user,
    registration_id_list INT[] NOT NULL DEFAULT ARRAY []::INT[],
    history              TEXT  NOT NULL DEFAULT '',
    patient_address      TEXT  NOT NULL DEFAULT ''
);


DROP SEQUENCE IF EXISTS serial_seq;
CREATE SEQUENCE serial_seq START WITH 1;

DROP TABLE IF EXISTS registration;
CREATE TABLE registration
(
    registration_id   TEXT        NOT NULL DEFAULT current_date || nextval('serial_seq'::regclass)::TEXT,
    true_name         TEXT        NOT NULL DEFAULT '',
    gender            gender_type NOT NULL default 'unknown',
    age               INT,
    hospital_id       INT         NOT NULL REFERENCES hospital,
    department_id     INT         NOT NULL REFERENCES department,
    registration_time TIMESTAMP


);

DROP TABLE IF EXISTS department;
CREATE TABLE department
(
    department_id   SERIAL PRIMARY KEY,
    hospital_id     INT  NOT NULL REFERENCES hospital,
    department_name TEXT NOT NULL DEFAULT '',
    doctor_id_list  INT[]         DEFAULT ARRAY []::INT[],
    remain          INT  NOT NULL DEFAULT 0,
    waiting         INT  NOT NULL DEFAULT 0
);



DROP TABLE IF EXISTS comment;
CREATE TABLE comment
(
    comment_id   SERIAL PRIMARY KEY,
    patient_id   INT  NOT NULL REFERENCES patient (user_id),
    doctor_id    INT  NOT NULL REFERENCES doctor (user_id),
    content      TEXT NOT NULL DEFAULT '',
    publish_time TIMESTAMP
);



-- ProcessModel
-- registration_id: String //挂号单id，按照一定的规则生成20210204xxxx
-- step_id: int //一次问诊中的第几步（第一个行程，第二个行程……
-- doctor_id: String// 添加此行程的医生的user_id
-- description: String// 医生对此行程的描述（去x楼xx房间do sth (拍片子...
-- // 不一定要
-- target_floor: int
-- target_room: int
-- accessory_name: String //附件名称
-- accessory_url: String //可能并不需要（根据名称加其它信息如挂号单等可以推导出来
-- state: bool // 行程状态，已经完成的为true，正在进行中的是false
--    // 只有正在进行中的那个行程允许编辑和删除


-- OrderModel（就是处方）
-- order_id: String
-- registration_id: String //挂号单id，按照一定的规则生成20210204xxxx
-- patient_id: String //其实是PatientModel的user_id
-- doctor_id: String //其实是DoctorModel的user_id
-- medicine_id: String //药品id
-- total_price: Integer //药品总价
-- status: Integer //三种状态：未支付，已支付，已送达
-- prescription: String //医生的处方建议
-- order_time: DateTime //订单时间
-- patient_address: String //患者家庭住址（其实是冗余的）
-- hospital_address: String //医院位置，订单系统要用（其实是冗余的）
-- true_name: String //患者实名（其实是冗余的）