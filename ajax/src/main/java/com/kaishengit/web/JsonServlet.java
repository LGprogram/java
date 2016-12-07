package com.kaishengit.web;

import com.google.gson.Gson;
import com.kaishengit.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by liu on 2016/12/7.
 */
@WebServlet("/json")
public class JsonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        User user = new User("1001","tom","美国");
        String json = new Gson().toJson(user);
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        out.close();


    }
}
