package com.upingwang.mapper;

import com.upingwang.pojo.SystemUserRoleExample;
import com.upingwang.pojo.SystemUserRoleKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemUserRoleMapper {
    long countByExample(SystemUserRoleExample example);

    int deleteByExample(SystemUserRoleExample example);

    int deleteByPrimaryKey(SystemUserRoleKey key);

    int insert(SystemUserRoleKey record);

    int insertSelective(SystemUserRoleKey record);

    List<SystemUserRoleKey> selectByExample(SystemUserRoleExample example);

    int updateByExampleSelective(@Param("record") SystemUserRoleKey record, @Param("example") SystemUserRoleExample example);

    int updateByExample(@Param("record") SystemUserRoleKey record, @Param("example") SystemUserRoleExample example);

    int insertUserRole(@Param("list") List list);
}