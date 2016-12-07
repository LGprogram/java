<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/7
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="text" id="username">
<span id="loading" style="display: none"><img src="/static/img/loding.gif" alt=""></span>
<span id="result"></span>
<script src="/static/js/jquery-1.11.3.min.js"></script>
<script>
    $(function () {
        $("#username").blur(function () {
            var name = $(this).val();

            $.ajax({
                url:"/ajax",
                type:"post",
                data:{"name":name,"age":23},
                timeout:15000,
                beforeSend:function () {
                    $("#loading").show();
                    $("#result").text("");
                },
                success:function (data) {
                    $("#result").text(data);
                },
                error:function () {
                    alert("服务器异常");
                },
                complete:function () {
                    $("#loading").hide();
                }
            });
        });
    });
</script>
</body>
</html>
