medicine_data = [
    ['双氯芬酸钾胶囊', '25mg * 20粒', 18.00],
    ['克霉唑片', '1片', 49.00],
    ['盐酸米诺环素胶囊', '50mg * 20粒', 56.00],
    ['酒石酸美托洛尔片', '25mg * 20片', 8.80],
    ['盐酸艾司洛尔注射液', '10ml:0.1g * 5支', 447.00],
    ['999三九感冒灵颗粒', '10g * 9袋', 36.60],
    ['连花清瘟胶囊', '48粒', 25.8],
    ['福元/易下开塞露', '20ml * 20支', 11.00]
]

sql_wildcard = '''INSERT INTO medicine(medicine_name, package_quantity, medicine_price) VALUES ('{name}', '{package}', {price});
'''

def gen(sql_file):
    sql_file.write("\n-- 初始化 medicine\n")
    for medicine in medicine_data:
        sql_file.write(sql_wildcard.format(name=medicine[0], package=medicine[1], price=medicine[2]))