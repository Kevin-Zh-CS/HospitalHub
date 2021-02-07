
-- 初始化 hospital

INSERT INTO hospital(hospital_name, hospital_address)
SELECT '浙大校医院', '浙江省杭州市西湖区余杭塘路388号'
WHERE NOT EXISTS(
        SELECT hospital_name, hospital_address
        FROM hospital
        WHERE hospital_name = '浙大校医院'
          AND hospital_address = '浙江省杭州市西湖区余杭塘路388号');

INSERT INTO hospital(hospital_name, hospital_address)
SELECT '上海市第九人民医院', '上海市虹口区周家嘴路525号'
WHERE NOT EXISTS(
        SELECT hospital_name, hospital_address
        FROM hospital
        WHERE hospital_name = '上海市第九人民医院'
          AND hospital_address = '上海市虹口区周家嘴路525号');

INSERT INTO hospital(hospital_name, hospital_address)
SELECT '解放军三〇七医院', '北京市丰台区东大街8号'
WHERE NOT EXISTS(
        SELECT hospital_name, hospital_address
        FROM hospital
        WHERE hospital_name = '解放军三〇七医院'
          AND hospital_address = '北京市丰台区东大街8号');

INSERT INTO hospital(hospital_name, hospital_address)
SELECT '上海市第六人民医院', '中国上海市徐汇区田林宜山路600号'
WHERE NOT EXISTS(
        SELECT hospital_name, hospital_address
        FROM hospital
        WHERE hospital_name = '上海市第六人民医院'
          AND hospital_address = '中国上海市徐汇区田林宜山路600号');

INSERT INTO hospital(hospital_name, hospital_address)
SELECT '浙江省第一医院', '浙江省杭州市上城区庆春路79号'
WHERE NOT EXISTS(
        SELECT hospital_name, hospital_address
        FROM hospital
        WHERE hospital_name = '浙江省第一医院'
          AND hospital_address = '浙江省杭州市上城区庆春路79号');

-- 初始化 department

INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '牙科'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '牙科');

INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '内科'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '内科');

INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '外科'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '外科');

INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '皮肤科'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '皮肤科');

INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '精神科'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '精神科');

INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '妇科'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '妇科');

 -- 初始化 user

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_0', crypt('WDNMD000', gen_salt('bf')), 'neo_hugh_0@996.icu.com', 'doctor', '胡洋凡零号', 1
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_0'
          AND password = crypt('WDNMD000', gen_salt('bf'))
          AND email = 'neo_hugh_0@996.icu.com'
          AND tag = 'doctor'
          AND true_name = '胡洋凡零号'
          AND age = 1);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_1', crypt('WDNMD001', gen_salt('bf')), 'neo_hugh_1@996.icu.com', 'doctor', '胡洋凡一号', 2
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_1'
          AND password = crypt('WDNMD001', gen_salt('bf'))
          AND email = 'neo_hugh_1@996.icu.com'
          AND tag = 'doctor'
          AND true_name = '胡洋凡一号'
          AND age = 2);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_2', crypt('WDNMD002', gen_salt('bf')), 'neo_hugh_2@996.icu.com', 'doctor', '胡洋凡二号', 3
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_2'
          AND password = crypt('WDNMD002', gen_salt('bf'))
          AND email = 'neo_hugh_2@996.icu.com'
          AND tag = 'doctor'
          AND true_name = '胡洋凡二号'
          AND age = 3);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_3', crypt('WDNMD003', gen_salt('bf')), 'neo_hugh_3@996.icu.com', 'doctor', '胡洋凡三号', 4
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_3'
          AND password = crypt('WDNMD003', gen_salt('bf'))
          AND email = 'neo_hugh_3@996.icu.com'
          AND tag = 'doctor'
          AND true_name = '胡洋凡三号'
          AND age = 4);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_4', crypt('WDNMD004', gen_salt('bf')), 'neo_hugh_4@996.icu.com', 'doctor', '胡洋凡四号', 5
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_4'
          AND password = crypt('WDNMD004', gen_salt('bf'))
          AND email = 'neo_hugh_4@996.icu.com'
          AND tag = 'doctor'
          AND true_name = '胡洋凡四号'
          AND age = 5);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_5', crypt('WDNMD005', gen_salt('bf')), 'neo_hugh_5@996.icu.com', 'patient', '胡洋凡五号', 6
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_5'
          AND password = crypt('WDNMD005', gen_salt('bf'))
          AND email = 'neo_hugh_5@996.icu.com'
          AND tag = 'patient'
          AND true_name = '胡洋凡五号'
          AND age = 6);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_6', crypt('WDNMD006', gen_salt('bf')), 'neo_hugh_6@996.icu.com', 'patient', '胡洋凡六号', 7
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_6'
          AND password = crypt('WDNMD006', gen_salt('bf'))
          AND email = 'neo_hugh_6@996.icu.com'
          AND tag = 'patient'
          AND true_name = '胡洋凡六号'
          AND age = 7);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_7', crypt('WDNMD007', gen_salt('bf')), 'neo_hugh_7@996.icu.com', 'patient', '胡洋凡七号', 8
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_7'
          AND password = crypt('WDNMD007', gen_salt('bf'))
          AND email = 'neo_hugh_7@996.icu.com'
          AND tag = 'patient'
          AND true_name = '胡洋凡七号'
          AND age = 8);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_8', crypt('WDNMD008', gen_salt('bf')), 'neo_hugh_8@996.icu.com', 'patient', '胡洋凡八号', 9
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_8'
          AND password = crypt('WDNMD008', gen_salt('bf'))
          AND email = 'neo_hugh_8@996.icu.com'
          AND tag = 'patient'
          AND true_name = '胡洋凡八号'
          AND age = 9);

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT 'neo_hugh_9', crypt('WDNMD009', gen_salt('bf')), 'neo_hugh_9@996.icu.com', 'patient', '胡洋凡九号', 10
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = 'neo_hugh_9'
          AND password = crypt('WDNMD009', gen_salt('bf'))
          AND email = 'neo_hugh_9@996.icu.com'
          AND tag = 'patient'
          AND true_name = '胡洋凡九号'
          AND age = 10);

 -- 初始化 doctor和patient

INSERT INTO doctor(user_id, department_id, hospital_id)
SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
FROM hospital_hub_user,
     department,
     hospital
WHERE email = 'neo_hugh_0@996.icu.com'
  AND department_name = '牙科'
  AND hospital_name = '浙大校医院'
  AND department.hospital_id = hospital.hospital_id
  AND NOT EXISTS(
        SELECT user_id, department_id, hospital_id
        FROM doctor
        WHERE doctor.user_id = hospital_hub_user.user_id
          AND doctor.department_id = department.department_id
          AND doctor.hospital_id = hospital.hospital_id);

INSERT INTO doctor(user_id, department_id, hospital_id)
SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
FROM hospital_hub_user,
     department,
     hospital
WHERE email = 'neo_hugh_1@996.icu.com'
  AND department_name = '内科'
  AND hospital_name = '上海市第九人民医院'
  AND department.hospital_id = hospital.hospital_id
  AND NOT EXISTS(
        SELECT user_id, department_id, hospital_id
        FROM doctor
        WHERE doctor.user_id = hospital_hub_user.user_id
          AND doctor.department_id = department.department_id
          AND doctor.hospital_id = hospital.hospital_id);

INSERT INTO doctor(user_id, department_id, hospital_id)
SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
FROM hospital_hub_user,
     department,
     hospital
WHERE email = 'neo_hugh_2@996.icu.com'
  AND department_name = '外科'
  AND hospital_name = '解放军三〇七医院'
  AND department.hospital_id = hospital.hospital_id
  AND NOT EXISTS(
        SELECT user_id, department_id, hospital_id
        FROM doctor
        WHERE doctor.user_id = hospital_hub_user.user_id
          AND doctor.department_id = department.department_id
          AND doctor.hospital_id = hospital.hospital_id);

INSERT INTO doctor(user_id, department_id, hospital_id)
SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
FROM hospital_hub_user,
     department,
     hospital
WHERE email = 'neo_hugh_3@996.icu.com'
  AND department_name = '皮肤科'
  AND hospital_name = '上海市第六人民医院'
  AND department.hospital_id = hospital.hospital_id
  AND NOT EXISTS(
        SELECT user_id, department_id, hospital_id
        FROM doctor
        WHERE doctor.user_id = hospital_hub_user.user_id
          AND doctor.department_id = department.department_id
          AND doctor.hospital_id = hospital.hospital_id);

INSERT INTO doctor(user_id, department_id, hospital_id)
SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
FROM hospital_hub_user,
     department,
     hospital
WHERE email = 'neo_hugh_4@996.icu.com'
  AND department_name = '精神科'
  AND hospital_name = '浙江省第一医院'
  AND department.hospital_id = hospital.hospital_id
  AND NOT EXISTS(
        SELECT user_id, department_id, hospital_id
        FROM doctor
        WHERE doctor.user_id = hospital_hub_user.user_id
          AND doctor.department_id = department.department_id
          AND doctor.hospital_id = hospital.hospital_id);

INSERT INTO patient(user_id)
SELECT user_id
FROM hospital_hub_user
WHERE email = 'neo_hugh_5@996.icu.com'
  AND NOT EXISTS(
        SELECT user_id FROM patient WHERE patient.user_id = hospital_hub_user.user_id);

INSERT INTO patient(user_id)
SELECT user_id
FROM hospital_hub_user
WHERE email = 'neo_hugh_6@996.icu.com'
  AND NOT EXISTS(
        SELECT user_id FROM patient WHERE patient.user_id = hospital_hub_user.user_id);

INSERT INTO patient(user_id)
SELECT user_id
FROM hospital_hub_user
WHERE email = 'neo_hugh_7@996.icu.com'
  AND NOT EXISTS(
        SELECT user_id FROM patient WHERE patient.user_id = hospital_hub_user.user_id);

INSERT INTO patient(user_id)
SELECT user_id
FROM hospital_hub_user
WHERE email = 'neo_hugh_8@996.icu.com'
  AND NOT EXISTS(
        SELECT user_id FROM patient WHERE patient.user_id = hospital_hub_user.user_id);

INSERT INTO patient(user_id)
SELECT user_id
FROM hospital_hub_user
WHERE email = 'neo_hugh_9@996.icu.com'
  AND NOT EXISTS(
        SELECT user_id FROM patient WHERE patient.user_id = hospital_hub_user.user_id);
