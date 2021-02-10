from gen_user import user_data
from random import choice

fart = [
    '你的侧脸应该制定为国家一级宝物',
    '快乐的方式有很多，最直接的，就是见到你',
    '你就是世界 你就是宇宙 你就是大陆 你就是国家 你就是扰乱我之后又来拯救我的人，你就是神 你就是上帝 你就是love  你就是天使 你就是上天派来拯救我的精灵',
    '世事如书，我偏爱你这一句',
    '你其有点像天上的月亮，也像那闪烁的星星，可惜我不是诗人，否则当写一万首诗来形容你的美丽',
    '这里一切都是丑的， 风、雨、太阳都丑，人也丑，我也丑得很。 只有你是青天一样可羡',
    '不知道为啥你要隔三差五发张自拍，我真的无语，要发就天天发，这是在拯救世界',
    '我翻遍网易云QQ虾米搜狗酷狗荔枝豆瓣喜马拉雅，也找不出一首像你这么甜的歌'
]

sql_wildcard = '''
INSERT INTO comment(patient_id, doctor_id, content)
SELECT patient_user.user_id, doctor_user.user_id, '{content}'
FROM hospital_hub_user AS patient_user,
     hospital_hub_user AS doctor_user
WHERE patient_user.username = '{patient_username}'
  AND doctor_user.username = '{doctor_username}';'''


def gen(sql_file, n):
    sql_file.write("\n-- 初始化 comment\n")
    for it in range(n):
        sql_file.write(sql_wildcard.format(content=choice(fart), patient_username=choice(user_data[6:10])[0],
                                           doctor_username=choice(user_data[0:5])[0]))
        sql_file.write('\n')
