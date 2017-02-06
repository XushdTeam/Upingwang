package com.upingwang.service.impl;

import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.mapper.SystemLshMapper;
import com.upingwang.service.SystemLshService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 系统流水号服务实现
 * Created by Xushd on 2017/2/6.
 */
@Service
public class SystemLshServiceImpl implements SystemLshService {

    @Autowired
    private SystemLshMapper lshMapper;

    @SystemServiceLog(module = "辅组功能",methods = "获取学校表的流水号")
    @Override
    public String getSchoolCode() {
        long lsh = lshMapper.lshByTableName("system_school");
        String code = String.format("S%04d", lsh+1L);
        return code;
    }
}
