package com.hospital.dao;

import com.hospital.dao.dataobject.DepartmentDO;

public interface DepartmentDOMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table department
     *
     * @mbg.generated Wed Feb 10 16:14:56 CST 2021
     */
    int deleteByPrimaryKey(Integer departmentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table department
     *
     * @mbg.generated Wed Feb 10 16:14:56 CST 2021
     */
    int insert(DepartmentDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table department
     *
     * @mbg.generated Wed Feb 10 16:14:56 CST 2021
     */
    int insertSelective(DepartmentDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table department
     *
     * @mbg.generated Wed Feb 10 16:14:56 CST 2021
     */
    DepartmentDO selectByPrimaryKey(Integer departmentId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table department
     *
     * @mbg.generated Wed Feb 10 16:14:56 CST 2021
     */
    int updateByPrimaryKeySelective(DepartmentDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table department
     *
     * @mbg.generated Wed Feb 10 16:14:56 CST 2021
     */
    int updateByPrimaryKey(DepartmentDO record);
}