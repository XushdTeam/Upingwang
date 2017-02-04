package com.upingwang.mapper;

import com.upingwang.pojo.SystemBureau;
import com.upingwang.pojo.SystemBureauExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemBureauMapper {
    long countByExample(SystemBureauExample example);

    int deleteByExample(SystemBureauExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemBureau record);

    int insertSelective(SystemBureau record);

    List<SystemBureau> selectByExample(SystemBureauExample example);

    SystemBureau selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemBureau record, @Param("example") SystemBureauExample example);

    int updateByExample(@Param("record") SystemBureau record, @Param("example") SystemBureauExample example);

    int updateByPrimaryKeySelective(SystemBureau record);

    int updateByPrimaryKey(SystemBureau record);
}