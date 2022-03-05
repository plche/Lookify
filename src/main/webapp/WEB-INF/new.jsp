<%--
  Created by IntelliJ IDEA.
  User: plche
  Date: 3/03/22
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Song</title>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row justify-content-center mt-4">
            <div class="col-4">
                <div class="row">
                    <div class="col-8">
                        <h1 class="text-primary mb-3">Add Song</h1>
                    </div>
                    <div class="col-4 align-self-center">
                        <form class="d-flex justify-content-end" action="/dashboard">
                            <button class="btn btn-sm btn-outline-warning">Dashboard</button>
                        </form>
                    </div>
                </div>
                <form:form class="rounded border border-5 border-primary" action="/songs/new" method="post" modelAttribute="song">
                    <div class="row justify-content-center">
                        <div class="col-9">
                            <form:label for="title" path="title" class="form-label mt-3">Title:</form:label>
                            <form:errors path="title" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="title" path="title" aria-label="Song's title" />
                            <form:label for="artist" path="artist" class="form-label">Artist:</form:label>
                            <form:errors path="artist" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="artist" path="artist" aria-label="Song's artist"/>
                            <form:label for="rating" path="rating" class="form-label">Rating (1-10):</form:label>
                            <form:errors path="rating" cssClass="text-danger" />
                            <form:input type="text" class="form-control mb-3" id="rating" path="rating" aria-label="Song's rating" />
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary mb-3">Add Song</button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
