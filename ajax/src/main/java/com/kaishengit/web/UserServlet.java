package com.kaishengit.web;

import com.kaishengit.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

/**
 * Created by liu on 2016/12/5.
 */
@WebServlet("/users.xml")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1. 设置响应的字符编码
        response.setCharacterEncoding("UTF-8");
        //2. 设置响应头MIME type
        response.setContentType("text/xml;charset=UTF-8");
        User user = new User("1001","tom","洛阳");
        User user2 = new User("1002","Jack","日本");
        User user3 = new User("1003","Jason","中国");
        List<User> userList = Arrays.asList(user,user2,user3);
        PrintWriter out = response.getWriter();
        out.print("<?xml version =\"1.0\" encoding = \"UTF-8\" ?>");
        out.print("<users>");
        for(User u:userList){
//            out.print("<user id="+u.getId()+">");
            out.print("<user id = \""+u.getId()+"\">");
            out.print("<name>"+u.getName()+"</name>");
            out.print("<address>"+u.getAddress()+"</address>");
            out.print("</user>");
        }
        out.print("</users>");

        out.flush();
        out.close();

    }
}
