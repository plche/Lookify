<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 3/03/22
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="row justify-content-center mt-3">
            <div class="col-3 mt-1">
                <a href="/songs/new">Add New</a>
                <a class="ms-4" href="/search/topTen">Top Songs</a>
            </div>
            <div class="col-3">
                <form action="/search" method="post">
                    <span class="text-danger"><c:out value="${error}" /></span>
                    <div class="input-group">
                        <input type="text" class="form-control mb-3" id="search" name="search" aria-label="Search's criteria" />
                        <button type="submit" class="btn btn-primary mb-3">Search Artists</button>
                    </div>
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
