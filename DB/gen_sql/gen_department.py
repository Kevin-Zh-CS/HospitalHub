department_data = ['牙科', '内科', '外科', '皮肤科', '精神科', '妇科']

sql_wildcard = '''INSERT INTO department(hospital_id, department_name) SELECT hospital_id, '{department_name}' FROM hospital;
UPDATE hospital SET department_id_list = array_append(department_id_list, (SELECT department_id FROM department WHERE hospital.hospital_id = department.hospital_id AND department_name = '{department_name}'));
'''


def gen(sql_file):
    sql_file.write("\n-- 初始化 department\n")
    for department in department_data:
        sql_file.write(sql_wildcard.format(department_name=department))