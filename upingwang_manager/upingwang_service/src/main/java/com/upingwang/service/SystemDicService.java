package com.upingwang.service;

import com.upingwang.common.enums.OperateEnum;
import com.upingwang.pojo.SystemDictionary;

import java.util.List;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/23 0023 下午 1:39
 */
public interface SystemDicService {

    public List<SystemDictionary> getDicList(Boolean isParent);

    SystemDictionary getDicById(Long id);

    OperateEnum insertDic(SystemDictionary dictionary);

    OperateEnum updateDic(SystemDictionary dictionary);

    OperateEnum deleteDic(long id);

    List<SystemDictionary> getDicListByParent(long parent);
}
