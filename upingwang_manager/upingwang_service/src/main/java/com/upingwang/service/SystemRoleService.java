package com.upingwang.service;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.pojo.SystemRole;

import java.util.List;

/**
 * show 角色服务
 *
 * @author Xushd
 * @since 2017/1/19 0019 下午 7:54
 */
public interface SystemRoleService {

    /**
     * 通过用户ID 获取ROLE列表 包含权限集合
     * @param userId
     * @return
     */
    List<SystemRole> getRoleByUserId(long userId);

    /**
     * 通过分页数据和查询字段获取ROLE列表
     * @param param
     * @return
     */
    PageResult roleList(PageSearchParam param);

    /**
     * 通过ID获取角色信息
     * @param iD
     * @return
     */
    SystemRole getRoleById(Long iD);

    /**
     * 角色新增
     * @param role
     * @return
     */
    OperateEnum insertRole(SystemRole role);

    /**
     * 角色信息修改
     * @param role
     * @return
     */
    OperateEnum update(SystemRole role);

    /**
     * 角色信息删除
     * @param id
     * @return
     */
    OperateEnum deleteRoleById(Long id);



    /**
     * 修改角色权限信息
     * @param permission
     * @param roleId
     * @return
     */
    OperateEnum updateRolePermission(List permission, long roleId);

    /**
     * 获取用户的Role角色All
     * @param id
     * @return
     */
    List<SystemRole> getRoleListByUserIdAll(Long id);
}
