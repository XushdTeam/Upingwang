package com.upingwang.service;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.pojo.SystemUser;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * show 系统用户服务
 *
 * @author Xushd
 * @since 2017/1/18 0018 下午 2:03
 */
public interface SystemUserService {

    /**
     * 通过用户phone 获取用户对象
     * @param userPhone
     * @return
     */
    SystemUser getSystemUserByUserPhone(String userPhone);

    /**
     * 用户列表
     * @param param
     * @return
     */
    PageResult getUserList(PageSearchParam param);

    /**
     * 通过用户id查找用户
     * @param iD
     * @return
     */
    SystemUser getUserById(Long iD);

    /**
     * 新增用户
     * @param user
     * @return
     */
    OperateEnum insertUser(SystemUser user);

    /**
     * 用户信息修改
     * @param user
     * @return
     */
    OperateEnum updateUser(SystemUser user);

    /**
     * 上传用户头像
     * @param filedata
     * @param userId
     * @return
     */
    JsonResult userAdvertUpload(MultipartFile filedata, long userId);

    /**
     * 用户密码修改
     * @param pass
     * @param pass0
     * @param pass1
     * @param pass2
     * @param id
     * @return
     */
    JsonResult userPassUpdate(String pass, String pass0, String pass1, String pass2, long id);

    /**
     * 用户修改角色
     * @param role
     * @param roleId
     * @return
     */
    OperateEnum updateUserRole(List role, long userId);
}
