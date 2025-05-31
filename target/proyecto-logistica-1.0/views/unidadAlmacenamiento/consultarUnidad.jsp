<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Consultar Unidades de Almacenamiento</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Consultar Unidades de Almacenamiento</h1>

    <!-- Formulario de búsqueda -->
    <form action="${pageContext.request.contextPath}/unidadAlmacenamiento" method="get" class="card p-4 shadow-sm mb-5">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="codigoBusqueda" class="col-form-label">Buscar por Código:</label>
            </div>
            <div class="col-auto">
                <input type="text" id="codigoBusqueda" name="codigoBusqueda" class="form-control" value="${param.codigoBusqueda}">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </div>
        <input type="hidden" name="action" value="consultar" />
    </form>

    <!-- Tabla de resultados -->
    <h2 class="mb-3">Resultados:</h2>
    <div class="table-responsive shadow-sm">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Tipo</th>
                    <th>Clase</th>
                    <th>Bodega Padre</th>
                    <th>Volumen Total</th>
                    <th>Ubicación Física</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="unidad" items="${unidades}">
                <tr>
                    <td>${unidad.codigoUnidad}</td>
                    <td>${unidad.nombre}</td>
                    <td>${unidad.tipo}</td>
                    <td>${unidad.clase}</td>
                    <td>
                        <c:choose>
                            <c:when test="${unidad.bodegaPadre != null}">
                                ${unidad.bodegaPadre.nombre} (${unidad.bodegaPadre.codigoUnidad})
                            </c:when>
                            <c:otherwise>
                                -
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${unidad.volumenTotal}</td>
                    <td>${unidad.ubicacionFisica}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/unidadAlmacenamiento?action=modificar&id=${unidad.id}" class="btn btn-warning btn-sm">Modificar</a>
                        <a href="${pageContext.request.contextPath}/unidadAlmacenamiento?action=desactivar&id=${unidad.id}" class="btn btn-danger btn-sm" onclick="return confirm('¿Seguro que desea desactivar esta unidad?');">Desactivar</a>
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