package com.upingwang.service.impl;

import com.upingwang.common.enums.OperateEnum;
import com.upingwang.common.result.JsonResult;
import com.upingwang.common.target.SystemServiceLog;
import com.upingwang.common.utils.FileUploadUtils;
import com.upingwang.common.utils.IDUtils;
import com.upingwang.service.UploadService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

/**
 * show 文件上传服务实现
 *
 * @author Xushd
 * @since 2017/2/6 0006 下午 2:46
 */
@Service
public class UploadServiceImpl implements UploadService {


    @Value("${ENDPOINT}")
    private String ENDPOINT;

    @Value("${ACCESSKEYID}")
    private String ACCESSKEYID;

    @Value("${ACCESSKEYSECRET}")
    private String ACCESSKEYSECRET;

    @Value("${BUCKETNAME}")
    private String BUCKETNAME;

    @Value("${OSSURL}")
    private String OSSURL;

    @Value("${ADVERT_STYLE}")
    private String ADVERT_STYLE;

    @Override
    public JsonResult uploadImg(MultipartFile filedata,String key) {

        try {

            if (filedata.isEmpty()) return JsonResult.build(OperateEnum.FILE_EMPTY);
            if (filedata.getSize() > 500 * 1024) return JsonResult.build(OperateEnum.FILE_SIZE);

            Map param = getParam();
            String originalFilename = filedata.getOriginalFilename();
            param.put("originalFilename",originalFilename);
            param.put("key",key);

            String newFileName = FileUploadUtils.UploadFileOSS(param,filedata.getBytes());

            return JsonResult.build(200,OperateEnum.FILE_UPLOAD_SUCCESS.getStateInfo(),OSSURL+key+newFileName+ADVERT_STYLE);

        }catch (Exception e){
            e.printStackTrace();
            return JsonResult.build(OperateEnum.FAILE);
        }
    }

    /**
     * 获取OSS对象参数
     * @return
     */
    private Map<String,String> getParam(){

        Map<String,String> param = new HashMap<>();
        param.put("endpoint",ENDPOINT);
        param.put("accessKeyId",ACCESSKEYID);
        param.put("accessKeySecret",ACCESSKEYSECRET);
        param.put("bucketName",BUCKETNAME);

        return param;
    }
}
