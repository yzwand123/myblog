package cn.yzw.myblog.utils;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

public class QiNuiUtil {

    public static String[] IMAGE_FILE_EXTD = new String[] { "png", "bmp", "jpg", "jpeg","pdf" };

    private String ACCESS_KEY = "HFkwB3fDylVV1RQqvwywZu4zweYWsYYaSos_0E5x";
    private String SECRET_KEY = "ptnTMpQGTEG6pbb83ijw2-PQwAhwaKpqbkgVpIVz";
    // 要上传的空间
   private  String bucketname = "yzwblog";

   private static final Logger logger = LoggerFactory.getLogger(QiNuiUtil.class);

   private Auth auth = Auth.create(ACCESS_KEY,SECRET_KEY);

   private Configuration configuration = new Configuration(Zone.zone2());

   private UploadManager uploadManager = new UploadManager(configuration);

   private  String QINIU_IMAGE_DOMAIN = "http://q1ip7q933.bkt.clouddn.com/";

    // 简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public String getUpToken() {
        return auth.uploadToken(bucketname);
    }

    public String saveImage(MultipartFile file) throws IOException {
        try {
            int dotPos = file.getOriginalFilename().lastIndexOf(".");
            if (dotPos < 0) {
                return null;
            }
            String fileExt = file.getOriginalFilename().substring(dotPos + 1).toLowerCase();
            // 判断是否是合法的文件后缀
            if (!isFileAllowed(fileExt)) {
                return null;
            }

            String fileName = UUID.randomUUID().toString().replaceAll("-", "") + "." + fileExt;
            // 调用put方法上传
            Response res = uploadManager.put(file.getBytes(), fileName, getUpToken());
            // 打印返回的信息
            if (res.isOK() && res.isJson()) {
                // 返回这张存储照片的地址
                return QINIU_IMAGE_DOMAIN + JSONObject.parseObject(res.bodyString()).get("key");
            } else {
                logger.error("七牛异常:" + res.bodyString());
                return null;
            }
        } catch (QiniuException e) {
            // 请求失败时打印的异常的信息
            logger.error("七牛异常:" + e.getMessage());
            return null;
        }
    }


    public  String ImageUpload(File file,String filename){

        String key = "file/";
        String uptoken = auth.uploadToken(bucketname);
        Response response = null;
        try {
            response = uploadManager.put(file,key+filename,uptoken);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(),DefaultPutRet.class);
            return QINIU_IMAGE_DOMAIN+putRet.key;
        } catch (QiniuException e) {
            e.printStackTrace();
            return null;
        }

    }


    public static boolean isFileAllowed(String fileName) {
        for (String ext : IMAGE_FILE_EXTD) {
            if (ext.equals(fileName)) {
                return true;
            }
        }
        return false;
    }

}
