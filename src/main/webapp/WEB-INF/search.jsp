<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 4/03/22
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row justify-content-center mt-3">
            <div class="col-6 d-flex justify-content-between">
                <span class="align-self-end">Songs by artist: <c:out value="${search}"/></span>
                <div class="col-3">
                    <form action="/search" method="post">
                        <span class="text-danger"><c:out value="${error}" /></span>
                        <div class="input-group">
                            <input type="text" class="form-control mb-3" id="search" name="search" value="${search}" aria-label="Search's criteria" />
                            <button type="submit" class="btn btn-primary mb-3">New Search</button>
                        </div>
                    </form>
                </div>
                <form action="/dashboard">
                    <button class="btn btn-sm btn-outline-warning mb-3 ms-3">Dashboard</button>
                </form>
            </div>
        </div>
        <div class="container col-6 border border-5 border-danger">
            <div class="row">
                <div class="container col-12 bg-white p-3">
                    <h1 class="text-danger">Songs</h1>
                    <table class="table table-striped p-2">
                        <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Rating</th>
                            <th scope="col">actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="song" items="${songs}">
                            <tr>
                                <td><a href="/songs/${song.id}"><c:out value="${song.title}" /></a></td>
                                <td><c:out value="${song.rating}" /></td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <form action="/songs/${song.id}" method="post">
                                            <input type="hidden" name="_method" value="delete">
                                            <button type="submit" class="btn btn-sm btn-outline-danger">delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
