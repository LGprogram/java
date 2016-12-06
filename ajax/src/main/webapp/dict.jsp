<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/12/6
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<input  id="keyword" type="text">
<button id="btn">query</button>
<button id="clean">clean</button>
<div id="div"></div>
<script>
    (function () {
        document.querySelector("#clean").onclick=function () {
            var parent =document.querySelector("#div");
            var childrens = parent.getElementsByTagName("p");
            for(var i=0;i<childrens.length;i++){
                parent.removeChild(childrens[i]);
            }
        }
        document.querySelector("#btn").onclick = function () {
        var keyword = document.querySelector("#keyword").value;
        var xmlHttp = new XMLHttpRequest();
        xmlHttp.open("get","/dict?query="+keyword);
        xmlHttp.onreadystatechange=function () {
            if(xmlHttp.readyState==4){
                if(xmlHttp.status==200){
                    var xmlDoc = xmlHttp.responseXML;
                    /*var result =xmlDoc.getElementsByTagName("ex")[0].childNodes[0].nodeValue;*/
                    var results = xmlDoc.getElementsByTagName("ex");
                    for(var i=0;i<results.length;i++){
                        var result = results[i].childNodes[0].nodeValue;
                        var resultNode = document.createTextNode(result);
                        var p = document.createElement("p");
                        p.appendChild(resultNode);
                        document.querySelector("#div").appendChild(p);
                    }



                }
            }
        }
        xmlHttp.send();
        }



    })();
</script>
</body>
</html>
