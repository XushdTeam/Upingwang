package com.upingwang.service;

import com.upingwang.common.result.JsonResult;
import org.springframework.web.multipart.MultipartFile;

/**
 * show 文件上传服务接口
 *
 * @author Xushd
 * @since 2017/2/6 0006 下午 2:45
 */
public interface UploadService {
    /**
     * 图片上传
     * @param filedata
     * @return
     */
    JsonResult uploadImg(MultipartFile filedata,String key);
}
