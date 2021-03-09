medicine_data = [
    ['http://pimg.39.net/yaopin/20190902/10/2019090228_996010_505911.jpg', '双氯芬酸钾胶囊', '25mg * 20粒', 18.00],
    ['https://img.360kad.com/UploadFiles/Medication/2018/10/201810170927249493.jpg', '克霉唑片', '1片', 49.00],
    ['https://i1.kknews.cc/SIG=109cc4p/ctp-vzntr/6o6867126nsq4325o1q94op884r03o70.jpg', '盐酸米诺环素胶囊', '50mg * 20粒', 56.00],
    ['https://lh3.googleusercontent.com/proxy/LGYrDRV3WuvpmbRRS0KEQzEAklgFmCp2iubtZuJYzjeS2_5OgCYbIGkuGf2vK7pgyirhN8z1v-zYt01luaNVj3ICeGUUCKE8k56KW3BAJQ', '酒石酸美托洛尔片', '25mg * 20片', 8.80],
    ['http://img01.yun300.cn/repository/image/-TyvVUqzTPW4H1DBx3FAaA.jpg_1180xa.jpg?tenantId=140926&viewType=1&k=1607611065000', '盐酸艾司洛尔注射液', '10ml:0.1g * 5支', 447.00],
    ['https://img11.360buyimg.com/n1/jfs/t3442/132/400670862/359727/a9de758e/58087364Nb760df76.jpg', '999三九感冒灵颗粒', '10g * 9袋', 36.60],
    ['https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/nutraingredients-asia.com/article/2020/06/08/node_3209580/11459307-1-eng-GB/_1_wrbm_large.png', '连花清瘟胶囊', '48粒', 25.8],
    ['https://imgservice.suning.cn/uimg1/b2c/image/XXOyuH6bBdEf5Tz89WwQqQ.jpg_800w_800h_4e', '福元/易下开塞露', '20ml * 20支', 11.00]
]

sql_wildcard = '''INSERT INTO medicine(medicine_image_url, medicine_name, package_quantity, medicine_price) VALUES ('{image_url}', '{name}', '{package}', {price});
'''

def gen(sql_file):
    sql_file.write("\n-- 初始化 medicine\n")
    for medicine in medicine_data:
        sql_file.write(sql_wildcard.format(image_url=medicine[0], name=medicine[1], package=medicine[2], price=medicine[3]))