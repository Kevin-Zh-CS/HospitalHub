from gen_user import patient_data
from gen_user import doctor_data
from random import choice

fart = [
    '非常感谢医生，回复的速度真的很快！而且很详细。',
    '耐心、专业！',
    '医生很有责任心，解答很到位。',
    '无比赞，谢谢医生的解惑。',
    '谢谢医生，祝医生新年快乐！',
    '专业详实的解答，多谢医生',
    '谢谢医生！',
    '医生很厉害，但是我还有一些不明白的地方，希望下次还能请教医生~'
]

sql_wildcard = '''
INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '{content}'
FROM hospital_hub_user AS patient_user, hospital_hub_user AS doctor_user
WHERE patient_user.username = '{patient_username}' AND doctor_user.username = '{doctor_username}';'''


def gen(sql_file, n):
    sql_file.write("\n-- 初始化 comment\n")
    for it in range(n):
        sql_file.write(sql_wildcard.format(content=choice(fart), patient_username=choice(patient_data)[0],
                                           doctor_username=choice(doctor_data)[0]))
        sql_file.write('\n')
