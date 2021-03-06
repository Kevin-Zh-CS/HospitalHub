package com.hospital.dao;

import com.hospital.dao.dataobject.MedicineDO;

public interface MedicineDOMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table medicine
     *
     * @mbg.generated Thu Mar 04 00:12:34 CST 2021
     */
    int deleteByPrimaryKey(Integer medicineId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table medicine
     *
     * @mbg.generated Thu Mar 04 00:12:34 CST 2021
     */
    int insert(MedicineDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table medicine
     *
     * @mbg.generated Thu Mar 04 00:12:34 CST 2021
     */
    int insertSelective(MedicineDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table medicine
     *
     * @mbg.generated Thu Mar 04 00:12:34 CST 2021
     */
    MedicineDO selectByPrimaryKey(Integer medicineId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table medicine
     *
     * @mbg.generated Thu Mar 04 00:12:34 CST 2021
     */
    int updateByPrimaryKeySelective(MedicineDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table medicine
     *
     * @mbg.generated Thu Mar 04 00:12:34 CST 2021
     */
    int updateByPrimaryKey(MedicineDO record);
}