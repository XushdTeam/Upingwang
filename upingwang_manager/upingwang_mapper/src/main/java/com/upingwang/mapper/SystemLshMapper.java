package com.upingwang.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * Created by Xushd on 2017/2/6.
 */
public interface SystemLshMapper {

    long lshByTableName(@Param("tableName")String tableName);
}
