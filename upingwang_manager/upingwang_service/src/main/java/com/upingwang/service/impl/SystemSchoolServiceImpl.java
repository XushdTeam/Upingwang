package com.upingwang.service.impl;

import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.mapper.SystemSchoolMapper;
import com.upingwang.pojo.SystemSchool;
import com.upingwang.service.SystemSchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 学校服务接口实现
 * Created by Xushd on 2017/2/6.
 */
@Service
public class SystemSchoolServiceImpl implements SystemSchoolService {

    @Autowired
    private SystemSchoolMapper schoolMapper;


    @SystemServiceLog(module = "学校管理",methods = "学校新增")
    @Override
    public JsonResult insertSchool(SystemSchool school) {
        int res = schoolMapper.insertSelective(school);
        if (res > 0) {
            return JsonResult.build(OperateEnum.SUCCESS);
        } else {
            return JsonResult.build(OperateEnum.FAILE);
        }
    }
}
