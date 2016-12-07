<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/7
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<button id="btn">get</button>
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
        document.querySelector("#btn").onclick=function () {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open("get","/json");
            xmlHttp.onreadystatechange=function () {
                if(xmlHttp.readyState==4){
                    if(xmlHttp.status==200){
                        var result = xmlHttp.responseText;
                        var json = JSON.parse(result);
                        var tbody = document.getElementsByTagName("tbody")[0];
                        var tr = document.createElement("tr");
                        var idTd = document.createElement("td");
                        var nameTd = document.createElement("td");
                        var addressTd = document.createElement("td");
                        var idNode = document.createTextNode(json.id);
                        var nameNode = document.createTextNode(json.name);
                        var addressNode= document.createTextNode(json.address);
                        idTd.appendChild(idNode);
                        nameTd.appendChild(nameNode);
                        addressTd.appendChild(addressNode);
                        tr.appendChild(idTd);
                        tr.appendChild(nameTd);
                        tr.appendChild(addressTd);
                        tbody.appendChild(tr);

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
