package cn.yzw.myblog.utils;

import com.alibaba.fastjson.JSONObject;

public class LocationUtil {

    public static String getLocation(String ip){
        String url = "http://ip.taobao.com/service/getIpInfo.php?ip=";
        HttpUtil httpUtil = new HttpUtil();
        String context = httpUtil.doGet(url+ip);
        if (context == null || "".equals(context))
            return "内网ip";
        JSONObject jsonObject = JSONObject.parseObject(context);

        JSONObject data = null;
        try {
            data = (JSONObject) jsonObject.get("data");
        } catch (Exception e) {
            e.printStackTrace();
            return "内网ip";
        }
        String city = data.getString("city");
        return city;
    }
}
