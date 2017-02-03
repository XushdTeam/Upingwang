package com.upingwang.service;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.dto.PermissionResult;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.pojo.SystemPermission;

import java.util.List;

/**
 * show 权限服务
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 8:11
 */
public interface SystemPermissionService {


    /**
     * 通过RoleId 查询权限 集合
     * @param systemRoleId
     * @return
     */
    List<SystemPermission> getPermissionByRoleId(Long systemRoleId);

    PageResult getPermissionList(PageSearchParam pageSearchParam);

    OperateEnum insertPermission(SystemPermission permission);

    SystemPermission getPermissionById(long id);


    List<SystemPermission> getPermissionList(Boolean isParent);

    OperateEnum updatePermission(SystemPermission permission);

    OperateEnum deletePermission(long id);

    List<PermissionResult> getRolePermission(Long roleId);
}
