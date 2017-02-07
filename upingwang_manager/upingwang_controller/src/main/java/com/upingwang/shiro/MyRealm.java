package com.upingwang.shiro;

import com.upingwang.common.enums.AuthEnum;
import com.upingwang.pojo.SystemPermission;
import com.upingwang.pojo.SystemRole;
import com.upingwang.pojo.SystemUser;
import com.upingwang.service.SystemPermissionService;
import com.upingwang.service.SystemRoleService;
import com.upingwang.service.SystemUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/17 0017 下午 6:33
 */
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private SystemUserService systemUserService;

    @Autowired
    private SystemRoleService systemRoleService;

    @Autowired
    private SystemPermissionService systemPermissionService;

    /**
     * 为当前登陆成功的用户授予权限和角色，已经登陆成功了
     *
     * @param principalCollection
     * @return
     */

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        String userPhone = (String) principalCollection.getPrimaryPrincipal();
        Subject currentSubject = SecurityUtils.getSubject();
        SystemUser systemUser = (SystemUser) currentSubject.getSession().getAttribute(userPhone);
        List<SystemRole> roleList = systemRoleService.getRoleByUserId(systemUser.getId());
        for (SystemRole systemRole : roleList) {
            simpleAuthorizationInfo.addRole(systemRole.getRoleKey());
            List<SystemPermission> systemPermissionList = systemPermissionService.getPermissionByRoleId(systemRole.getId());
            for (SystemPermission systemPermission : systemPermissionList) {
                simpleAuthorizationInfo.addStringPermission(systemPermission.getPermissionKey());
            }
        }
        return simpleAuthorizationInfo;
    }

    /**
     * 验证当前登录的用户，获取认证信息
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String userPhone = token.getUsername();
        String passWord = String.valueOf(token.getPassword());
        SystemUser systemUser = systemUserService.getSystemUserByUserPhone(userPhone);
        if (systemUser == null) {
            //用户不存在
            throw new AuthenticationException(AuthEnum.USER_NO_EXIT.getStateInfo());
        } else if (systemUser.getStatus() == 0) {
            //帐号停用
            throw new AuthenticationException(AuthEnum.USER_STOP.getStateInfo());
        } else if (!passWord.equals(systemUser.getPassword())) {
            //密码错误
            throw new AuthenticationException(AuthEnum.USER_ERROR_PASSWORD.getStateInfo());
        }
        //登录成功
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userPhone, passWord, systemUser.getUserName());
        //绑定session信息
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        //用户手机号作为sessionKey
        session.setAttribute(userPhone, systemUser);
        return simpleAuthenticationInfo;
    }
}
