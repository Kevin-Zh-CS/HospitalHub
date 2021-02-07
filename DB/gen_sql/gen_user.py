from gen_hospital import hospital_data
from gen_department import department_data

user_data = [
    ['neo_hugh_0', 'WDNMD000', 'neo_hugh_0@996.icu.com', 'doctor', '胡洋凡零号', 1],
    ['neo_hugh_1', 'WDNMD001', 'neo_hugh_1@996.icu.com', 'doctor', '胡洋凡一号', 2],
    ['neo_hugh_2', 'WDNMD002', 'neo_hugh_2@996.icu.com', 'doctor', '胡洋凡二号', 3],
    ['neo_hugh_3', 'WDNMD003', 'neo_hugh_3@996.icu.com', 'doctor', '胡洋凡三号', 4],
    ['neo_hugh_4', 'WDNMD004', 'neo_hugh_4@996.icu.com', 'doctor', '胡洋凡四号', 5],
    ['neo_hugh_5', 'WDNMD005', 'neo_hugh_5@996.icu.com', 'patient', '胡洋凡五号', 6],
    ['neo_hugh_6', 'WDNMD006', 'neo_hugh_6@996.icu.com', 'patient', '胡洋凡六号', 7],
    ['neo_hugh_7', 'WDNMD007', 'neo_hugh_7@996.icu.com', 'patient', '胡洋凡七号', 8],
    ['neo_hugh_8', 'WDNMD008', 'neo_hugh_8@996.icu.com', 'patient', '胡洋凡八号', 9],
    ['neo_hugh_9', 'WDNMD009', 'neo_hugh_9@996.icu.com', 'patient', '胡洋凡九号', 10]
]

sql_wildcard = '''
INSERT INTO hospital_hub_user(username, password, email, tag, true_name, age)
SELECT '{username}', '{password}', '{email}', '{tag}', '{true_name}', {age}
WHERE NOT EXISTS(
        SELECT username, password, email, tag, true_name, age
        FROM hospital_hub_user
        WHERE username = '{username}'
          AND password = '{password}'
          AND email = '{email}'
          AND tag = '{tag}'
          AND true_name = '{true_name}'
          AND age = {age});'''

sql_doctor_wildcard = '''
INSERT INTO doctor(user_id, department_id, hospital_id)
SELECT hospital_hub_user.user_id, department.department_id, hospital.hospital_id
FROM hospital_hub_user,
     department,
     hospital
WHERE email = '{email}'
  AND department_name = '{department}'
  AND hospital_name = '{hospital}'
  AND department.hospital_id = hospital.hospital_id
  AND NOT EXISTS(
        SELECT user_id, department_id, hospital_id
        FROM doctor
        WHERE doctor.user_id = hospital_hub_user.user_id
          AND doctor.department_id = department.department_id
          AND doctor.hospital_id = hospital.hospital_id);'''

sql_patient_wildcard = '''
INSERT INTO patient(user_id)
SELECT user_id
FROM hospital_hub_user
WHERE email = '{email}'
  AND NOT EXISTS(
        SELECT user_id FROM patient WHERE patient.user_id = hospital_hub_user.user_id);'''


def gen(sql_file):
    sql_file.write("\n -- 初始化 user\n")
    for row in user_data:
        sql_file.write(sql_wildcard.format(username=row[0], password=row[1], email=row[2],
                                           tag=row[3], true_name=row[4], age=row[5]))
        sql_file.write('\n')
    sql_file.write("\n -- 初始化 doctor和patient\n")
    for idx, row in enumerate(user_data):
        if idx < 5:
            sql_file.write(sql_doctor_wildcard.format(email=row[2], department=department_data[idx],
                                                      hospital=hospital_data[idx][0]))
        else:
            sql_file.write(sql_patient_wildcard.format(email=row[2]))
        sql_file.write('\n')
