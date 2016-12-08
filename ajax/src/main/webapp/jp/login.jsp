<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/8
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%--class="animated bounce"为animate.css的CSS3动画效果--%>
    <form id="loginForm" class="animated bounce">
        <div class="form-group">
            <label>账号</label>
            <input type="text" class="form-control"name="username" id="username">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" class="form-control" name="password" id="password">
        </div>
        <button type="button" class="btn btn-primary" id="loginBtn">登录</button>
    </form>
</div>
<script src="../static/js/jquery-1.11.3.min.js"></script>
<script src="../static/js/jquery.validate.min.js"></script>
<script>
    $(function () {
        $("#loginBtn").click(function(){
            $("#loginForm").submit();
        });

        $("#loginForm").validate({
            errorElement:"span",
            errorClass:"text-danger",
            rules:{
                username:{
                    required:true
                },
                password:{
                    required:true
                }
            },
            messages:{
                username:{
                    required:"请输入账号"
                },
                password:{
                    required:"请输入密码"
                }
            },
            //提交时做下面的函数
            submitHandler:function(){
                $.ajax({
                    url : "/login",
                    type : "post",
                    data : $("#loginForm").serialize(),
                    beforeSend:function(){
                        $("#loginBtn").append($("<i class='fa fa-spinner fa-spin'></i>")).attr("disabled","disabled");
                    },
                    complete:function(){
                        $("#loginBtn").html("登录").removeAttr("disabled");
                    },
                    success : function(data) {
                        if(data.state == "error") {
                            alert(data.message);
                        } else {
                            window.location.href = "/jp/demo.jsp";
                        }
                    },
                    error : function() {
                        alert("服务器错误");
                    }
                });
            }
        });








        /*$("#loginBtn").click(function () {
           // $("#loginForm").submit();
            var username = $("#username").val();
            var password = $("#password").val();
            // {"username":username,"password":password}
            $.post("/login",$("#loginForm").serialize()).done(function (data) {
            if(data.state == "error"){
            alert(data.message);
            }else{
            window.location.href="/jp/demo.jsp";
            }
            }).error(function () {
            alert("服务器异常");
            });
        });*/

    });
</script>
</body>
</html>
