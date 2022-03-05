<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 4/03/22
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Top Ten Songs</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container ms-4 mt-4">
            <div class="col-4 d-flex justify-content-between">
                <span class="align-self-end">Top Ten Songs:</span>
                <form action="/dashboard">
                    <button class="btn btn-sm btn-outline-warning mb-3 ms-3">Dashboard</button>
                </form>
            </div>
            <div class="col-4">
                <table class="table table-striped border border-5 border-danger">
                    <tbody>
                        <c:forEach var="song" items="${songs}">
                            <tr><td><c:out value="${song.rating}"/> - <a href="/songs/${song.id}"><c:out value="${song.title}" /></a> - <c:out value="${song.artist}"/></td></tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
