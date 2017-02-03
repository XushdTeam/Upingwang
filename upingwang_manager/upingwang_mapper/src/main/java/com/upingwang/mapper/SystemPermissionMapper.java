package com.upingwang.mapper;

import com.upingwang.pojo.SystemPermission;
import com.upingwang.pojo.SystemPermissionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemPermissionMapper {
    long countByExample(SystemPermissionExample example);

    int deleteByExample(SystemPermissionExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemPermission record);

    int insertSelective(SystemPermission record);

    List<SystemPermission> selectByExample(SystemPermissionExample example);

    SystemPermission selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemPermission record, @Param("example") SystemPermissionExample example);

    int updateByExample(@Param("record") SystemPermission record, @Param("example") SystemPermissionExample example);

    int updateByPrimaryKeySelective(SystemPermission record);

    int updateByPrimaryKey(SystemPermission record);

    List<SystemPermission> getPermissionByRoleId(Long systemRoleId);

    List<SystemPermission> getPermissionByRoleIdAll(@Param("roleId") Long roleId, @Param("parentId") Long parentId);
}