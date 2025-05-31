<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Consultar Transporte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Consultar Transporte</h1>

    <form action="${pageContext.request.contextPath}/transporte" method="get" class="card p-4 shadow-sm mb-5">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="numeroBusqueda" class="col-form-label">Buscar por Número de Transporte:</label>
            </div>
            <div class="col-auto">
                <input type="text" id="numeroBusqueda" name="numeroBusqueda" class="form-control" value="${param.numeroBusqueda}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </div>
        <input type="hidden" name="action" value="consultar" />
    </form>

    <h2 class="mb-3">Resultados:</h2>
    <div class="table-responsive shadow-sm">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Número</th>
                    <th>Tipo</th>
                    <th>Placa</th>
                    <th>Marca</th>
                    <th>Capacidad</th>
                    <th>Kilometraje</th>
                    <th>Conductor</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="transporte" items="${transportes}">
                <tr>
                    <td>${transporte.numeroTransporte}</td>
                    <td>${transporte.tipoVehiculo}</td>
                    <td>${transporte.placa}</td>
                    <td>${transporte.marca}</td>
                    <td>${transporte.capacidad}</td>
                    <td>${transporte.kilometraje}</td>
                    <td>${transporte.conductor}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/transporte?action=modificar&id=${transporte.id}" class="btn btn-warning btn-sm">Modificar</a>
                        <a href="${pageContext.request.contextPath}/transporte?action=desactivar&id=${transporte.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que desea desactivar este transporte?');">Desactivar</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>