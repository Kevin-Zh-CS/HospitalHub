department_data = ['牙科', '内科', '外科', '皮肤科', '精神科', '妇科']

sql_wildcard = '''
INSERT INTO department(hospital_id, department_name)
SELECT hospital.hospital_id, '{department_name}'
FROM hospital
WHERE NOT EXISTS(
        SELECT department.hospital_id, department_name
        FROM department
        WHERE department.hospital_id = hospital.hospital_id
          AND department_name = '{department_name}');'''


def gen(sql_file):
    sql_file.write("\n-- 初始化 department\n")
    for department in department_data:
        sql_file.write(sql_wildcard.format(department_name=department))
        sql_file.write('\n')
