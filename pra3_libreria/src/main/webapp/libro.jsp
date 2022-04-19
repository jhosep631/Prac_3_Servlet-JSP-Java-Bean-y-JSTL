<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Libros" %>
<%@page import="com.emergentes.modelo.GestorLibros" %>
<%
    if (session.getAttribute("libro") == null) {
        GestorLibros objeto1 = new GestorLibros();

        objeto1.insertarLibro(new Libros(1, "El Principito", "Antoine de Sain", "Si", "Cuento"));
        objeto1.insertarLibro(new Libros(2, "La Conspiración", "Don Brown", "No", "Novela"));
        objeto1.insertarLibro(new Libros(3, "Historia de Bolivia", "Historia", "Si", "Editor"));

        session.setAttribute("libro", objeto1);

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center">Libros</h1>
        <center><a href="Controlador?op=nuevo">NUEVO</a></center>
        <center>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>TITULO</th>
                <th>AUTOR</th>
                <th>DISPONIBLE</th>
                <th>CATEGORIA</th>
                <th></th>
                <th></th>

            </tr>
            <c:forEach var="item" items="${sessionScope.libro.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.titulo}</td>
                    <td>${item.autor}</td>
                    <td>${item.disponible}</td>
                    <td>${item.categoria}</td>
                    <td><a href="Controlador?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controlador?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        </center>
    </body>
</html>
