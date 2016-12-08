<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/8
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="text" placeholder="Rss url" id="url">
<button id="read">readRss</button>
<div id="div"></div>
<script src="../static/js/jquery-1.11.3.min.js"></script>
<script>
    $(function () {
        $("#read").click(function () {
           /* $.get("/rss.xml").done(function () {

            }).error(function () {

            }).always(function () {

            });*/
           //再次点击按钮前将div中的html清空
           $("#div").html("");
           $.ajax({
               //此时发送请求的URL：http://localhost:8080/rss.xml?url=http%3A%2F%2Fwww.pingwest.com%2Ffeed%2F
               url:"/rss.xml",
               type:"get",
               data:{url:$("#url").val()},
               timeout:15000,
               success:function (data) {
                   //此处data是一个封装好的xml对象，相当于document
                   $(data).find("item").each(function () {
                       //jquery中的each循环$(this)=$(data).find("item")[i]
                       var title = $(this).find("title").text();
                       var link =$(this).find("link").text();
                        $("<P><a href='"+link+"' target='_blank'>"+title+"</a></p>").appendTo($("#div"));
                   })
               },
               error:function () {
                   alert("服务器异常");
               }
               
               
           });
        });
    });
</script>
</body>
</html>
