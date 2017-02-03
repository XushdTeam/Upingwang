package com.upingwang.service;

import com.upingwang.common.enums.OperateEnum;
import com.upingwang.pojo.SystemMenu;

import java.util.List;

/**
 * show 菜单服务
 *
 * @author Xushd
 * @since 2017/1/23 0023 上午 11:49
 */
public interface SystemMenuService {

    /**
     * isParent True 获取父节点菜单 False 获取所有菜单
     * @param isParent
     * @return
     */
    public List<SystemMenu> getMenuList(Boolean isParent);

    SystemMenu getMenuById(Long id);

    OperateEnum insertMenu(SystemMenu menu);

    OperateEnum updateMenu(SystemMenu menu);

    OperateEnum deleteMenu(long id);

    List<?> getMenuListForWeb(String typeId);
}
