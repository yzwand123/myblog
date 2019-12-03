package cn.yzw.myblog.utils;


import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class HttpUtil {


    private PoolingHttpClientConnectionManager manager;

    public HttpUtil(){
        manager = new PoolingHttpClientConnectionManager();
        manager.setMaxTotal(200);
        manager.setDefaultMaxPerRoute(50);
    }


    public String doGet(String url){

        CloseableHttpClient httpClient = HttpClients.custom().setConnectionManager(manager).build();

        HttpGet httpGet = new HttpGet(url);
        httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3");
        httpGet.setConfig(this.getConfig());
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpGet);
            if (response.getStatusLine().getStatusCode() == 200){
                if (response.getEntity() != null){
                    String content = EntityUtils.toString(response.getEntity(),"utf8");
                    return content;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (response != null){
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "";

    }

    private RequestConfig getConfig() {
        RequestConfig config = RequestConfig.custom()
                .setConnectTimeout(10000)
                .setConnectionRequestTimeout(10000)
                .setSocketTimeout(10000)
                .build();
        return config;
    }

    public String doPost(String url,String param){

        CloseableHttpClient httpClient = HttpClients.custom().setConnectionManager(manager).build();

        HttpPost httpPost = new HttpPost(url);

        httpPost.setHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3");

        httpPost.addHeader("Content-type", "application/json; charset=utf-8");

        StringEntity jsonEntity = new StringEntity(param,"utf-8");

        httpPost.setEntity(jsonEntity);
        CloseableHttpResponse response = null;
        try {
            response = httpClient.execute(httpPost);

            HttpEntity httpEntity = response.getEntity();
            if (response.getStatusLine().getStatusCode() == 200){
                if (response.getEntity() != null){
                    String context =EntityUtils.toString(response.getEntity(),"utf8");
                    return context;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        finally {
            if (response != null){
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
       return "";
    }
}
