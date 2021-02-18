from gen_user import user_data
from random import choice

sql_wildcard = '''DO
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
        WHERE patient_user.username = '{patient_username}' AND doctor_user.username = '{doctor_username}' AND doctor.user_id = doctor_user.user_id;

        INSERT INTO registration(patient_id, doctor_id, hospital_id, department_id) VALUES(tmp_patient_id, tmp_doctor_id, tmp_hospital_id, tmp_department_id)
        RETURNING registration_id INTO tmp_registration_id;
        
        INSERT INTO process(registration_id, doctor_id) VALUES(tmp_registration_id, tmp_doctor_id);

        INSERT INTO prescription(registration_id, patient_id, doctor_id) VALUES (tmp_registration_id, tmp_patient_id, tmp_doctor_id);
    END
$$;\n
'''


def gen(sql_file, n):
    sql_file.write("\n-- 初始化 registration\n")
    for it in range(n):
        sql_file.write(sql_wildcard.format(patient_username=choice(user_data[6:10])[0],
                                           doctor_username=choice(user_data[0:5])[0]))
        sql_file.write('\n')
