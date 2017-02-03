package com.upingwang.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.dto.PermissionResult;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.mapper.SystemPermissionMapper;
import com.upingwang.pojo.SystemPermission;
import com.upingwang.pojo.SystemPermissionExample;
import com.upingwang.service.SystemPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 8:11
 */
@Service
public class SystemPermissionServiceImpl implements SystemPermissionService {

    @Autowired
    private SystemPermissionMapper systemPermissionMapper;

    @SystemServiceLog(module = "权限管理",methods = "获取角色权限")
    @Override
    public List<SystemPermission> getPermissionByRoleId(Long systemRoleId) {
        return systemPermissionMapper.getPermissionByRoleId(systemRoleId);
    }


    @Override
    public PageResult getPermissionList(PageSearchParam pageSearchParam) {

        PageHelper.startPage(pageSearchParam.getPageIndex(),pageSearchParam.getPageSize());

        SystemPermissionExample example = new SystemPermissionExample();
        SystemPermissionExample.Criteria criteria = example.createCriteria();
        Map<String, String> searchFileds = pageSearchParam.getSearchFileds();
        if (searchFileds.containsKey("name")){
            criteria.andPermissionNameLike(searchFileds.get("name"));
        }
        if (searchFileds.containsKey("key")){
            criteria.andPermissionKeyEqualTo(searchFileds.get("key"));
        }
        List<SystemPermission> systemPermissionList = systemPermissionMapper.selectByExample(example);
        PageInfo pageInfo= new PageInfo(systemPermissionList);
        return new PageResult(pageInfo);
    }

    @SystemServiceLog(module = "权限管理",methods = "权限新增")
    @Override
    public OperateEnum insertPermission(SystemPermission permission) {
        int res = systemPermissionMapper.insertSelective(permission);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else{
            return OperateEnum.FAILE;
        }
    }


    @Override
    public SystemPermission getPermissionById(long id) {
        return systemPermissionMapper.selectByPrimaryKey(id);
    }

    @SystemServiceLog(module = "权限管理",methods = "获取权限列表")
    @Override
    public List<SystemPermission> getPermissionList(Boolean isParent) {

        SystemPermissionExample example = new SystemPermissionExample();
        SystemPermissionExample.Criteria criteria = example.createCriteria();
        criteria.andDelflagEqualTo(0).andParentEqualTo(0L);
        example.setOrderByClause("sort");
        List<SystemPermission> permissionList = systemPermissionMapper.selectByExample(example);
        if (isParent){
            return permissionList;
        }
        List<SystemPermission> resultList = new ArrayList<>();
        for (SystemPermission permission : permissionList) {
            resultList.add(permission);
            SystemPermissionExample example1 = new SystemPermissionExample();
            SystemPermissionExample.Criteria criteria1 = example1.createCriteria();
            criteria1.andDelflagEqualTo(0).andParentEqualTo(permission.getId());
            example1.setOrderByClause("sort");
            resultList.addAll(systemPermissionMapper.selectByExample(example1));
        }
        return resultList;
    }

    @SystemServiceLog(module = "权限管理",methods = "权限修改")
    @Override
    public OperateEnum updatePermission(SystemPermission permission) {
        int res = systemPermissionMapper.updateByPrimaryKeySelective(permission);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else{
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "权限管理",methods = "权限删除")
    @Override
    public OperateEnum deletePermission(long id) {
        //逻辑删除
        SystemPermission permission = new SystemPermission();
        permission.setDelflag(1);
        permission.setStatus(null);
        permission.setId(id);
        //criteria.
        int res =  systemPermissionMapper.updateByPrimaryKeySelective(permission);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else{
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "角色管理",methods = "获取角色对应的全部权限")
    @Override
    public List<PermissionResult> getRolePermission(Long roleId) {

        List<PermissionResult> resultList = new ArrayList<>();
        List<SystemPermission> parentList = systemPermissionMapper.getPermissionByRoleIdAll(roleId,0L);
        for (SystemPermission permission : parentList) {
            List<SystemPermission> childList = systemPermissionMapper.getPermissionByRoleIdAll(roleId,permission.getId());
            PermissionResult parentResult = new PermissionResult(permission.getId(),permission.getPermissionName(),permission.getPermissionKey(),permission.getIsChecked());
            List<PermissionResult> childListResult = new ArrayList<>();
            for (SystemPermission permission_c : childList) {
                childListResult.add(new PermissionResult(permission_c.getId(),permission_c.getPermissionName(),permission_c.getPermissionKey(),permission_c.getIsChecked()));
            }
            parentResult.setList(childListResult);
            resultList.add(parentResult);
        }

        return resultList;
    }






}
