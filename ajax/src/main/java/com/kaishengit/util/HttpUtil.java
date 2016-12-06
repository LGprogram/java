package com.kaishengit.util;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by liu on 2016/12/6.
 */
public class HttpUtil {
    public static String  getInputString(String url) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);

        try {
            HttpResponse response = httpClient.execute(httpGet);
            int statusCode = response.getStatusLine().getStatusCode();
            if(statusCode==200){
                InputStream inputStream = response.getEntity().getContent();
                String result =  IOUtils.toString(inputStream,"UTF-8");
                return result;
            }else{
                throw new RuntimeException("请求\" + url + \"异常 : "+statusCode);
            }
        } catch (IOException e) {
            throw new RuntimeException("请求\" + url + \"异常 : ");
        }


    }
}
