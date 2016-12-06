package com.kaishengit.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by liu on 2016/12/5.
 */
@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //表单提交(POST)含有中文
        request.setCharacterEncoding("UTF-8");
        //给客户端响应的编码转码
        response.setCharacterEncoding("UTF-8");
        //设置响应内容(纯字符串)
        response.setContentType("text/plain;charset=UTF-8");
        String  name = request.getParameter("name");
        System.out.println(name);
        PrintWriter out = response.getWriter();
        if("tom".equals(name)){
            System.out.println("no");
            out.print("不可用");
        }else{
            System.out.println("yes");
            out.print("可用");
        }
        System.out.println("hello,ajax"+ name);
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String name = request.getParameter("name");
        name = new String(name.getBytes("ISO8859-1"),"UTF-8");
        System.out.println(name);
        PrintWriter out = response.getWriter();
        out.print("Hello,World");
        out.flush();
        out.close();

    }
}
