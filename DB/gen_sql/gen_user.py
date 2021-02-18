from gen_hospital import hospital_data
from gen_department import department_data

user_data = [
    ['17403957784', 'DK+xR5D*', 'vfero.maly@cronx.com', 'doctor', '邓俊智', 33, 'male'],
    ['17400663207', 'aVB^vK4H', 'vlinbr@blogstudent.com', 'doctor', '习星渊', 55, 'male'],
    ['14532187706', 'h8-CnzP<', 'qgeorge.bloom.58t@dbt845.xyz', 'doctor', '焦鸿志', 45, 'male'],
    ['18897834281', '5}W8Fdsr', 'sslimani.c@jarlhwa.com', 'doctor', '吕盈仪', 34, 'female'],
    ['14554580678', '9Gh`+Ezv', '2zkrya.altaay18t@mishti.shop', 'doctor', '王修远', 29, 'male'],
    ['16741957248', '4j$^Y3Pf', 'wstylo.bleu02@customright.com', 'patient', '吕才艺', 82, 'male'],
    ['17404133919', '-R6Zr#<U', '8secreta@alibaba.cd', 'patient', '陈婧', 14, 'female'],
    ['14749815233', 'R8v{]qkx', 'tsaefho64i@kittiza.com', 'patient', '范思楠', 19, 'male'],
    ['17400217949', 'a9Sh}hYF', '8ibrahim.kha@bookstorage.site', 'patient', '蔡依玉', 20, 'female'],
    ['15280924959', '57R4W#qc', 'nleonardo.b@activelywell.com', 'patient', '蒋勰', 34, 'male']
]

address_data = [
    '',
    '',
    '',
    '',
    ''
]

sql_wildcard = '''INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age, gender) VALUES('{username}', crypt('{password}', gen_salt('bf')), '{email}', '{tag}', '{true_name}', {age}, '{gender}');
'''

sql_doctor_wildcard = '''DO
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
        WHERE email = '{email}'
          AND department_name = '{department}'
          AND hospital_name = '{hospital}'
          AND department.hospital_id = hospital.hospital_id;

        INSERT INTO doctor(user_id, department_id, hospital_id)
        VALUES (tmp_user_id, tmp_department_id, tmp_hospital_id);

        UPDATE department
        SET doctor_id_list = array_append(doctor_id_list, tmp_user_id)
        WHERE department_id = tmp_department_id;
    END
$$;\n'''

sql_patient_wildcard = '''INSERT INTO patient(user_id) SELECT user_id FROM hospital_hub_user WHERE email = '{email}';'''


def gen(sql_file):
    sql_file.write("\n-- 初始化 user\n")
    for row in user_data:
        sql_file.write(sql_wildcard.format(username=row[0], password=row[1], email=row[2],
                                           tag=row[3], true_name=row[4], age=row[5], gender=row[6]))
    sql_file.write("\n-- 初始化 doctor和patient\n")
    for idx, row in enumerate(user_data):
        if idx < 5:
            sql_file.write(sql_doctor_wildcard.format(email=row[2], department=department_data[idx],
                                                      hospital=hospital_data[idx][0]))
        else:
            sql_file.write(sql_patient_wildcard.format(email=row[2]))
        sql_file.write('\n')
