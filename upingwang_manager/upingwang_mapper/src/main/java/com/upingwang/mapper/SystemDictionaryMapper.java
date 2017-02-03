package com.upingwang.mapper;

import com.upingwang.pojo.SystemDictionary;
import com.upingwang.pojo.SystemDictionaryExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SystemDictionaryMapper {
    long countByExample(SystemDictionaryExample example);

    int deleteByExample(SystemDictionaryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SystemDictionary record);

    int insertSelective(SystemDictionary record);

    List<SystemDictionary> selectByExample(SystemDictionaryExample example);

    SystemDictionary selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SystemDictionary record, @Param("example") SystemDictionaryExample example);

    int updateByExample(@Param("record") SystemDictionary record, @Param("example") SystemDictionaryExample example);

    int updateByPrimaryKeySelective(SystemDictionary record);

    int updateByPrimaryKey(SystemDictionary record);
}