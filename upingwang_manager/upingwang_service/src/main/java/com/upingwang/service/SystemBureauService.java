package com.upingwang.service;

import com.upingwang.common.dto.PageResult;
import com.upingwang.common.dto.PageSearchParam;
import com.upingwang.common.enums.OperateEnum;
import com.upingwang.pojo.SystemBureau;

import java.util.List;

/**
 * show 教育局接口
 *
 * @author Xushd
 * @since 2017/2/4 0004 下午 3:40
 */
public interface SystemBureauService {


    PageResult getBureauList(PageSearchParam param);

    SystemBureau getBureauById(Long iD);

    OperateEnum insertBureau(SystemBureau bureau);

    OperateEnum updateBureau(SystemBureau bureau);

    OperateEnum deleteBureauById(Long iD);

    List<SystemBureau> selectBureauListAll();
}
