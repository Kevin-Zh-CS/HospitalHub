# coding=utf-8
hospital_data = [
    ['浙大校医院', '浙江省杭州市西湖区余杭塘路388号', 'http://www.yihurenli.com/upload/201611/25/201611250908590213.jpg'],
    ['上海市第九人民医院', '上海市虹口区周家嘴路525号', 'https://img.ivfazl.com/uploads/allimg/1911/5-191101111443N6.jpg'],
    ['解放军三〇七医院', '北京市丰台区东大街8号', 'http://www.mztj.cn/upimg/userup/1303/060RU43332.jpg'],
    ['上海市第六人民医院', '中国上海市徐汇区田林宜山路600号', 'https://www.shsmu.edu.cn/images/banner6.jpg'],
    ['浙江省第一医院', '浙江省杭州市上城区庆春路79号', 'http://ssparking.com/upload/2016-5/2016052339510465.jpg']
]

sql_wildcard = '''INSERT INTO hospital(hospital_name, hospital_address, hospital_url) VALUES('{hospital}', '{address}', '{hospital_url}');
'''

def gen(sql_file):
    sql_file.write("-- 初始化 hospital\n")
    for row in hospital_data:
        sql_file.write(sql_wildcard.format(hospital=row[0], address=row[1], hospital_url=row[2]))