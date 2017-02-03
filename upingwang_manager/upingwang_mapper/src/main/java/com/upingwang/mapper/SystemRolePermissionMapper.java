package com.upingwang.mapper;

import com.upingwang.pojo.SystemRolePermissionExample;
import com.upingwang.pojo.SystemRolePermissionKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface SystemRolePermissionMapper {
    long countByExample(SystemRolePermissionExample example);

    int deleteByExample(SystemRolePermissionExample example);

    int deleteByPrimaryKey(SystemRolePermissionKey key);

    int insert(SystemRolePermissionKey record);

    int insertSelective(SystemRolePermissionKey record);

    List<SystemRolePermissionKey> selectByExample(SystemRolePermissionExample example);

    int updateByExampleSelective(@Param("record") SystemRolePermissionKey record, @Param("example") SystemRolePermissionExample example);

    int updateByExample(@Param("record") SystemRolePermissionKey record, @Param("example") SystemRolePermissionExample example);

    int insertRolePermission(@Param("list") List list);
}