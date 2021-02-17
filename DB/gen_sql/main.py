import gen_hospital
import gen_user
import gen_department
import gen_comment
import gen_reg_pre

def main():
    path = "../init_data.sql"
    sql_file = open(path, "w+")
    gen_hospital.gen(sql_file)
    gen_department.gen(sql_file)
    gen_user.gen(sql_file)
    gen_comment.gen(sql_file, 5)
    gen_reg_pre.gen(sql_file, 5)
    sql_file.close()


if __name__ == "__main__":
    main()
