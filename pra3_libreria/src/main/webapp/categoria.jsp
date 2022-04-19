<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Categoria" %>
<%@page import="com.emergentes.modelo.GestorCategoria" %>
<%
    if (session.getAttribute("cate") == null) {
        GestorCategoria objeto1 = new GestorCategoria();

        objeto1.insertarCategoria(new Categoria(1, "Novela"));
        objeto1.insertarCategoria(new Categoria(2, "Historia"));
        objeto1.insertarCategoria(new Categoria(3, "Cuento"));

        session.setAttribute("cate", objeto1);

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
        <h1 style="text-align: center">Categorias</h1>
        <center><a href="controladorCategoria?op=nuevo">NUEVO</a></center>
        <center>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>CATEGORIA</th>
                <th>EDITAR</th>
                <th>ELIMINAR</th>

            </tr>
            <c:forEach var="item" items="${sessionScope.cate.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.categoria}</td>
                    <td><a href="controladorCategoria?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="controladorCategoria?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
        </center>
    </body>
</html>
