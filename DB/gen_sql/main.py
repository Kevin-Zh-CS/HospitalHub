import gen_hospital
import gen_user
import gen_department


def main():
    path = "../init_data.sql"
    sql_file = open(path, "w+")
    gen_hospital.gen(sql_file)
    gen_department.gen(sql_file)
    gen_user.gen(sql_file)
    sql_file.close()


if __name__ == "__main__":
    main()
