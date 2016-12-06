<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/5
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<button id="btn">button</button>
<table class="table">
   <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>address</th>
        </tr>
   </thead>
    <tbody>

    </tbody>
</table>
<script>
    (function () {
        function createXmlHttp() {
            var xmlHttp = null;
            if(window.ActiveXObject){
                var xmlHttp = new ActiveXObject("Microsoft,XMLHTTP");
            }else{
                var xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
        }

        document.querySelector("#btn").onclick=function () {
            var xmlHttp = createXmlHttp();
            xmlHttp.open("get","/users.xml");
            xmlHttp.onreadystatechange=function () {
                if(xmlHttp.readyState==4){
                    if(xmlHttp.status==200){
                        //获取服务端返回的XML文档，并进行解析
                        var xmlDoc = xmlHttp.responseXML;//获取document对象
                        var userElements= xmlDoc.getElementsByTagName("user");
                        var tbody = document.getElementsByTagName("tbody")[0];
                        for(var i =0;i<userElements.length;i++){
                            var userElement = userElements[i];
                            var id = userElement.getAttribute("id");
                            var name = userElement.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                            var address= userElement.getElementsByTagName("address")[0].childNodes[0].nodeValue;

                            var tr = document.createElement("tr");
                            var idTd = document.createElement("td");
                            var nameTd = document.createElement("td");
                            var addressTd = document.createElement("td");

                            var idNode = document.createTextNode(id);
                            var nameNode = document.createTextNode(name);
                            var addressNode = document.createTextNode(address);

                            idTd.appendChild(idNode);
                            nameTd.appendChild(nameNode);
                            addressTd.appendChild(addressNode);

                            tr.appendChild(idTd);
                            tr.appendChild(nameTd);
                            tr.appendChild(addressTd);

                            tbody.appendChild(tr);

                        }

                        
                    }else{
                        alert("服务器错误："+xmlHttp.status);
                    }
                }
                
            }
            
            xmlHttp.send();
        }





    })();
</script>


</body>
</html>
