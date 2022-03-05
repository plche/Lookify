<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 4/03/22
  Time: 02:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Song Details</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container ms-4 mt-4">
            <form class="col-4 offset-3" action="/dashboard">
                <button class="btn btn-sm btn-outline-warning mb-3 ms-3">Dashboard</button>
            </form>
            <div class="col-4">
                <table class="table border border-2 table-striped">
                    <tbody>
                    <tr>
                        <td>Title:</td>
                        <td><c:out value="${song.getTitle()}" /></td>
                    </tr>
                    <tr>
                        <td>Artist:</td>
                        <td><c:out value="${song.getArtist()}"/></td>
                    </tr>
                    <tr>
                        <td>Rating:</td>
                        <td><c:out value="${song.getRating()}"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <form action="/songs/${song.id}" method="post">
                <input type="hidden" name="_method" value="delete">
                <button type="submit" class="btn btn-sm btn-outline-danger">delete</button>
            </form>
        </div>
    </body>
</html>
