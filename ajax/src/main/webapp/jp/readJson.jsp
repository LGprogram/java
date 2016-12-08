<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/8
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button id="btn">getJson</button>
<script src="../static/js/jquery-1.11.3.min.js"></script>
<script>
    $(function () {
        $("#btn").click(function () {
            /*//第一种用法此时的function为success后执行的方法
            $.get("/json",function (data) {
                alert(data.id+"->"+data.name+"->"+data.address);
            });*/
            /*$.get("/json").done(function (data) {
                alert(data.id+"->"+data.name+"->"+data.address);
            }).error(function () {
                alert("服务器异常");
            });*/

            //当服务端未设置请求头setContextType("application/json;charset=UTF-8")时得到普通字符串通过 var json = JSON.parse(data)转换为json对象

            $.getJSON("/json").done(function (data) {
                alert(data.id+"->"+data.name+"->"+data.address);
            }).error(function () {
                alert("服务器异常");
            });

        });

    });
</script>
</body>
</html>
