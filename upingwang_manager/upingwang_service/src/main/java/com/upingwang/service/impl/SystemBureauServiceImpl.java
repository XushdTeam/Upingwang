package com.upingwang.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.SqlUtils;
import com.upingwang.mapper.SystemBureauMapper;
import com.upingwang.pojo.SystemBureau;
import com.upingwang.pojo.SystemBureauExample;
import com.upingwang.service.SystemBureauService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * show 教育局接口实现
 *
 * @author Xushd
 * @since 2017/2/4 0004 下午 3:51
 */
@Service
public class SystemBureauServiceImpl implements SystemBureauService {

    @Autowired
    private SystemBureauMapper bureauMapper;

    @Override
    public PageResult getBureauList(PageSearchParam param) {

        PageHelper.startPage(param.getPageIndex(), param.getPageSize());

        SystemBureauExample example = new SystemBureauExample();
        SystemBureauExample.Criteria criteria = example.createCriteria();
        if (param.getFiled("bureauName") != null) {
            criteria.andBureauNameLike(SqlUtils.getLikeSql(param.getFiled("bureauName")));
        }
        criteria.andDelflagEqualTo(0);
        example.setOrderByClause("id desc");
        List<SystemBureau> list = bureauMapper.selectByExample(example);

        PageInfo pageInfo = new PageInfo(list);

        return new PageResult(pageInfo);
    }

    @Override
    public SystemBureau getBureauById(Long iD) {
        return bureauMapper.selectByPrimaryKey(iD);
    }

    @SystemServiceLog(module = "教育局管理", methods = "教育局新增")
    @Override
    public OperateEnum insertBureau(SystemBureau bureau) {
        int res = bureauMapper.insertSelective(bureau);
        if (res > 0) {
            return OperateEnum.SUCCESS;
        } else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "教育局管理", methods = "教育局修改")
    @Override
    public OperateEnum updateBureau(SystemBureau bureau) {
        int res = bureauMapper.updateByPrimaryKeySelective(bureau);
        if (res > 0) {
            return OperateEnum.SUCCESS;
        } else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "教育局管理", methods = "教育局删除")
    @Override
    public OperateEnum deleteBureauById(Long iD) {
        SystemBureau bureau = new SystemBureau();
        bureau.setId(iD);
        bureau.setDelflag(1);
        int res = bureauMapper.updateByPrimaryKeySelective(bureau);
        if (res > 0) {
            return OperateEnum.SUCCESS;
        } else {
            return OperateEnum.FAILE;
        }
    }

    @Override
    public List<SystemBureau> selectBureauListAll() {
        SystemBureauExample example = new SystemBureauExample();

        SystemBureauExample.Criteria criteria = example.createCriteria();
        criteria.andDelflagEqualTo(0).andStatusEqualTo(1);
        example.setOrderByClause("id desc");

        return bureauMapper.selectByExample(example);
    }
}
