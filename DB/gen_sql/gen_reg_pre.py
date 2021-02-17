from gen_user import user_data
from random import choice

sql_wildcard = '''
INSERT INTO registration(patient_id, doctor_id, hospital_id)
SELECT patient_user.user_id, doctor_user.user_id, hospital_id
FROM hospital_hub_user AS patient_user,
     hospital_hub_user AS doctor_user,
     doctor
WHERE patient_user.username = '{patient_username}'
  AND doctor_user.username = '{doctor_username}'
  AND doctor.user_id = doctor_user.user_id;
'''


def gen(sql_file, n):
    sql_file.write("\n-- 初始化 registration\n")
    for it in range(n):
        sql_file.write(sql_wildcard.format(patient_username=choice(user_data[6:10])[0],
                                           doctor_username=choice(user_data[0:5])[0]))
        sql_file.write('\n')
