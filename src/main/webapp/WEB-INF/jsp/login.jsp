<%--
  Created by IntelliJ IDEA.
  User: mythwind
  Date: 2019/01/15
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>登陆</title>

    <!--  在src/main/resource目录下创建文件夹 webjars -->
    <script src="../webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="../webjars/bootstrap/4.0.0/css/bootstrap.min.css" />

    <style type="text/css">
        body {
            background-color: #EEEEE0;
        }
        .container {
            text-align: center;
            height: 350px;
            margin-top: 10%;
        }

        .row {
            margin-bottom: 30px;
            height: 40px;
        }

        .row input {
            width: 320px;
            height: 40px;
            padding: 0 15px;
            border-radius: 5px;
            border: 1px solid #acacac;
        }

        .row button {
            width: 352px;
            height: 42px;
            background-color: #409eff;
            color: white;
            border-radius: 5px;
            border: 0;
        }

        .row button:hover {
            background-color: teal;
            cursor: pointer;
        }

        .row button:active {
            background-color: green;
            cursor: pointer;
        }

        .lastrow {
            font-size: 14px;
            color: gray;
        }

        .lastrow a {
            text-decoration: none;
            color: #409eff;
        }
    </style>
    <script type="text/javascript">
        function loginCheck() {
            var username = $("#username");
            if (null == username || username == "") {
                alert("username is empty!");
                return false;
            }
            var password = $("#password");
            if (null == password || password == "") {
                alert("password is empty!");
                return false;
            }
            return true;
        }
        function login() {
            var username = $("#username").val();
            var password = $("#password").val();
            if (loginCheck() == false) {
                return ;
            }
           //提交表单
            $.ajax({
                url: "login",
                type: "post",
                dataType: "json",
                data: {
                    username: username,
                    password: password
                },
                success: function (result) {
                    //console.log(result);
                    alert(result.message);
                    if (result.code == 200) {
                        window.location.href = "success";
                    } else {
                        //alert(result.message);
                    }
                    window.location.href = "success";
                }
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>登陆</h1>
        </div>
        <div class="row">
            <input type="text" class="form-control" id="username" name="username" placeholder="Email Address" required autofocus />
        </div>
        <div class="row">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required autofocus />
        </div>
        <div class="row">
            <button id="loginbtn" onclick="login();">登 陆</button>
        </div>
        <div class="row lastrow">
            还没账号?
            <a href="#">免费注册</a>|
            <a href="#">找回密码</a>
        </div>
    </div>

</body>
</html>