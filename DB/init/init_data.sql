-- 初始化 hospital
INSERT INTO hospital(hospital_name, hospital_address) VALUES('浙大校医院', '浙江省杭州市西湖区余杭塘路388号');
INSERT INTO hospital(hospital_name, hospital_address) VALUES('上海市第九人民医院', '上海市虹口区周家嘴路525号');
INSERT INTO hospital(hospital_name, hospital_address) VALUES('解放军三〇七医院', '北京市丰台区东大街8号');
INSERT INTO hospital(hospital_name, hospital_address) VALUES('上海市第六人民医院', '中国上海市徐汇区田林宜山路600号');
INSERT INTO hospital(hospital_name, hospital_address) VALUES('浙江省第一医院', '浙江省杭州市上城区庆春路79号');

-- 初始化 department
INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '牙科' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '牙科'));
INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '内科' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '内科'));
INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '外科' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '外科'));
INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '皮肤科' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '皮肤科'));
INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '精神科' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '精神科'));
INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '妇科' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '妇科'));

-- 初始化 user
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17403957784', crypt('DK+xR5D*', gen_salt('bf')), 'vfero.maly@cronx.com', 'doctor', '邓俊智', 33, 'male');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17400663207', crypt('aVB^vK4H', gen_salt('bf')), 'vlinbr@blogstudent.com', 'doctor', '习星渊', 55, 'male');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('14532187706', crypt('h8-CnzP<', gen_salt('bf')), 'qgeorge.bloom.58t@dbt845.xyz', 'doctor', '焦鸿志', 45, 'male');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18897834281', crypt('5}W8Fdsr', gen_salt('bf')), 'sslimani.c@jarlhwa.com', 'doctor', '吕盈仪', 34, 'female');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('14554580678', crypt('9Gh`+Ezv', gen_salt('bf')), '2zkrya.altaay18t@mishti.shop', 'doctor', '王修远', 29, 'male');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('16741957248', crypt('4j$^Y3Pf', gen_salt('bf')), 'wstylo.bleu02@customright.com', 'patient', '吕才艺', 82, 'male');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17404133919', crypt('-R6Zr#<U', gen_salt('bf')), '8secreta@alibaba.cd', 'patient', '陈婧', 14, 'female');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('14749815233', crypt('R8v{]qkx', gen_salt('bf')), 'tsaefho64i@kittiza.com', 'patient', '范思楠', 19, 'male');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17400217949', crypt('a9Sh}hYF', gen_salt('bf')), '8ibrahim.kha@bookstorage.site', 'patient', '蔡依玉', 20, 'female');
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15280924959', crypt('57R4W#qc', gen_salt('bf')), 'nleonardo.b@activelywell.com', 'patient', '蒋勰', 34, 'male');

-- 初始化 doctor和patient
DO
$$
    DECLARE
        tmp_user_id       INT;
        tmp_department_id INT;
        tmp_hospital_id   INT;
    BEGIN
        SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
        INTO tmp_user_id, tmp_department_id, tmp_hospital_id
        FROM hospital_hub_user,
             department,
             hospital
        WHERE email = 'vfero.maly@cronx.com'
          AND department_name = '牙科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement)
        VALUES (tmp_user_id, tmp_department_id, tmp_hospital_id, '{false, false, true, true, true, true, false}');

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_user_id)
        WHERE department_id = tmp_department_id;
    END
$$;

DO
$$
    DECLARE
        tmp_user_id       INT;
        tmp_department_id INT;
        tmp_hospital_id   INT;
    BEGIN
        SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
        INTO tmp_user_id, tmp_department_id, tmp_hospital_id
        FROM hospital_hub_user,
             department,
             hospital
        WHERE email = 'vlinbr@blogstudent.com'
          AND department_name = '内科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement)
        VALUES (tmp_user_id, tmp_department_id, tmp_hospital_id, '{true, false, true, false, false, true, true}');

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_user_id)
        WHERE department_id = tmp_department_id;
    END
$$;

DO
$$
    DECLARE
        tmp_user_id       INT;
        tmp_department_id INT;
        tmp_hospital_id   INT;
    BEGIN
        SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
        INTO tmp_user_id, tmp_department_id, tmp_hospital_id
        FROM hospital_hub_user,
             department,
             hospital
        WHERE email = 'qgeorge.bloom.58t@dbt845.xyz'
          AND department_name = '外科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement)
        VALUES (tmp_user_id, tmp_department_id, tmp_hospital_id, '{true, true, false, false, true, true, false}');

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_user_id)
        WHERE department_id = tmp_department_id;
    END
$$;

DO
$$
    DECLARE
        tmp_user_id       INT;
        tmp_department_id INT;
        tmp_hospital_id   INT;
    BEGIN
        SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
        INTO tmp_user_id, tmp_department_id, tmp_hospital_id
        FROM hospital_hub_user,
             department,
             hospital
        WHERE email = 'sslimani.c@jarlhwa.com'
          AND department_name = '皮肤科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement)
        VALUES (tmp_user_id, tmp_department_id, tmp_hospital_id, '{false, true, false, true, true, false, true}');

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_user_id)
        WHERE department_id = tmp_department_id;
    END
$$;

DO
$$
    DECLARE
        tmp_user_id       INT;
        tmp_department_id INT;
        tmp_hospital_id   INT;
    BEGIN
        SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
        INTO tmp_user_id, tmp_department_id, tmp_hospital_id
        FROM hospital_hub_user,
             department,
             hospital
        WHERE email = '2zkrya.altaay18t@mishti.shop'
          AND department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement)
        VALUES (tmp_user_id, tmp_department_id, tmp_hospital_id, '{false, true, true, false, true, true, false}');

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_user_id)
        WHERE department_id = tmp_department_id;
    END
$$;

INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = 'wstylo.bleu02@customright.com';
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = '8secreta@alibaba.cd';
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = 'tsaefho64i@kittiza.com';
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = '8ibrahim.kha@bookstorage.site';
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = 'nleonardo.b@activelywell.com';

-- 初始化 comment

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '专业详实的解答，多谢医生'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '14749815233' AND doctor_user.username = '18897834281';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '耐心、专业！'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '14749815233' AND doctor_user.username = '17403957784';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '非常感谢医生，回复的速度真的很快！而且很详细。'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '14749815233' AND doctor_user.username = '18897834281';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '耐心、专业！'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '17404133919' AND doctor_user.username = '18897834281';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '耐心、专业！'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '15280924959' AND doctor_user.username = '17400663207';

-- 初始化 registration
DO
$$
    DECLARE
        tmp_patient_id      INT;
        tmp_doctor_id       INT;
        tmp_hospital_id     INT;
        tmp_department_id   INT;
        tmp_registration_id TEXT;
    BEGIN
        SELECT patient_user.user_id, doctor_user.user_id, hospital_id, department_id
        INTO tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id
        FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user, doctor
        WHERE patient_user.username = '17400217949' AND doctor_user.username = '14554580678' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id);
    END
$$;


DO
$$
    DECLARE
        tmp_patient_id      INT;
        tmp_doctor_id       INT;
        tmp_hospital_id     INT;
        tmp_department_id   INT;
        tmp_registration_id TEXT;
    BEGIN
        SELECT patient_user.user_id, doctor_user.user_id, hospital_id, department_id
        INTO tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id
        FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user, doctor
        WHERE patient_user.username = '15280924959' AND doctor_user.username = '18897834281' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id);
    END
$$;


DO
$$
    DECLARE
        tmp_patient_id      INT;
        tmp_doctor_id       INT;
        tmp_hospital_id     INT;
        tmp_department_id   INT;
        tmp_registration_id TEXT;
    BEGIN
        SELECT patient_user.user_id, doctor_user.user_id, hospital_id, department_id
        INTO tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id
        FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user, doctor
        WHERE patient_user.username = '17400217949' AND doctor_user.username = '14554580678' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id);
    END
$$;


DO
$$
    DECLARE
        tmp_patient_id      INT;
        tmp_doctor_id       INT;
        tmp_hospital_id     INT;
        tmp_department_id   INT;
        tmp_registration_id TEXT;
    BEGIN
        SELECT patient_user.user_id, doctor_user.user_id, hospital_id, department_id
        INTO tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id
        FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user, doctor
        WHERE patient_user.username = '17404133919' AND doctor_user.username = '14532187706' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id);
    END
$$;


DO
$$
    DECLARE
        tmp_patient_id      INT;
        tmp_doctor_id       INT;
        tmp_hospital_id     INT;
        tmp_department_id   INT;
        tmp_registration_id TEXT;
    BEGIN
        SELECT patient_user.user_id, doctor_user.user_id, hospital_id, department_id
        INTO tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id
        FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user, doctor
        WHERE patient_user.username = '17400217949' AND doctor_user.username = '14554580678' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id);
    END
$$;



-- 初始化 medicine
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('双氯芬酸钾胶囊', '25mg * 20粒', 18.0);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('克霉唑片', '1片', 49.0);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('盐酸米诺环素胶囊', '50mg * 20粒', 56.0);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('酒石酸美托洛尔片', '25mg * 20片', 8.8);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('盐酸艾司洛尔注射液', '10ml:0.1g * 5支', 447.0);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('999三九感冒灵颗粒', '10g * 9袋', 36.6);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('连花清瘟胶囊', '48粒', 25.8);
INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('福元/易下开塞露', '20ml * 20支', 11.0);
