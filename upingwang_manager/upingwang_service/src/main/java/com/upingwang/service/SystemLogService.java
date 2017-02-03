package com.upingwang.service;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.pojo.SystemLog;

/**
 * show 系统日志服务
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 9:20
 */
public interface SystemLogService {


    long insertLog(SystemLog systemLog);

    PageResult getLogRunList(PageSearchParam param, int type);

    boolean logRunDel(int type);

    SystemLog getLogById(int id);
}
