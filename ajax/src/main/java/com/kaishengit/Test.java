package com.kaishengit;

import org.apache.commons.io.IOUtils;
import org.apache.http.Consts;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by liu on 2016/12/6.
 */
public class Test {
    public static void main(String[] args) throws IOException {

        CloseableHttpClient httpClient= HttpClients.createDefault();
        HttpPost post = new HttpPost("http://localhost:8080/save");
        List<NameValuePair> params = new ArrayList<>();

        params.add(new BasicNameValuePair("userName","杰克"));

        params.add(new BasicNameValuePair("address","美国"));
//默认编码格式为ISO8859-1，设置为UTF-8可以编译中文
// UrlEncodedFormEntity 可以模拟传统的HTML表单传送POST请求中的参数
      UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(params, "UTF-8");
        post.setEntity(formEntity);


        for(int i = 0;i < 5;i++) {
            httpClient.execute(post);
        }





        /*CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("http://ww1.sinaimg.cn/mw690/824de770jw1epwcnivby6j20go0p00x4.jpg");
        HttpResponse httpResponse = httpClient.execute(httpGet);
        int statusCode = httpResponse.getStatusLine().getStatusCode();
        if(statusCode==200){
            InputStream inputStream = httpResponse.getEntity().getContent();
            OutputStream outputStream = new FileOutputStream("D:/x.png");
            IOUtils.copy(inputStream,outputStream);
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        }
        httpClient.close();*/


        /*//创建了一个可以发出请求的客户端
        CloseableHttpClient httpClient = HttpClients.createDefault();
        //创建一个get请求方式
        HttpGet httpGet = new HttpGet("http://www.pingwest.com/feed/");
        //发出请求并接受服务端的响应
        HttpResponse httpResponse = httpClient.execute(httpGet);//返回CloseableHttpResponse对象

        //获取HTTP响应的状态码

        int statusCode = httpResponse.getStatusLine().getStatusCode();
        if(statusCode==200){
            //获取响应输入流
            InputStream inputStream = httpResponse.getEntity().getContent();
            String result = IOUtils.toString(inputStream,"UTF-8");
            inputStream.close();

            System.out.println(result);

        }else{
            System.out.println("服务器异常："+statusCode);
        }*/
    }
}
