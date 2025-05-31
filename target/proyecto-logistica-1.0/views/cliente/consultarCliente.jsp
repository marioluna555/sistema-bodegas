<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Consultar Clientes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Consultar Clientes</h1>

    <!-- Formulario de búsqueda -->
    <form action="${pageContext.request.contextPath}/cliente" method="get" class="card p-4 shadow-sm mb-5">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="busquedaCliente" class="col-form-label">Buscar por Número / Nombre:</label>
            </div>
            <div class="col-auto">
                <input type="text" id="busquedaCliente" name="busquedaCliente" class="form-control">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </div>
    </form>

    <!-- Tabla de resultados -->
    <h2 class="mb-3">Resultados:</h2>
    <div class="table-responsive shadow-sm">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Número</th>
                    <th>Nombre / Razón Social</th>
                    <th>Tipo</th>
                    <th>NIT</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="cliente" items="${clientes}">
                <tr>
                    <td>${cliente.numeroCliente}</td>
                    <td>${cliente.nombreRazonSocial}</td>
                    <td>${cliente.tipoCliente}</td>
                    <td>${cliente.nit}</td>
                    <td>${cliente.telefono}</td>
                    <td>${cliente.correo}</td>
                    <td>Activo</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/cliente?action=modificar&id=${cliente.id}" class="btn btn-warning btn-sm">Modificar</a>
                        <a href="${pageContext.request.contextPath}/cliente?action=desactivar&id=${cliente.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que desea desactivar este cliente?');">Desactivar</a>
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