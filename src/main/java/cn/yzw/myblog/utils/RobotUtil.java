package cn.yzw.myblog.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class RobotUtil {

    private String url = "http://openapi.tuling123.com/openapi/api/v2";

    private String paramToJson(String text){
        JSONObject json = new JSONObject();

        JSONObject perception = new JSONObject();
        JSONObject inputText = new JSONObject();
        inputText.put("text", text);
        perception.put("inputText", inputText);
        json.put("perception", perception);

        JSONObject userInfo = new JSONObject();
        userInfo.put("apiKey", "906f1149973d4eaa9c52d788750931dd");
        userInfo.put("userId", "525914");
        json.put("userInfo", userInfo);

        return json.toJSONString();
    }

    private String sendText(String Text){
        String json = paramToJson(Text);
        HttpUtil httpUtil = new HttpUtil();
        String context = httpUtil.doPost(url,json);
        return context;
    }

    public String talk(String text){
        String context = sendText(text);
        JSONObject json = JSONObject.parseObject(context);
        JSONArray results = json.getJSONArray("results");
        JSONObject jsonObject = (JSONObject) results.get(0);
        String result = jsonObject.getJSONObject("values").get("text").toString();
        return result;
    }
}
