package com.upingwang.service;

import com.upingwang.common.result.JsonResult;
import com.upingwang.pojo.SystemSchool;

/**
 * 学校服务接口
 * Created by Xushd on 2017/2/6.
 */
public interface SystemSchoolService {


    JsonResult insertSchool(SystemSchool school);
}
