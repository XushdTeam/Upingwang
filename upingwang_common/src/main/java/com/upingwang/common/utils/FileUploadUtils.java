package com.upingwang.common.utils;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.PutObjectResult;
import com.aliyun.oss.model.UploadFileRequest;
import com.aliyun.oss.model.UploadFileResult;


import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.Map;

/**
 * show 文件上传工具类
 *
 * @author Xushd
 * @since 2017/2/6 0006 下午 3:04
 */
public class FileUploadUtils {


    public static String UploadFileOSS(Map<String, String> param, byte[] bytes) {

        OSSClient client = new OSSClient(param.get("endpoint"), param.get("accessKeyId"), param.get("accessKeySecret"));
        // 新文件名
        String newFileName = IDUtils.genImageName() + param.get("originalFilename").substring(param.get("originalFilename").lastIndexOf("."));

        client.putObject(param.get("bucketName"),param.get("key")+newFileName, new ByteArrayInputStream(bytes));

        return newFileName;

    }
}
