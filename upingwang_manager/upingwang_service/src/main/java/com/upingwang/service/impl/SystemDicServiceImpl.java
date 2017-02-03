package com.upingwang.service.impl;

import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.mapper.SystemDictionaryMapper;
import com.upingwang.pojo.SystemDictionary;
import com.upingwang.pojo.SystemDictionaryExample;
import com.upingwang.service.SystemDicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * show
 *
 * @author Xushd
 * @since 2017/1/23 0023 下午 1:40
 */
@Service
public class SystemDicServiceImpl implements SystemDicService {

    @Autowired
    private SystemDictionaryMapper dictionaryMapper;

    @SystemServiceLog(module = "字典管理",methods = "字典列表")
    @Override
    public List<SystemDictionary> getDicList(Boolean isParent) {
        SystemDictionaryExample example = new SystemDictionaryExample();
        SystemDictionaryExample.Criteria criteria = example.createCriteria();
        criteria.andDelflagEqualTo(0).andParentEqualTo(0L);
        List<SystemDictionary> dictionaryList = dictionaryMapper.selectByExample(example);
        if (isParent){
            return dictionaryList;
        }else{
            List<SystemDictionary> result = new ArrayList<>();
            for (SystemDictionary dictionary : dictionaryList) {
                result.add(dictionary);
                example.clear();
                criteria = example.createCriteria();
                criteria.andDelflagEqualTo(0).andParentEqualTo(dictionary.getId());
                result.addAll(dictionaryMapper.selectByExample(example));
            }
            return result;
        }
    }

    @Override
    public SystemDictionary getDicById(Long id) {
        return dictionaryMapper.selectByPrimaryKey(id);
    }

    @SystemServiceLog(module = "字典管理",methods = "字典新增")
    @Override
    public OperateEnum insertDic(SystemDictionary dictionary) {

        int res = dictionaryMapper.insertSelective(dictionary);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "字典管理",methods = "字典修改")
    @Override
    public OperateEnum updateDic(SystemDictionary dictionary) {
        int res = dictionaryMapper.updateByPrimaryKeySelective(dictionary);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }

    @SystemServiceLog(module = "字典管理",methods = "字典删除")
    @Override
    public OperateEnum deleteDic(long id) {
        //逻辑删除
        SystemDictionary dictionary = new SystemDictionary();
        dictionary.setDelflag(1);
        dictionary.setStatus(null);
        dictionary.setId(id);
        //criteria.
        int res =  dictionaryMapper.updateByPrimaryKeySelective(dictionary);
        if(res>0){
            return OperateEnum.SUCCESS;
        }else {
            return OperateEnum.FAILE;
        }
    }


    @Override
    public List<SystemDictionary> getDicListByParent(long parent) {
        SystemDictionaryExample example = new SystemDictionaryExample();
        SystemDictionaryExample.Criteria criteria = example.createCriteria();
        criteria.andParentEqualTo(parent).andDelflagEqualTo(0).andStatusEqualTo(1);
        return dictionaryMapper.selectByExample(example);
    }
}
