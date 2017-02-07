package com.upingwang.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.SqlUtils;
import com.upingwang.mapper.SystemBureauMapper;
import com.upingwang.mapper.SystemSchoolMapper;
import com.upingwang.pojo.SystemBureau;
import com.upingwang.pojo.SystemSchool;
import com.upingwang.pojo.SystemSchoolExample;
import com.upingwang.service.SystemSchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 学校服务接口实现
 * Created by Xushd on 2017/2/6.
 */
@Service
public class SystemSchoolServiceImpl implements SystemSchoolService {

    @Autowired
    private SystemSchoolMapper schoolMapper;

    @Autowired
    private SystemBureauMapper bureauMapper;


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

    @SystemServiceLog(module = "学校管理",methods = "学校列表")
    @Override
    public JsonResult getSchoolList(PageSearchParam param) {

        PageHelper.startPage(param.getPageIndex(),param.getPageSize());
        SystemSchoolExample example = new SystemSchoolExample();
        SystemSchoolExample.Criteria criteria = example.createCriteria();
        if (param.getFiled("schoolName")!=null){
            criteria.andSchoolNameLike(SqlUtils.getLikeSql(param.getFiled("schoolName")));
        }
        criteria.andDelflagEqualTo(0);
        example.setOrderByClause("id desc");
        List<SystemSchool> schoolList = schoolMapper.selectByExample(example);
        for (SystemSchool school : schoolList) {
            String bureauName = bureauMapper.selectByPrimaryKey(school.getBureauId()).getBureauName();
            school.setBureauName(bureauName);
        }
        PageInfo pageInfo = new PageInfo(schoolList);
        return JsonResult.OK(new PageResult(pageInfo));
    }
}
