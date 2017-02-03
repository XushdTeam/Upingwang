package com.upingwang.service.impl;

import com.upingwang.common.dto.MenuNode;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.mapper.SystemMenuMapper;
import com.upingwang.pojo.SystemMenu;
import com.upingwang.pojo.SystemMenuExample;
import com.upingwang.service.SystemMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/23 0023 上午 11:51
 */
@Service
public class SystemMenuServiceImpl implements SystemMenuService {

    @Autowired
    private SystemMenuMapper menuMapper;

    @SystemServiceLog(module = "菜单管理",methods = "菜单列表")
    @Override
    public List<SystemMenu> getMenuList(Boolean isParent) {

        List<SystemMenu> systemMenuList = menuMapper.selectParentMenuList();
        if (isParent){
            return systemMenuList;
        }else {
            List<SystemMenu> result = new ArrayList<>();
            for (SystemMenu systemMenu : systemMenuList) {
                result.add(systemMenu);
                SystemMenuExample example = new SystemMenuExample();
                SystemMenuExample.Criteria criteria = example.createCriteria();
                criteria.andDelflagEqualTo(0).andParentEqualTo(systemMenu.getId());
                example.setOrderByClause("sort");
                result.addAll(menuMapper.selectByExample(example));
            }
            return result;
        }
    }

    @Override
    public SystemMenu getMenuById(Long id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @SystemServiceLog(module = "菜单管理",methods = "菜单新增")
    @Override
    public OperateEnum insertMenu(SystemMenu menu) {
        int res = menuMapper.insertSelective(menu);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "菜单管理",methods = "菜单修改")
    @Override
    public OperateEnum updateMenu(SystemMenu menu) {

        int res = menuMapper.updateByPrimaryKeySelective(menu);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "菜单管理",methods = "菜单删除")
    @Override
    public OperateEnum deleteMenu(long id) {
        //逻辑删除
        SystemMenu menu = new SystemMenu();
        menu.setDelflag(1);
        menu.setStatus(null);
        menu.setId(id);
        int res = menuMapper.updateByPrimaryKeySelective(menu);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "菜单管理",methods = "前台菜单获取")
    @Override
    public List<?> getMenuListForWeb(String typeId) {
        List<?> results = getByParentId(Long.parseLong(typeId),false);
        return results;
    }

    /**
     * 递归获取菜单信息
     * @param parentId menuType or parent
     * @param isParent true parent false menuType
     * @return
     */
    private List<?> getByParentId(long parentId,boolean isParent){
        List results = new ArrayList<>();
        SystemMenuExample example = new SystemMenuExample();
        SystemMenuExample.Criteria criteria = example.createCriteria();
        if (isParent){
            criteria.andParentEqualTo(parentId);
        } else {
            criteria.andMenuTypeEqualTo(String.valueOf(parentId)).andParentEqualTo(0L);
        }
        criteria.andDelflagEqualTo(0).andStatusEqualTo(1);
        example.setOrderByClause("sort");
        List<SystemMenu> menuList = menuMapper.selectByExample(example);
        for (SystemMenu menu : menuList) {
            if (isParent){
                MenuNode node = new MenuNode(menu.getMenuName(),menu.getMenuIco(),menu.getMenuUrl());
                results.add(node);
            } else {
                if (menu.getSort()==0){
                    MenuNode node = new MenuNode(menu.getMenuName(),menu.getMenuIco(),true,getByParentId(menu.getId(),true));
                    results.add(node);
                }else {
                    MenuNode node = new MenuNode(menu.getMenuName(),menu.getMenuIco(),false,getByParentId(menu.getId(),true));
                    results.add(node);
                }

            }

        }
        return results;
    }
}
