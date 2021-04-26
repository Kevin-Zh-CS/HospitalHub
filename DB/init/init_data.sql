-- 初始化 hospital
INSERT INTO hospital(hospital_name, hospital_address, hospital_url) VALUES('浙大校医院', '浙江省杭州市西湖区余杭塘路388号', 'http://www.yihurenli.com/upload/201611/25/201611250908590213.jpg');
INSERT INTO hospital(hospital_name, hospital_address, hospital_url) VALUES('上海市第九人民医院', '上海市虹口区周家嘴路525号', 'https://img.ivfazl.com/uploads/allimg/1911/5-191101111443N6.jpg');
INSERT INTO hospital(hospital_name, hospital_address, hospital_url) VALUES('解放军三〇七医院', '北京市丰台区东大街8号', 'http://www.mztj.cn/upimg/userup/1303/060RU43332.jpg');
INSERT INTO hospital(hospital_name, hospital_address, hospital_url) VALUES('上海市第六人民医院', '中国上海市徐汇区田林宜山路600号', 'https://www.shsmu.edu.cn/images/banner6.jpg');
INSERT INTO hospital(hospital_name, hospital_address, hospital_url) VALUES('浙江省第一医院', '浙江省杭州市上城区庆春路79号', 'http://ssparking.com/upload/2016-5/2016052339510465.jpg');

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

-- 初始化 doctor
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13391786245', 
        crypt('lj8XLTx4UI1', gen_salt('bf')), 'FDbd3KWc@Wk.com', 'doctor', '王喁', 56, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,true,false,true}', '外科', '在来安县中医院工作27年', '贵阳护理职业学院本科毕业', 1.7397782486735496, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18503641927', 
        crypt('zKlICOhZrwE', gen_salt('bf')), '1KfOtq3@u3.com', 'doctor', '贝飞', 36, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,true,true,true}', '精神科', '在牡丹江市肿瘤医院牡丹江市结核病防治院工作7年', '湖南师范大学医学院硕士毕业', 7.01598655843941, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13715863029', 
        crypt('ylw4LVUb0DPu', gen_salt('bf')), 'eEKyhIOqD@ta.com', 'doctor', '吴欢', 49, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,true,false,false}', '外科', '在濮阳市人民医院工作18年', '江苏建康职业学院博士毕业', 5.406075857775295, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15920538971', 
        crypt('LGWesT', gen_salt('bf')), 'LlDpXHn@YB.com', 'doctor', '朱勋', 43, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,false,false,true}', '牙科', '在门头沟区色树坟中心卫生院工作14年', '江西卫生职业学院硕士毕业', 2.160073829016342, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13191405276', 
        crypt('Mka8IEw', gen_salt('bf')), 'xsHbYUmKA@Fl.com', 'doctor', '邵可', 42, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,true,true,false}', '精神科', '在河南省第一监狱医院工作11年', '武汉大学口腔医学院博士毕业', 6.823006944280291, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15680761592', 
        crypt('JctxYPh', gen_salt('bf')), 'UlcnkBMV8@vGb.com', 'doctor', '沈醪', 57, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,true,true,true}', '外科', '在雄县中医院工作28年', '西北民族大学本科毕业', 6.965776596805162, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13250637142', 
        crypt('8E3lBSmOV', gen_salt('bf')), '4dPVY0iD@0Pq.com', 'doctor', '屈林', 41, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,false,false,true}', '精神科', '在商丘市第一人民医院工作12年', '兰州大学医学院硕士毕业', 7.8658061120276725, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13289310254', 
        crypt('6Qyouw4ZNSRJ', gen_salt('bf')), 'J4TR70q3@Qi.com', 'doctor', '汪琪', 40, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,true,false,false}', '内科', '在陕西省红十字医院工作15年', '湘南医学高等专科学校专科毕业', 9.689108403910147, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15172851496', 
        crypt('EOUInm', gen_salt('bf')), 'V0x7BqtbH@YV.com', 'doctor', '禹裨', 46, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,false,true,false}', '内科', '在神木县妇幼保健站工作19年', '湖南中医药大学湘杏学院本科毕业', 5.137604955495015, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18903471592', 
        crypt('NXiOzgdI9STh', gen_salt('bf')), 'Ivh8jxrG@3cW.com', 'doctor', '贝鹏', 43, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,true,true,true,true}', '精神科', '在义乌市新法风湿病医院工作14年', '河北联合大学冀唐学院硕士毕业', 2.733807435506617, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15914739058', 
        crypt('ZP6oQye', gen_salt('bf')), '5zVQaY@Tz1.com', 'doctor', '杨燮', 45, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,false,true,true,true}', '皮肤科', '在克拉玛依市金龙医院工作19年', '湖北中医药高等专科学校专科毕业', 4.528301342805996, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18274310928', 
        crypt('EMhGm90', gen_salt('bf')), '4LgEFMPy@px.com', 'doctor', '祁辛', 49, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,false,false,true}', '牙科', '在西平县人民医院工作20年', '西北民族大学本科毕业', 5.897394885440043, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13402847163', 
        crypt('2KQIeZpq', gen_salt('bf')), 'ELAbwCy@nm.com', 'doctor', '沈典', 53, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,false,true,true}', '外科', '在鸡西市城子河区人民医院工作21年', '南京大学医学院硕士毕业', 4.7840518390394235, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15706394271', 
        crypt('3Q7ZRMvS4', gen_salt('bf')), '6eGHj@sRf.com', 'doctor', '汪陵', 52, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,false,false,true}', '精神科', '在阿克苏市兵团农一师九团职工医院工作27年', '沧州医学高等专科学校专科毕业', 7.1932148200105495, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18058342176', 
        crypt('4AiI3XQFKBoz', gen_salt('bf')), 'knOIoj@LIp.com', 'doctor', '卫逶输', 40, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,false,false,true,false}', '牙科', '在亳州市恒康医院工作8年', '泰山医学院硕士毕业', 5.628951129953304, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15235876294', 
        crypt('VPGE7e9g6', gen_salt('bf')), 'Duph5Ol@xUe.com', 'doctor', '熊卫龙', 60, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,true,true,false}', '内科', '在温州市中西医结合医院工作30年', '甘肃卫生职业学院本科毕业', 5.175985454388247, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15261850479', 
        crypt('eC3H0FnawSYp', gen_salt('bf')), 'N6hKdV@NUS.com', 'doctor', '纪铠奕', 37, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,true,false,false,true}', '牙科', '在盘县特区中医院工作9年', '遵义医药高等专科学校专科毕业', 1.2424561189170675, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13275241603', 
        crypt('3Nval6', gen_salt('bf')), '7MUOEjKdg@3xw.com', 'doctor', '钱逶', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,false,false,false}', '牙科', '在辽阳县中医院工作24年', '四川医科大学本科毕业', 6.586540403966312, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18214260983', 
        crypt('gLla4UQ1p9', gen_salt('bf')), '07YILy9q@fL.com', 'doctor', '宋襦', 44, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,false,false,false}', '牙科', '在九台市铁北医院工作13年', '皖西卫生职业学院博士毕业', 1.5892611372917833, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18298670521', 
        crypt('OHRnqMy6aKdB', gen_salt('bf')), 'Z6zPhqQx3@dIo.com', 'doctor', '朱毫藤', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,false,true,true}', '牙科', '在内蒙古平计矿务局总医院工作18年', '贵阳市卫生学校硕士毕业', 4.192093283031069, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15853482169', 
        crypt('xEkoV8OU', gen_salt('bf')), '5bzyF@XC.com', 'doctor', '戴噎', 60, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,true,true,false,true}', '外科', '在成都口腔医院工作31年', '沈阳医学院本科毕业', 3.5152793372515423, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18019368750', 
        crypt('rZme0nUPVL', gen_salt('bf')), 'TAm0jEhe@LpM.com', 'doctor', '计思文', 52, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,false,true,false}', '精神科', '在陆良县妇幼保健院工作20年', '华中科技大学同济医学院硕士毕业', 6.286189569184758, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13930786491', 
        crypt('MeoUKxBuANl', gen_salt('bf')), 'XBK2PIs@p5.com', 'doctor', '蒋亦俯', 57, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,false,false,true}', '外科', '在井陉矿务局医院工作28年', '云南大学医学院本科毕业', 7.0542685512368255, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18518207469', 
        crypt('UIzEphd', gen_salt('bf')), 'jYCp0mWNz@o1.com', 'doctor', '朱昱铭', 54, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,false,false,false}', '内科', '在津市市中医院工作23年', '广东药学院硕士毕业', 5.055864120359704, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13584930712', 
        crypt('VmXNZEB', gen_salt('bf')), 'ordKWBf@brs.com', 'doctor', '毛哨灰', 45, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,true,false,false}', '外科', '在沈阳市房天职工医院工作18年', '安徽医学高等专科学校专科毕业', 5.9372621755664365, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15914723605', 
        crypt('9MmGEi3L7plr', gen_salt('bf')), 'yZo8gQwA@41.com', 'doctor', '宋蝣嚼', 47, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,true,false,true}', '皮肤科', '在三门县妇幼保健站工作19年', '大庆医学高等专科学校专科毕业', 8.581343842294181, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15234276081', 
        crypt('ORPpi8cZqBmM', gen_salt('bf')), 'PGHEZF@bu.com', 'doctor', '明蛄', 54, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,false,false,true}', '妇科', '在封开县第二人民医院工作23年', '天津第二医学院硕士毕业', 5.903856116278384, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15540163982', 
        crypt('7tkBuFvAwD', gen_salt('bf')), 'KnMEm@c9.com', 'doctor', '纪饭帮', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,true,true,false}', '外科', '在永和县人民医院工作12年', '三峡大学医学院本科毕业', 7.689349513207003, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15664208195', 
        crypt('rnbaCPluKOs', gen_salt('bf')), 'FCPQjM@cQn.com', 'doctor', '陈澜', 46, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,true,false,true}', '精神科', '在中国人民解放军总后勤部第三职工医院工作17年', '包头医学院硕士毕业', 6.120194666623628, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13095832407', 
        crypt('TLPYblxuro6A', gen_salt('bf')), 'i16rlZg@cCX.com', 'doctor', '熊倍', 43, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,true,true,false}', '妇科', '在中国人民解放军第二一五医院工作11年', '贵阳中医学院博士毕业', 7.061370479704012, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15251392864', 
        crypt('pi0vu3KNJ7', gen_salt('bf')), 'Zvj6RpP@Ve.com', 'doctor', '计瞳', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,true,true,true,true}', '外科', '在中国中医研究院眼科医院工作19年', '南通大学医学院博士毕业', 4.775462610722435, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18242681790', 
        crypt('qTpOrbMD2fA', gen_salt('bf')), 'qsetpzvRc@03L.com', 'doctor', '尤皓', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,false,true,true}', '精神科', '在云梦县中医院工作7年', '济宁医学院博士毕业', 6.727444749690875, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15632809475', 
        crypt('wRWGqg1cYyp', gen_salt('bf')), 'VeRpzOo7@Efd.com', 'doctor', '吴桷千', 59, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,false,true,true}', '妇科', '在盘锦市兴隆台区人民医院工作31年', '浙江医药高等专科学校专科毕业', 2.4391371778104984, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15562801937', 
        crypt('pozAre', gen_salt('bf')), '1ElstH@Rt.com', 'doctor', '杨璇靳', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,false,true,false}', '内科', '在怀化市精神病医院工作20年', '惠州卫生职业技术学院博士毕业', 2.9542759355990915, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18640128356', 
        crypt('KoJQLfBOGyn7', gen_salt('bf')), 'JTxr8XyO@bYO.com', 'doctor', '熊嚼蚩', 56, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,true,false,true}', '精神科', '在昌乐县中医院工作26年', '上海健康职业技术学院本科毕业', 3.631260945809524, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13752431086', 
        crypt('N6soF9kXrj0', gen_salt('bf')), '3WofTY8d@aoB.com', 'doctor', '戴塬拶', 59, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,false,true,false,true}', '牙科', '在北安市结核病医院工作27年', '中国人民解放军白求恩军医学院博士毕业', 9.36023362905799, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15376982430', 
        crypt('9r4tsgxLvD', gen_salt('bf')), 'AYPdD3@Hk.com', 'doctor', '李摘', 52, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,false,true,false}', '精神科', '在西吉县妇幼保健所工作24年', '鸡西煤炭医学高等专科学校专科毕业', 2.952298047519837, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15379436285', 
        crypt('lMVYdsX', gen_salt('bf')), 'Y2O7iGJ@l6z.com', 'doctor', '陈奚', 46, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,false,false,true}', '妇科', '在晴隆县人民医院工作13年', '中国医科大学临床医药学院博士毕业', 9.118713249494379, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13628476130', 
        crypt('41xOdL', gen_salt('bf')), 'mG8E7B@SB.com', 'doctor', '周膀浩', 49, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,false,true,false,true}', '内科', '在韶关市福康医院工作19年', '南通大学医学院博士毕业', 3.0727570527451067, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18701762349', 
        crypt('1IRbtQf', gen_salt('bf')), 'v3NZz@sm.com', 'doctor', '褚卫忝', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,false,false,true}', '牙科', '在长宁区同仁医院工作21年', '山东大学口腔医学院博士毕业', 6.263858657913087, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13307651894', 
        crypt('W4cA9f0w', gen_salt('bf')), 'XhaWPSq@3zv.com', 'doctor', '沈犬霈', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,false,false,false,true}', '外科', '在常德市鼎城区肿瘤医院工作19年', '西藏藏医学院硕士毕业', 2.202938797696264, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18913479286', 
        crypt('HFgqWTN', gen_salt('bf')), 'E0huNv@g2T.com', 'doctor', '戴摆鸲', 47, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,false,false,false}', '外科', '在安化县联合医院工作15年', '山东大学齐鲁医学部硕士毕业', 3.0357357749922427, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15332649715', 
        crypt('uyPlHC', gen_salt('bf')), 'mHWoOVZ2z@2MB.com', 'doctor', '祁暧', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,false,false,true}', '妇科', '在石家庄市第五医院（原石家庄市传染病医院）工作20年', '第二军医大学博士毕业', 4.982881843419125, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18594102835', 
        crypt('PUBvWs5', gen_salt('bf')), 'CZySn@qf.com', 'doctor', '宋戗之', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,false,false,true}', '外科', '在衡水市远大集团友谊医院(原衡水市棉纺厂职工医院)工作20年', '首都医科大学博士毕业', 3.3281789272906313, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('14791473826', 
        crypt('L2voN4Tiqbxy', gen_salt('bf')), 'AxGjCa@HI.com', 'doctor', '秦诙', 37, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,true,true,true}', '外科', '在库伦旗蒙医医院工作12年', '菏泽医学专科学校专科毕业', 1.8831787334179593, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13467358921', 
        crypt('oEPCtJ6Ga4W', gen_salt('bf')), '1nTINpdAg@GVN.com', 'doctor', '孙怏', 46, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,true,false,true}', '皮肤科', '在汨罗市第二人民医院工作16年', '辽宁医学院医疗学院本科毕业', 4.980418404588791, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13917690534', 
        crypt('7jKLRwYf0', gen_salt('bf')), '65WXER@lh.com', 'doctor', '尤婉', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,true,true,true,true}', '皮肤科', '在永胜县妇幼保健院工作8年', '北华大学护理学院硕士毕业', 9.781657041021393, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18843125869', 
        crypt('4bE2Kp9j', gen_salt('bf')), 'YLiJv4Cc@we.com', 'doctor', '吴蕲', 60, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,true,false,true}', '牙科', '在新疆伊宁市痔瘘医院工作30年', '河北联合大学冀唐学院本科毕业', 4.01122320143236, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15215730682', 
        crypt('i3n4msZ9T', gen_salt('bf')), 'y7pGoMbKD@Qv.com', 'doctor', '赵禅', 49, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,false,false,false,true}', '皮肤科', '在滨州市结核医院滨州市肿瘤医院工作17年', '盐城卫生职业技术学院硕士毕业', 4.8588103927435125, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18080294516', 
        crypt('gUpzLNXtCT', gen_salt('bf')), 'Yvlgi5wd2@yw.com', 'doctor', '褚艴', 49, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,true,true,false}', '妇科', '在睢宁县传染病院工作18年', '江苏大学医学院博士毕业', 3.2045715877362824, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13938549216', 
        crypt('wVONKrSzLTt', gen_salt('bf')), 'd0FQ8@9Y.com', 'doctor', '祁啧凋', 48, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,true,true,true,false}', '皮肤科', '在呼市妇幼保健院工作16年', '甘肃中医药大学硕士毕业', 1.940800259963601, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13071368590', 
        crypt('xkgqVfrl', gen_salt('bf')), 'e0IwUVuvg@Zhz.com', 'doctor', '舒楞', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,false,true,false,true}', '妇科', '在察右后旗蒙医院工作24年', '牡丹江医学院本科毕业', 4.664210314906777, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15536927145', 
        crypt('fSqpnAjET', gen_salt('bf')), 'wfgDz@N0b.com', 'doctor', '舒甍', 37, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,false,false,false}', '精神科', '在安阳市灯塔医院工作6年', '重庆医科大学博士毕业', 3.787349381370947, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15115674329', 
        crypt('gFG23mWox5jn', gen_salt('bf')), '1QhuO@jX3.com', 'doctor', '杨嗥', 59, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,false,true,true}', '皮肤科', '在保靖县妇幼保健站工作32年', '邢台医学高等专科学校专科毕业', 6.354357917955987, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15020159768', 
        crypt('XBF84O0xscN', gen_salt('bf')), 'UH1Ww3xO@gx.com', 'doctor', '郑淳肥', 55, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,true,false,true}', '外科', '在铁岭市银州区中西医结合医院工作28年', '大连医科大学本科毕业', 3.2359479566588636, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15603928476', 
        crypt('lsW2Ui804r', gen_salt('bf')), 'lcA6HMshF@ncG.com', 'doctor', '伏壤习', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,true,true,false}', '外科', '在烟台桃村中心医院(原：栖霞市第二人民医院)工作7年', '第二军医大学南京军医学院博士毕业', 2.276459537011221, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13568102573', 
        crypt('H2JwgZ', gen_salt('bf')), 'rM8o69@Ou.com', 'doctor', '计席瞌', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,false,false,true}', '精神科', '在房山区燕山医院工作6年', '南方医科大学博士毕业', 1.579905989190241, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13186219307', 
        crypt('LmHc4UOh', gen_salt('bf')), 'XOAaY0KV@LdJ.com', 'doctor', '舒墟', 40, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,true,false,false}', '外科', '在新疆疏附县人民医院工作14年', '柳州医学高等专科学校专科毕业', 9.055758676059547, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18775480236', 
        crypt('rCmIEKv8VLP', gen_salt('bf')), 'X40hKc@NY.com', 'doctor', '熊班泶', 54, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,true,true,false,true}', '精神科', '在江津市工人医院工作28年', '江西中医药高等专科学校专科毕业', 2.620481934172218, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13637025698', 
        crypt('Yqv9T1tZrm', gen_salt('bf')), 'HxeuO@i5X.com', 'doctor', '邵交', 52, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,true,false,true}', '精神科', '在方城县公疗医院工作23年', '辽宁中医药大学杏林学院硕士毕业', 4.904451797212828, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18228091734', 
        crypt('P9yYGhU', gen_salt('bf')), 'eM3Z9KsXC@hI.com', 'doctor', '毛侨', 45, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,false,false,true,false}', '内科', '在黑龙江省亚布力林业局职工医院工作15年', '遵义医学院本科毕业', 9.86936997023241, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15880214693', 
        crypt('p7m9zX', gen_salt('bf')), 'b3ZJY0H@ca.com', 'doctor', '项疽纵', 37, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,true,true,false}', '外科', '在哈尔滨市道里区公费医疗医院工作6年', '广西中医药大学博士毕业', 6.828370010766341, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18226073984', 
        crypt('0mF5l8M7xSf', gen_salt('bf')), '89EQgFvzs@2J.com', 'doctor', '项旷', 46, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,false,true,false}', '精神科', '在大渡口区人民医院工作17年', '西北民族大学硕士毕业', 3.6882268424655713, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15238574160', 
        crypt('DVsbGfk7oXhJ', gen_salt('bf')), 'QMDukLwq@5IJ.com', 'doctor', '朱百翅', 43, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,true,true,true}', '精神科', '在安达市妇幼保健院工作15年', '白城医学高等专科学校专科毕业', 2.8274403526429523, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15549625187', 
        crypt('nvzZIiXg', gen_salt('bf')), 'rAgwu1pmN@gan.com', 'doctor', '郑枯谝', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,false,false,false,true}', '精神科', '在宁波市保黎医院宁波市第四医院工作17年', '皖南医学院博士毕业', 4.88662655758193, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18832967508', 
        crypt('cYxH7C', gen_salt('bf')), 'hkvyNrzep@N2b.com', 'doctor', '舒纬', 56, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,false,true,false}', '精神科', '在十八站林业局职工医院工作24年', '山西医科大学晋祠学院硕士毕业', 6.941046975262477, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('14735162490', 
        crypt('SrtpcF', gen_salt('bf')), 'zYWIws@wa.com', 'doctor', '董棘', 57, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,false,true,true,false}', '妇科', '在南海市南庄医院工作25年', '湖南师范大学医学院博士毕业', 2.3130754442730286, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15930259176', 
        crypt('HGfUkx', gen_salt('bf')), '1h6nZv0si@JT.com', 'doctor', '屈事金', 58, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,true,false,true}', '内科', '在长沙市骨质增生病专科医院工作31年', '邵阳医学高等专科学校专科毕业', 2.1623761821078316, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13721980735', 
        crypt('tCXVrSJ4', gen_salt('bf')), 'J2z6IsNZr@w2.com', 'doctor', '卫穿', 45, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,false,false,false,true}', '牙科', '在绍兴市中医院工作13年', '福建医科大学博士毕业', 8.076695680296766, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15130785146', 
        crypt('W9oyx8Xt', gen_salt('bf')), 'ucoSa@Dn.com', 'doctor', '贝鲲', 44, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,true,true,true}', '精神科', '在刚察县人民医院工作12年', '华中科技大学同济医学院博士毕业', 2.7068779401213283, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18751860429', 
        crypt('TVnDWu0Y', gen_salt('bf')), 'TmQtYhx@DI.com', 'doctor', '冯啮', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,false,false,false}', '牙科', '在周口市皮肤病医院工作8年', '山东大学医学院硕士毕业', 3.0119175421560116, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18908197653', 
        crypt('hq82TAEUa9Pe', gen_salt('bf')), 'kY4jpMlVG@wFe.com', 'doctor', '毛赕', 55, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,true,false,false}', '精神科', '在东莞市工人医院工作27年', '中国人民武装警察部队医学院本科毕业', 2.5112351883805935, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18587562301', 
        crypt('pqHDi0vwjS', gen_salt('bf')), 'n65Mf0L@Ss.com', 'doctor', '计搜', 56, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,true,true,true}', '外科', '在大洼县妇幼保健站工作25年', '兰州大学医学院硕士毕业', 2.1872281042804236, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13387610534', 
        crypt('uLpvIO4gwayQ', gen_salt('bf')), 'bNtCnxwjT@uf.com', 'doctor', '尤蹑', 53, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,false,false,false}', '外科', '在文登市肿瘤医院工作25年', '广东医学院本科毕业', 5.6102467637331666, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15798705624', 
        crypt('FIHEea6riP', gen_salt('bf')), 'zQZmft@w4v.com', 'doctor', '董瓦斟', 48, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,true,true,true,true}', '牙科', '在赤峰市元宝山区第一医院工作18年', '哈尔滨医科大学博士毕业', 4.445389710759606, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18010542983', 
        crypt('YVFhnGaNQCZO', gen_salt('bf')), '2kLPwx@SAn.com', 'doctor', '秦烛距', 59, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,false,false,true}', '精神科', '在綦江县肿瘤康复医院工作26年', '承德护理职业学院博士毕业', 7.149248512798456, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13789250374', 
        crypt('xPcKBoIhNztY', gen_salt('bf')), '95dTe@HB.com', 'doctor', '许襞', 46, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,false,false,false}', '妇科', '在枣庄市峄城区人民医院工作17年', '汕头大学医学院本科毕业', 4.590338239201041, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18756972148', 
        crypt('xWN8ze', gen_salt('bf')), 'WkgEiT6@bDI.com', 'doctor', '纪钲目', 39, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,true,true,false}', '牙科', '在临县第二人民医院工作14年', '邢台医学高等专科学校专科毕业', 9.114029205981144, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18871284095', 
        crypt('M5W1D6Q7N', gen_salt('bf')), 'mWxa1bP@waS.com', 'doctor', '沈范', 58, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,true,false,true}', '精神科', '在黑水县妇幼保健站工作32年', '上海医药高等专科学校专科毕业', 4.687820217667535, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15896407832', 
        crypt('WkNEQCrp', gen_salt('bf')), '3N4ISK0tC@0JP.com', 'doctor', '禹獠', 57, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,true,false,false,true}', '内科', '在朔州复退军人精神病院工作25年', '湖北理工学院医学院博士毕业', 9.983224242855433, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15023690845', 
        crypt('a9CSrBQR3', gen_salt('bf')), 'rU7ce@nDK.com', 'doctor', '项荣', 55, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,true,false,false}', '外科', '在南乐县精神病医院工作24年', '皖南医学院硕士毕业', 5.203072493707039, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15017584639', 
        crypt('HhL2u89ywNj', gen_salt('bf')), 'OUZClijM@wve.com', 'doctor', '秦悱爬', 48, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,false,false,true,false}', '外科', '在中国人民解放军空军水上村医院工作18年', '深圳大学医学部本科毕业', 3.035943723302365, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18831087429', 
        crypt('bfsL5KnZ2', gen_salt('bf')), 'YOrCRda@xJ.com', 'doctor', '舒廿', 44, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,false,true,true,true}', '妇科', '在庐江县中医院工作14年', '深圳大学医学部博士毕业', 6.549672421583965, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15683507412', 
        crypt('YOUrfhDNt', gen_salt('bf')), 'drQ12@LYz.com', 'doctor', '祝咧诌', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,false,false,false}', '皮肤科', '在淮阳县中医院工作19年', '南通大学医学院硕士毕业', 4.693170241684365, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18648239715', 
        crypt('PDo9wNRLBWv', gen_salt('bf')), 'Hb7SF0Kl@Kv.com', 'doctor', '冯伪', 58, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,false,false,true}', '皮肤科', '在莆田市肿瘤防治院工作31年', '南通大学医学院本科毕业', 5.06606305729607, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18657689321', 
        crypt('vucod8yCPB9X', gen_salt('bf')), 'OADus0JG@plZ.com', 'doctor', '祁陪', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,false,false,true}', '牙科', '在合肥市第二人民医院工作18年', '四川护理职业学院硕士毕业', 4.781881380326492, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13591324508', 
        crypt('2nOmpKLy', gen_salt('bf')), 'Axw0uJ1@pC.com', 'doctor', '熊螫', 50, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,false,true,false}', '内科', '在沂南县中医院工作24年', '柳州医学高等专科学校专科毕业', 9.122729249256338, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18268702143', 
        crypt('5UKRJY72', gen_salt('bf')), 'VaBtmT@67e.com', 'doctor', '秦彬蛉', 35, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,true,false,false,true}', '皮肤科', '在许昌市第二人民医院工作8年', '大同医学高等专科学校专科毕业', 2.074503794956422, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18039157028', 
        crypt('Bb2oVDMmxkW', gen_salt('bf')), 'XEVzYQ@hm.com', 'doctor', '李挛', 54, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,true,true,false}', '内科', '在克拉玛依市人民医院工作29年', '新疆维吾尔医学专科学校专科毕业', 1.414097591364635, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15328965143', 
        crypt('huiIS35', gen_salt('bf')), 'nohs8fdX@9I.com', 'doctor', '赵嗥', 54, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,false,false,false}', '妇科', '在东北制药总厂职工医院工作24年', '四川大学本科毕业', 7.690101779893828, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15525679830', 
        crypt('5EGprlRb1AI', gen_salt('bf')), 'EVriq@9pK.com', 'doctor', '孙终裘', 58, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,false,true,true}', '内科', '在河东区中医院工作27年', '北华大学医学院博士毕业', 2.0350413125470013, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18672516904', 
        crypt('RPdKjCTzlF0', gen_salt('bf')), '7GHOwR@bhH.com', 'doctor', '梁臧', 51, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,true,true,false}', '妇科', '在宁安县人民医院工作23年', '南京海军医学高等专科学校专科毕业', 3.6631618255457306, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15385136074', 
        crypt('4hYXS7vA', gen_salt('bf')), 'vT78m@1CX.com', 'doctor', '贝口', 53, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,false,true,true,true}', '妇科', '在新乡医学院第一附属医院工作26年', '安徽中医药高等专科学校专科毕业', 8.284067768797346, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13525749813', 
        crypt('1MWc6qg9', gen_salt('bf')), 'YqiAHosP@Rc.com', 'doctor', '毛常相', 43, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,true,false,true}', '皮肤科', '在藁城市糖尿病医院工作14年', '辽宁医药职业学院本科毕业', 5.0275298795476004, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15367589142', 
        crypt('fwKgvn0', gen_salt('bf')), 'mjGQKZL@rZt.com', 'doctor', '尤舜', 56, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,true,false,false,true}', '牙科', '在新丰县中医院工作26年', '湘南学院硕士毕业', 5.2632323434349875, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18667185249', 
        crypt('fDhaLkji', gen_salt('bf')), 'tlzEhr1S@8J.com', 'doctor', '郑诤殿', 35, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,true,true,false}', '皮肤科', '在漂塘钨矿职工医院工作4年', '江苏建康职业学院博士毕业', 2.4026435841093887, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13370564189', 
        crypt('o1BcaCNuqAhJ', gen_salt('bf')), 'cyVJB@MEv.com', 'doctor', '明锶', 60, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,false,false,false,true}', '内科', '在江永县中医院工作32年', '湖北民族学院医学院本科毕业', 1.294411451873076, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13261894237', 
        crypt('md2uW9', gen_salt('bf')), 'Ay7q1I@m7.com', 'doctor', '项前荪', 52, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,false,false,false}', '精神科', '在瓦房店市第五人民医院工作22年', '南方医科大学博士毕业', 2.819591694430467, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13532097481', 
        crypt('zdbOu2NZr6W', gen_salt('bf')), 'yN5jXcuB@CNQ.com', 'doctor', '禹仨', 59, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,true,false,false,true,false}', '皮肤科', '在重庆沙坪坝区井口医院工作28年', '四川护理职业学院博士毕业', 1.5309542871120976, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15627341856', 
        crypt('ypMS5YPBw', gen_salt('bf')), '7EOzD@AM.com', 'doctor', '邵牢脱', 42, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,true,true,true,true}', '牙科', '在河南省第六建筑工程公司职工医院工作9年', '四川医科大学博士毕业', 6.36566803066767, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15512430968', 
        crypt('CkjrDfz8', gen_salt('bf')), '7c84yKNm@j9x.com', 'doctor', '李拚漯', 48, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,true,true,true}', '外科', '在西安华厦医院工作16年', '浙江中医药大学滨江学院硕士毕业', 6.6841608445118705, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17403957784', 
        crypt('DK+xR5D*', gen_salt('bf')), 'vfero.maly@cronx.com', 'doctor', '邓俊智', 33, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,true,true,false}', '精神科', '任浙江省第一医院医师5年', '浙江大学医学院博士毕业', 3.9969623203505273, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15618362709', 
        crypt('0iUJSaCp', gen_salt('bf')), 'N97ig2G@r7.com', 'doctor', '舒管', 36, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,true,false,false,false}', '皮肤科', '在青海省中医院青海省中西医结合医院工作4年', '苏州大学医学部硕士毕业', 4.758162674874929, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15767314809', 
        crypt('X6gFOTwh3', gen_salt('bf')), 'DXjWPV5@guM.com', 'doctor', '明鍪', 40, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '上海市第九人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,false,true,true,true}', '外科', '在哈尔滨市老年病医院工作11年', '运城护理职业学院硕士毕业', 2.318860801076752, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15325913407', 
        crypt('k4rKiVNq', gen_salt('bf')), 'lypPZUJ@Zi.com', 'doctor', '冯学暗', 44, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '外科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,false,true,false}', '外科', '在万州区侨康医院工作12年', '沈阳药科大学硕士毕业', 2.066894908412147, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15201724695', 
        crypt('mR5rkq4VS', gen_salt('bf')), 'o6EUa@HP.com', 'doctor', '臧旃', 42, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,true,false,true,false,true}', '妇科', '在盈江县妇幼保健站工作12年', '深圳大学医学部本科毕业', 4.354838775814017, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15604153672', 
        crypt('tJCELAx3Mo', gen_salt('bf')), 'UWCH0AQOL@37.com', 'doctor', '明系入', 57, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,false,false,false,false,true}', '内科', '在鞍山市第四医院鞍山市肿瘤医院工作27年', '贵阳市卫生学校博士毕业', 3.4271589267541214, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13381692453', 
        crypt('pINqyx0tn6uA', gen_salt('bf')), 'tdcvjIAZP@NyR.com', 'doctor', '孙平风', 58, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,false,true,false,false}', '精神科', '在临汾铁路医院工作31年', '中国人民解放军福州医学高等专科学校专科毕业', 2.6204175253959145, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18505976812', 
        crypt('Cc3AX2JHYP', gen_salt('bf')), 'PMuGhnN@qG.com', 'doctor', '祝青', 58, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '上海市第六人民医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,true,false,true,false}', '牙科', '在兴化市第二人民医院工作26年', '广西中医药大学硕士毕业', 3.997969518949499, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15525361849', 
        crypt('9PShaC', gen_salt('bf')), 'lb6VfvHs@mw.com', 'doctor', '宋循', 40, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,true,true,false}', '精神科', '在海伦市结核病防治所工作9年', '山西医科大学博士毕业', 9.110497562206143, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15836508412', 
        crypt('aAVXkcWCt0', gen_salt('bf')), 'XdTgef@93.com', 'doctor', '禹仞凉', 48, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,false,true,false,false}', '皮肤科', '在江浦县人民医院工作23年', '揭阳医学高等专科学校专科毕业', 5.001531621808836, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15890153287', 
        crypt('2x9p8YM', gen_salt('bf')), 'x9KLCt@V5K.com', 'doctor', '李篦', 59, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '妇科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,true,true,false,true,false}', '妇科', '在伊克昭盟妇幼保健院工作27年', '运城护理职业学院硕士毕业', 7.283234649981522, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18960289437', 
        crypt('kKOHp5bA', gen_salt('bf')), 'CW2T6kwO@UX.com', 'doctor', '褚婧童', 36, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '皮肤科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,true,false,true,true,false,true}', '皮肤科', '在宿州市妇幼保健站工作6年', '成都中医药大学硕士毕业', 3.601238485477003, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13935784962', 
        crypt('9yjk4pFos', gen_salt('bf')), '6ry2WX@nbx.com', 'doctor', '陈霄', 53, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '精神科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,false,true,false,false,false,true}', '精神科', '在邗江县中医院工作25年', '中国医科大学临床医药学院本科毕业', 8.80372642867138, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15269240735', 
        crypt('9yZtU3puGL', gen_salt('bf')), 'wgf7VCZPj@doe.com', 'doctor', '项隆', 36, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '牙科'
          AND hospital_name = '浙大校医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,false,false,true}', '牙科', '在安康市中医院工作9年', '井冈山大学临床医学院本科毕业', 8.144342577330708, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('18803194258', 
        crypt('0cHqSbVgnR', gen_salt('bf')), '4MmOqdIZ@b4.com', 'doctor', '杨逞', 43, 'male')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '浙江省第一医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{true,true,false,false,false,false,true}', '内科', '在西安市眼科医院工作12年', '甘肃医学院博士毕业', 5.538031711088989, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;
DO
$$
    DECLARE
        tmp_doctor_id       INT;
        tmp_department_id   INT;
        tmp_hospital_id     INT;

    BEGIN
        INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('13310368794', 
        crypt('73ZO8HWh', gen_salt('bf')), 'U0a4MsXOj@MLA.com', 'doctor', '姚鲷', 43, 'female')
        RETURNING user_id INTO tmp_doctor_id;
        
        SELECT department.department_id, hospital.hospital_id
        INTO tmp_department_id, tmp_hospital_id
        FROM  department, hospital
        WHERE department_name = '内科'
          AND hospital_name = '解放军三〇七医院'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id, arrangement, major, experience, education, score, capacity)
        VALUES (tmp_doctor_id, tmp_department_id, tmp_hospital_id, '{false,false,false,false,true,false,true}', '内科', '在清涧县妇幼保健站工作12年', '中国医科大学临床医药学院硕士毕业', 2.5621270024126988, 10);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_doctor_id)
        WHERE department_id = tmp_department_id;
    END
$$;

-- 初始化 patient

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('16741957248', 
        crypt('4j$^Y3Pf', gen_salt('bf')), 'wstylo.bleu02@customright.com', 'patient', '吕才艺', 82, 'male');
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = 'wstylo.bleu02@customright.com';

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17404133919', 
        crypt('-R6Zr#<U', gen_salt('bf')), '8secreta@alibaba.cd', 'patient', '陈婧', 14, 'female');
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = '8secreta@alibaba.cd';

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('14749815233', 
        crypt('R8v{]qkx', gen_salt('bf')), 'tsaefho64i@kittiza.com', 'patient', '范思楠', 19, 'male');
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = 'tsaefho64i@kittiza.com';

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('17400217949', 
        crypt('a9Sh}hYF', gen_salt('bf')), '8ibrahim.kha@bookstorage.site', 'patient', '蔡依玉', 20, 'female');
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = '8ibrahim.kha@bookstorage.site';

INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('15280924959', 
        crypt('57R4W#qc', gen_salt('bf')), 'nleonardo.b@activelywell.com', 'patient', '蒋勰', 34, 'male');
INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = 'nleonardo.b@activelywell.com';

-- 初始化 comment

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '专业详实的解答，多谢医生'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '17404133919' AND doctor_user.username = '13261894237';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '谢谢医生！'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '17404133919' AND doctor_user.username = '13307651894';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '医生很厉害，但是我还有一些不明白的地方，希望下次还能请教医生~'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '17404133919' AND doctor_user.username = '15234276081';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '医生很厉害，但是我还有一些不明白的地方，希望下次还能请教医生~'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '15280924959' AND doctor_user.username = '15880214693';

INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '非常感谢医生，回复的速度真的很快！而且很详细。'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '14749815233' AND doctor_user.username = '13310368794';

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
        WHERE patient_user.username = '14749815233' AND doctor_user.username = '15115674329' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id, prescription_detail) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id, '
临床诊断：胃、十二指肠溃疡
处方1 R：奥美拉唑肠溶片 10mg×28片
Sig： 20mg q.d p.o
复方铝酸铋颗粒 1.3g×18包×2盒
Sig： 1.3g t.i.d p.o
克拉霉素缓释片 0.5g×3片×4盒
Sig： 0.5g q.d p.o
即：止酸剂（H2受体拮抗剂或质子泵抑制剂）+胃黏膜保护剂（如复方铝酸铋颗粒、枸橼酸铋钾胶囊） + 抗菌药（如甲硝唑、克拉霉素、阿莫西林等）。甲硝唑等应在餐后服用，以避免出现胃肠刺激症状；食物会延缓克拉霉素的吸收，因此在餐前空腹服用效果最佳；而阿莫西林不受食物影响，服用时间无限制。
处方1 R：奥美拉唑肠溶片 10mg×28片
Sig： 20mg q.d p.o
克拉霉素缓释片 0.5g×3片×4盒
Sig： 0.5g q.d p.o
甲硝唑片 0.2×72片
Sig： 0.4g t.i.d p.o
    ');
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
        WHERE patient_user.username = '17404133919' AND doctor_user.username = '15201724695' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id, prescription_detail) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id, '
临床诊断：牙周炎
R： 替硝唑片 0.5×6片
Sig： 0.5 q.12h p.o
阿莫西林胶囊 0.25×24粒
Sig： 0.5 q.8h p.o
    ');
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
        WHERE patient_user.username = '17404133919' AND doctor_user.username = '18903471592' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id, prescription_detail) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id, '
临床诊断：食道癌晚期
R： Inj N. S 500ml
注射用顺铂 10mg×2支 ×5
氟尿嘧啶注射液 0.25×4支
Sig： i.v.gtt q.d.
临用前以0.9%氯化钠注射液溶解，氟尿嘧啶按1000mg/m2.d，顺铂按20mg/m2.d，连用5天。间隔3-4周可重复用药。为防止其肾脏毒性，在用药前后，可采用大量输液的水化疗法，以降低顺铂的血浆浓度，增加其肾脏清除率；并可加用甘露醇，以加速肾脏的排泄功能，减少顺铂在肾小管中的积聚。
    ');
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
        WHERE patient_user.username = '16741957248' AND doctor_user.username = '13789250374' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id, prescription_detail) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id, '
临床诊断： 社区获得性肺炎
R： 皮试阴性 阿莫西林胶囊 0.25×24粒
Sig： 0.5 q.8h p.o
阿奇霉素分散片 0.25×6片
Sig： 0.5 q.d p.o
社区获得性肺炎应选用能覆盖肺炎链球菌、流感嗜血杆菌的药物，如广谱青霉素类抗菌药阿莫西林，需要时加用对肺炎支原体、肺炎衣原体、军团菌属等细胞内病原体有效的药物 ,如大环内酯类抗菌药。
    ');
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
        WHERE patient_user.username = '15280924959' AND doctor_user.username = '15549625187' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id, prescription_detail) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id, '
临床诊断：原发性肾病综合征
R： 黄 芪9 当 归6 白花蛇舌草9 穴 富3
生 地3 白 术3 山萸肉3 茯 苓6
白茅根6 川 芎6 丹 参3 红 花3
三 付
用 法：每日一付 水煎服.
草药处方的书写，须按照“君、臣、佐、使”的顺序排列；对调剂、煎煮的特殊要求的，应在药品右上方注明，并加括号，如布包、先煎、后下等；对饮片的产地、炮制有特殊要求的，要在药品名称之前写明；毒性中药饮片，在处方未注明“生用”的，应给付炮制品。
    ');
    END
$$;



-- 初始化 medicine
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('http://pimg.39.net/yaopin/20190902/10/2019090228_996010_505911.jpg', '双氯芬酸钾胶囊', '25mg * 20粒', 18.0);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('https://img.360kad.com/UploadFiles/Medication/2018/10/201810170927249493.jpg', '克霉唑片', '1片', 49.0);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('https://i1.kknews.cc/SIG=109cc4p/ctp-vzntr/6o6867126nsq4325o1q94op884r03o70.jpg', '盐酸米诺环素胶囊', '50mg * 20粒', 56.0);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('https://lh3.googleusercontent.com/proxy/LGYrDRV3WuvpmbRRS0KEQzEAklgFmCp2iubtZuJYzjeS2_5OgCYbIGkuGf2vK7pgyirhN8z1v-zYt01luaNVj3ICeGUUCKE8k56KW3BAJQ', '酒石酸美托洛尔片', '25mg * 20片', 8.8);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('http://img01.yun300.cn/repository/image/-TyvVUqzTPW4H1DBx3FAaA.jpg_1180xa.jpg?tenantId=140926&viewType=1&k=1607611065000', '盐酸艾司洛尔注射液', '10ml:0.1g * 5支', 447.0);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('https://img11.360buyimg.com/n1/jfs/t3442/132/400670862/359727/a9de758e/58087364Nb760df76.jpg', '999三九感冒灵颗粒', '10g * 9袋', 36.6);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/nutraingredients-asia.com/article/2020/06/08/node_3209580/11459307-1-eng-GB/_1_wrbm_large.png', '连花清瘟胶囊', '48粒', 25.8);
INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('https://imgservice.suning.cn/uimg1/b2c/image/XXOyuH6bBdEf5Tz89WwQqQ.jpg_800w_800h_4e', '福元/易下开塞露', '20ml * 20支', 11.0);
