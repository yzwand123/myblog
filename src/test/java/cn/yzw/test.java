package cn.yzw;

import cn.yzw.myblog.service.SensitiveWordService;
import cn.yzw.myblog.utils.*;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
import org.junit.Test;

import java.io.File;


public class test {
    @Test
    public void testMd5(){
        String password = "123456";
        System.out.println(MD5Util.strToMD5(password));
    }
    @Test
    public void testMail(){
        String title = "垃圾";
        String context = "史可法开始甲方为甲方j";
        String reqq = "1537004059@qq.com";

        try {
            MailUtil.sendMail(context,title,reqq);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testPath(){
        SensitiveWordService wordService = new SensitiveWordService();
        String str = wordService.removeSensitiveWord("你他妈的大傻逼");
        System.out.println(str);
    }

    @Test
    public void testPost(){

//        RobotUtil robotUtil = new RobotUtil();
//       String context = robotUtil.talk("讲个笑话吧");
//        System.out.println(context);
//

        HttpUtil httpUtil = new HttpUtil();
        String context = httpUtil.doGet("http://api.qingyunke.com/api.php?key=free&appid=0&msg=你个垃圾");
        System.out.println(context);
    }
    @Test
    public void testApp(){
        HttpUtil httpUtil = new HttpUtil();
        String json = httpUtil.doGet("http://v.juhe.cn/toutiao/index?type=top&key=f1a3ad71068cf191d59d02b1b5912223");
        JSONObject jsonObject = JSONObject.parseObject(StringEscapeUtils.unescapeJava(json));
        System.out.println(jsonObject);
    }

    @Test
    public void testLocation(){
        String context = LocationUtil.getLocation("125.34.6.143");
        System.out.println(context);
//        JSONObject jsonObject = JSONObject.parseObject(context);
//        JSONObject data = (JSONObject) jsonObject.get("data");
//        String city = data.getString("city");
    }

    @Test
    public  void qinui(){
        QiNuiUtil qiNuiUtil = new QiNuiUtil();
        File file = new File("C:\\Users\\yzw\\Desktop\\wechat.png");
        String path = qiNuiUtil.ImageUpload(file,"wechat");
        System.out.println("上传成功，图片地址："+path);
    }
}
