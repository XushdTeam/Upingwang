package com.upingwang.mapper;

import com.upingwang.pojo.SystemRole;
import com.upingwang.pojo.SystemRoleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemRoleMapper {
    long countByExample(SystemRoleExample example);

    int deleteByExample(SystemRoleExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemRole record);

    int insertSelective(SystemRole record);

    List<SystemRole> selectByExample(SystemRoleExample example);

    SystemRole selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemRole record, @Param("example") SystemRoleExample example);

    int updateByExample(@Param("record") SystemRole record, @Param("example") SystemRoleExample example);

    int updateByPrimaryKeySelective(SystemRole record);

    int updateByPrimaryKey(SystemRole record);

    List<SystemRole> getRoleByUserId(long userId);


    List<SystemRole> gerRoleListByUserIdAll(Long id);
}