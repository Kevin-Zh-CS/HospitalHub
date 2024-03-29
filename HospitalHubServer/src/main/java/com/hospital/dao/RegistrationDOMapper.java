package com.hospital.dao;

import com.hospital.dao.dataobject.RegistrationDO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RegistrationDOMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table registration
     *
     * @mbg.generated Thu Feb 18 00:09:20 CST 2021
     */
    int deleteByPrimaryKey(String registrationId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table registration
     *
     * @mbg.generated Thu Feb 18 00:09:20 CST 2021
     */
    int insert(RegistrationDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table registration
     *
     * @mbg.generated Thu Feb 18 00:09:20 CST 2021
     */
    int insertSelective(RegistrationDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table registration
     *
     * @mbg.generated Thu Feb 18 00:09:20 CST 2021
     */
    RegistrationDO selectByPrimaryKey(String registrationId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table registration
     *
     * @mbg.generated Thu Feb 18 00:09:20 CST 2021
     */
    int updateByPrimaryKeySelective(RegistrationDO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table registration
     *
     * @mbg.generated Thu Feb 18 00:09:20 CST 2021
     */
    int updateByPrimaryKey(RegistrationDO record);


    List<RegistrationDO> selectByIdAndTime(@Param("doctorId") Integer doctorId,
                                           @Param("time") Date time);

    List<RegistrationDO> selectByUserId(Integer userId);
}