<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
<input type="text" id="name">
<button id="btn">sendRequest</button>
<div id="result"></div>
<script>
    (function (){
        
        //创建XMLHttpRequest对象
        function createXmlHttp() {
            var xmlHttp = null;
            if(window.ActiveXObject){
                var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }else{
                var xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
            
        }


        document.querySelector("#btn").onclick=function () {
            var name = document.querySelector("#name").value;
            sendGet(name);
//            sendPost(name);
        }
        function sendGet(name) {
            //获取Ajax引擎
            var xmlHttp = createXmlHttp()
            //2. 指定请求方式和地址
            xmlHttp.open("get","/ajax?name="+name);
            //3.发出请求
            xmlHttp.send();


        }

        function sendPost(name) {
            //1. 获取Ajax引擎
            var xmlHttp = createXmlHttp();
            //2. 指定请求方式和地址
            xmlHttp.open("post","/ajax");
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            //3. 配置回调函数
            xmlHttp.onreadystatechange=function () {
                var state = xmlHttp.readyState
                if(state==4){
                    var httpState = xmlHttp.status;//获取HTTP状态码
                    if(httpState==200){
                        //获取服务端返回的字符串
                        var result = xmlHttp.responseText;
                        var div = document.querySelector("#result");
                        if(result=="可用"){
                            div.innerText="此账号可以使用";
                        }else{
                            div.innerText="此账号已被占用";
                        }
                    }else{
                        alert("服务器错误"+httpState);
                    }
                }
            }
            xmlHttp.send("name="+name);
        }




    })();
</script>
</body>
</html>
