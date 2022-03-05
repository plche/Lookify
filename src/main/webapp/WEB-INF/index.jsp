<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 3/03/22
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lookify!</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="col-12 text-center">
                <span class="fs-1 fw-bolder">Welcome to Lookify!</span>
            </div>
            <div class="min-vh-100 d-flex justify-content-center align-items-center">
                <a href="/dashboard">Start Looking!</a>
            </div>
        </div>
    </body>
</html>
