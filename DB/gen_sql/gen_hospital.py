# coding=utf-8
hospital_data = [
    ['浙大校医院', '浙江省杭州市西湖区余杭塘路388号'],
    ['上海市第九人民医院', '上海市虹口区周家嘴路525号'],
    ['解放军三〇七医院', '北京市丰台区东大街8号'],
    ['上海市第六人民医院', '中国上海市徐汇区田林宜山路600号'],
    ['浙江省第一医院', '浙江省杭州市上城区庆春路79号']
]

sql_wildcard = '''INSERT INTO hospital(hospital_name, hospital_address) VALUES('{hospital}', '{address}');
'''

def gen(sql_file):
    sql_file.write("-- 初始化 hospital\n")
    for row in hospital_data:
        sql_file.write(sql_wildcard.format(hospital=row[0], address=row[1]))