package com.upingwang.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.SqlUtils;
import com.upingwang.common.utils.TimeUtils;
import com.upingwang.mapper.SystemLogMapper;
import com.upingwang.pojo.SystemLog;
import com.upingwang.pojo.SystemLogExample;
import com.upingwang.service.SystemLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/18 0018 上午 9:52
 */
@Service
public class SystemLogServiceImpl implements SystemLogService {

    @Autowired
    private SystemLogMapper systemLogMapper;


    @Override
    public long insertLog(SystemLog systemLog) {
        return systemLogMapper.insertSelective(systemLog);
    }



    @SystemServiceLog(module = "日志管理",methods = "日志列表")
    @Override
    public PageResult getLogRunList(PageSearchParam param,int type) {
        PageHelper.startPage(param.getPageIndex(),param.getPageSize());
        SystemLogExample example = new SystemLogExample();
        SystemLogExample.Criteria criteria = example.createCriteria();
        if (param.getFiled("userName")!=null){
            criteria.andUserNameLike(SqlUtils.getLikeSql(param.getFiled("userName")));
        }
        if (param.getFiled("timeBegin")!=null){
            criteria.andLogTimeGreaterThanOrEqualTo(TimeUtils.getDate(param.getFiled("timeBegin")));
        }
        if (param.getFiled("timeEnd")!=null){
            criteria.andLogTimeLessThanOrEqualTo(TimeUtils.getDate(param.getFiled("timeEnd")));
        }
        criteria.andLogTypeEqualTo(type);
        example.setOrderByClause("id desc");
        List<SystemLog> logList = systemLogMapper.selectByExample(example);
        PageInfo pageInfo = new PageInfo(logList);

        return new PageResult(pageInfo);
    }


    @SystemServiceLog(module = "日志管理",methods = "删除7天之前日志")
    @Override
    public boolean logRunDel(int type) {
        SystemLogExample example = new SystemLogExample();
        SystemLogExample.Criteria criteria = example.createCriteria();
        criteria.andLogTypeEqualTo(type).andLogTimeLessThan(TimeUtils.getDateBefore(7));
        int i = systemLogMapper.deleteByExample(example);
        if(i>=0)return true;
        return false;
    }

    @SystemServiceLog(module = "日志管理",methods = "异常日志详情")
    @Override
    public SystemLog getLogById(int id) {
        return systemLogMapper.selectByPrimaryKey((long) id);
    }
}
