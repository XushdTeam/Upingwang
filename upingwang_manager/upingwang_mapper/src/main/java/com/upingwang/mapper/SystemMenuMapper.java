package com.upingwang.mapper;

import com.upingwang.pojo.SystemMenu;
import com.upingwang.pojo.SystemMenuExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemMenuMapper {
    long countByExample(SystemMenuExample example);

    int deleteByExample(SystemMenuExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemMenu record);

    int insertSelective(SystemMenu record);

    List<SystemMenu> selectByExample(SystemMenuExample example);

    SystemMenu selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemMenu record, @Param("example") SystemMenuExample example);

    int updateByExample(@Param("record") SystemMenu record, @Param("example") SystemMenuExample example);

    int updateByPrimaryKeySelective(SystemMenu record);

    int updateByPrimaryKey(SystemMenu record);

    //联表查询
    List<SystemMenu> selectParentMenuList();
}