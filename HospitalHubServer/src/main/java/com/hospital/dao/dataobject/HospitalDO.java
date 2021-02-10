package com.hospital.dao.dataobject;

import java.util.List;

public class HospitalDO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hospital.hospital_id
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    private Integer hospitalId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hospital.hospital_name
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    private String hospitalName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hospital.hospital_address
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    private String hospitalAddress;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column hospital.department_id_list
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    private List<Integer> departmentIdList;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hospital.hospital_id
     *
     * @return the value of hospital.hospital_id
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public Integer getHospitalId() {
        return hospitalId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hospital.hospital_id
     *
     * @param hospitalId the value for hospital.hospital_id
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hospital.hospital_name
     *
     * @return the value of hospital.hospital_name
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public String getHospitalName() {
        return hospitalName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hospital.hospital_name
     *
     * @param hospitalName the value for hospital.hospital_name
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName == null ? null : hospitalName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hospital.hospital_address
     *
     * @return the value of hospital.hospital_address
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public String getHospitalAddress() {
        return hospitalAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hospital.hospital_address
     *
     * @param hospitalAddress the value for hospital.hospital_address
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public void setHospitalAddress(String hospitalAddress) {
        this.hospitalAddress = hospitalAddress == null ? null : hospitalAddress.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column hospital.department_id_list
     *
     * @return the value of hospital.department_id_list
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public List<Integer> getDepartmentIdList() {
        return departmentIdList;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column hospital.department_id_list
     *
     * @param departmentIdList the value for hospital.department_id_list
     *
     * @mbg.generated Wed Feb 10 12:04:27 CST 2021
     */
    public void setDepartmentIdList(List<Integer> departmentIdList) {
        this.departmentIdList = departmentIdList;
    }
}