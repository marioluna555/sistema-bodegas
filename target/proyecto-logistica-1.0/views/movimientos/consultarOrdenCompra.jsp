<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Consultar Ordenes de Compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="mb-4 text-center">Órdenes de Compra</h1>
    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Material</th>
                <th>Cantidad</th>
                <th>Usuario</th>
                <th>Recibido</th>
                <th>Observaciones</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="orden" items="${ordenesCompra}">
                <tr>
                    <td>${orden.id}</td>
                    <td><fmt:formatDate value="${orden.fecha}" pattern="yyyy-MM-dd HH:mm"/></td>
                    <td>${orden.material.nombreMaterial}</td>
                    <td>${orden.cantidad}</td>
                    <td>${orden.usuario}</td>
                    <td><c:choose><c:when test="${orden.recibido}">Sí</c:when><c:otherwise>No</c:otherwise></c:choose></td>
                    <td>${orden.observaciones}</td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/ordenCompra">
                            <input type="hidden" name="accion" value="confirmarRecepcion" />
                            <input type="hidden" name="ordenId" value="${orden.id}" />
                            <button class="btn btn-success btn-sm" type="submit" <c:if test="${orden.recibido}">disabled</c:if>>Confirmar Recepción</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary ms-2">Volver al menú</a>
    </div>
</div>
</body>
</html>
