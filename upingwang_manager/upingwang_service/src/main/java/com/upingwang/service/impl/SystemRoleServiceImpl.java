package com.upingwang.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.SqlUtils;
import com.upingwang.mapper.SystemRoleMapper;
import com.upingwang.mapper.SystemRolePermissionMapper;
import com.upingwang.mapper.SystemUserRoleMapper;
import com.upingwang.pojo.*;
import com.upingwang.service.SystemRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 7:54
 */
@Service
public class SystemRoleServiceImpl implements SystemRoleService {


    @Autowired
    private SystemRoleMapper systemRoleMapper;

    @Autowired
    private SystemRolePermissionMapper rolePermissionMapper;

    @Autowired
    private SystemUserRoleMapper userRoleMapper;

    @Override
    public List<SystemRole> getRoleByUserId(long userId) {

        return systemRoleMapper.getRoleByUserId(userId);
    }

    @SystemServiceLog(module = "角色管理", methods = "角色列表")
    @Override
    public PageResult roleList(PageSearchParam param) {

        PageHelper.startPage(param.getPageIndex(), param.getPageSize());
        SystemRoleExample example = new SystemRoleExample();
        SystemRoleExample.Criteria criteria = example.createCriteria();
        criteria.andDelflagEqualTo(0);
        example.setOrderByClause("id");
        if (param.getFiled("roleName") != null) {
            criteria.andRoleNameLike(SqlUtils.getLikeSql(param.getFiled("roleName")));
        }
        List<SystemRole> roleList = systemRoleMapper.selectByExample(example);
        PageInfo pageInfo = new PageInfo(roleList);
        return new PageResult(pageInfo);
    }

    @Override
    public SystemRole getRoleById(Long iD) {
        return systemRoleMapper.selectByPrimaryKey(iD);
    }


    @SystemServiceLog(module = "角色管理", methods = "角色新增")
    @Override
    public OperateEnum insertRole(SystemRole role) {
        int res = systemRoleMapper.insertSelective(role);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else{
            return OperateEnum.FAILE;
        }
    }
    @SystemServiceLog(module = "角色管理", methods = "角色修改")
    @Override
    public OperateEnum update(SystemRole role) {
        int res = systemRoleMapper.updateByPrimaryKeySelective(role);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }


    @SystemServiceLog(module = "角色管理", methods = "角色删除")
    @Override
    public OperateEnum deleteRoleById(Long id) {
        //判断该角色是否分配给用户了
        SystemUserRoleExample example = new SystemUserRoleExample();
        SystemUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(id);
        long count = userRoleMapper.countByExample(example);
        if (count > 0) {
            return OperateEnum.ROLE_IS_USED;
        } else {
            SystemRole role = new SystemRole();
            role.setId(id);
            role.setStatus(null);
            role.setDelflag(1);
            int res = systemRoleMapper.updateByPrimaryKeySelective(role);
            if (res > 0) {
                return OperateEnum.SUCCESS;
            } else {
                return OperateEnum.FAILE;
            }
        }
    }

    @SystemServiceLog(module = "角色管理", methods = "修改角色的权限信息")
    @Override
    public OperateEnum updateRolePermission(List permission, long roleId) {

        //删除roleId拥有的所有权限
        SystemRolePermissionExample example = new SystemRolePermissionExample();
        SystemRolePermissionExample.Criteria criteria = example.createCriteria();
        criteria.andRoleIdEqualTo(roleId);
        rolePermissionMapper.deleteByExample(example);
        //判断permission是否为NULL
        if (permission == null) {
            return OperateEnum.SUCCESS;
        } else {
            //批量插入权限信息
            List<Map<String, String>> list = new ArrayList<>();
            for (Object id : permission) {
                Map<String, String> map = new HashMap<>();
                map.put("permissionId", String.valueOf(id));
                map.put("roleId", String.valueOf(roleId));
                list.add(map);
            }
            int ret = rolePermissionMapper.insertRolePermission(list);
            if (ret > 0) {
                return OperateEnum.SUCCESS;
            } else {
                return OperateEnum.FAILE;
            }
        }
    }

    @Override
    public List<SystemRole> getRoleListByUserIdAll(Long id) {


        return systemRoleMapper.gerRoleListByUserIdAll(id);
    }
}
