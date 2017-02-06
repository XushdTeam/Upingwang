package com.upingwang.mapper;

import com.upingwang.pojo.SystemSchool;
import com.upingwang.pojo.SystemSchoolExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemSchoolMapper {
    long countByExample(SystemSchoolExample example);

    int deleteByExample(SystemSchoolExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemSchool record);

    int insertSelective(SystemSchool record);

    List<SystemSchool> selectByExample(SystemSchoolExample example);

    SystemSchool selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemSchool record, @Param("example") SystemSchoolExample example);

    int updateByExample(@Param("record") SystemSchool record, @Param("example") SystemSchoolExample example);

    int updateByPrimaryKeySelective(SystemSchool record);

    int updateByPrimaryKey(SystemSchool record);
}