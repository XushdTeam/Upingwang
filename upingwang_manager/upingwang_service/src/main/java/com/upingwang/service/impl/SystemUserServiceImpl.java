package com.upingwang.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.IDUtils;
import com.upingwang.common.utils.SqlUtils;
import com.upingwang.mapper.SystemRoleMapper;
import com.upingwang.mapper.SystemUserMapper;
import com.upingwang.mapper.SystemUserRoleMapper;
import com.upingwang.pojo.*;
import com.upingwang.service.SystemUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/18 0018 下午 2:05
 */
@Service
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    private SystemUserMapper systemUserMapper;

    @Autowired
    private SystemUserRoleMapper userRoleMapper;

    @Autowired
    private SystemRoleMapper roleMapper;


    @Value("${IMAGE_BASE_URL}")
    private String IMAGE_BASE_URL;
    @Value("${FILI_UPLOAD_PATH}")
    private String FILI_UPLOAD_PATH;


    @Override
    public SystemUser getSystemUserByUserPhone(String userPhone) {
        SystemUserExample systemUserExample = new SystemUserExample();
        SystemUserExample.Criteria criteria = systemUserExample.createCriteria();
        criteria.andUserPhoneEqualTo(userPhone).andDelflagEqualTo(0);
        List<SystemUser> systemUsers = systemUserMapper.selectByExample(systemUserExample);
        if (systemUsers == null || systemUsers.size() == 0) return null;
        return systemUsers.get(0);
    }

    @SystemServiceLog(module = "用户管理", methods = "用户列表")
    @Override
    public PageResult getUserList(PageSearchParam param) {

        PageHelper.startPage(param.getPageIndex(), param.getPageSize());

        SystemUserExample example = new SystemUserExample();
        SystemUserExample.Criteria criteria = example.createCriteria();
        if (param.getFiled("userName") != null) {
            criteria.andUserNameLike(SqlUtils.getLikeSql(param.getFiled("userName")));
        }
        if (param.getFiled("userPhone") != null) {
            criteria.andUserPhoneEqualTo(param.getFiled("userPhone"));
        }
        criteria.andDelflagEqualTo(0);
        example.setOrderByClause("id DESC");
        List<SystemUser> list = systemUserMapper.selectByExample(example);
        for (SystemUser user : list) {
            List<SystemRole> roleList = roleMapper.getRoleByUserId(user.getId());
            List<String> roleName = new ArrayList<>();
            for (SystemRole role : roleList) {
                roleName.add(role.getRoleName());
            }
            user.setRoleName(roleName);

        }
        PageInfo pageInfo = new PageInfo(list);

        return new PageResult(pageInfo);
    }


    @Override
    public SystemUser getUserById(Long iD) {
        return systemUserMapper.selectByPrimaryKey(iD);
    }

    @SystemServiceLog(module = "用户管理", methods = "用户新增")
    @Override
    public OperateEnum insertUser(SystemUser user) {
        //查询手机号是否重复
        SystemUserExample example = new SystemUserExample();
        SystemUserExample.Criteria criteria = example.createCriteria();
        criteria.andUserPhoneEqualTo(user.getUserPhone());
        long count = systemUserMapper.countByExample(example);
        if (count > 0) {
            return OperateEnum.USER_PHONE_EXIST;
        } else {
            int res = systemUserMapper.insertSelective(user);
            if (res > 0) {
                return OperateEnum.SUCCESS;
            } else {
                return OperateEnum.FAILE;
            }
        }
    }

    @SystemServiceLog(module = "用户管理", methods = "用户信息修改")
    @Override
    public OperateEnum updateUser(SystemUser user) {

        int res = systemUserMapper.updateByPrimaryKeySelective(user);
        if (res > 0) {
            return OperateEnum.SUCCESS;
        } else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "用户管理", methods = "用户头像修改")
    @Override
    public JsonResult userAdvertUpload(MultipartFile filedata, long userId) {
        try {
            if (filedata.isEmpty()) return JsonResult.build(OperateEnum.FILE_EMPTY);
            if (filedata.getSize() > 500 * 1024) return JsonResult.build(OperateEnum.FILE_SIZE);


            String originalFilename = filedata.getOriginalFilename();
            // 新文件名
            String newFileName = IDUtils.genImageName() + originalFilename.substring(originalFilename.lastIndexOf("."));

            File targetFile = new File(FILI_UPLOAD_PATH + "/advert/", newFileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }

            filedata.transferTo(targetFile);
            String httpUrl = IMAGE_BASE_URL + "/advert/" + newFileName;
            //更新用户信息
            SystemUser user = new SystemUser();
            user.setId(userId);
            user.setUserAdvert(httpUrl);
            int res = systemUserMapper.updateByPrimaryKeySelective(user);
            if (res > 0) {
                return JsonResult.build(200, OperateEnum.SUCCESS.getStateInfo(), httpUrl);
            } else {
                return JsonResult.build(OperateEnum.FAILE);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.build(OperateEnum.FAILE);
        }
    }

    @SystemServiceLog(module = "用户管理", methods = "密码修改")
    @Override
    public JsonResult userPassUpdate(String pass, String pass0, String pass1, String pass2, long id) {

        if (!StringUtils.equals(pass, pass0)) {
            return JsonResult.build(OperateEnum.PASS_ERROR);
        } else if (!StringUtils.equals(pass1, pass2)) {
            return JsonResult.build(OperateEnum.PASS_NOT_EQUAIL);
        } else {
            SystemUser user = new SystemUser();
            user.setId(id);
            user.setPassword(pass1);
            int ret = systemUserMapper.updateByPrimaryKeySelective(user);
            if (ret > 0) {
                return JsonResult.build(OperateEnum.SUCCESS);
            } else {
                return JsonResult.build(OperateEnum.FAILE);
            }
        }
    }

    @SystemServiceLog(module = "用户管理", methods = "修改用户角色")
    @Override
    public OperateEnum updateUserRole(List role, long userId) {

        //删除用户已有的角色信息
        SystemUserRoleExample example = new SystemUserRoleExample();
        SystemUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        userRoleMapper.deleteByExample(example);
        if (role == null) {
            return OperateEnum.SUCCESS;
        } else {
            //批量插入角色信息
            List<Map<String, String>> list = new ArrayList<>();
            for (Object id : role) {
                Map<String, String> map = new HashMap<>();
                map.put("roleId", String.valueOf(id));
                map.put("userId", String.valueOf(userId));
                list.add(map);
            }
            int ret = userRoleMapper.insertUserRole(list);
            if (ret > 0) {
                return OperateEnum.SUCCESS;
            } else {
                return OperateEnum.FAILE;
            }
        }

    }

    @SystemServiceLog(module = "用户管理", methods = "删除用户信息")
    @Override
    public OperateEnum deleteUserById(long userId) {

        SystemUser user = new SystemUser();
        user.setId(userId);
        user.setDelflag(1);
        int ret = systemUserMapper.updateByPrimaryKeySelective(user);
        if (ret > 0) {
            return OperateEnum.SUCCESS;
        } else {
            return OperateEnum.FAILE;
        }

    }


}
