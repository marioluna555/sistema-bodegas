<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menú de Movimientos</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="text-center mb-4">Módulo de Movimientos</h1>

    <div class="list-group shadow-sm">
        <a href="crearOrdenCompra.jsp" class="list-group-item list-group-item-action">
            🛒 Crear Orden de Compra
        </a>
        <a href="/ordenCompra" class="list-group-item list-group-item-action">
            📋 Consultar Ordenes de Compra
        </a>
        <a href="crearOrdenVenta.jsp" class="list-group-item list-group-item-action">
            🏷️ Crear Orden de Venta
        </a>
        <a href="/ordenVenta" class="list-group-item list-group-item-action">
            📋 Consultar Ordenes de Venta
        </a>
        <a href="crearAjusteInventario.jsp" class="list-group-item list-group-item-action">
            🛠️ Crear Ajuste de Inventario
        </a>
        <a href="/ajusteInventario" class="list-group-item list-group-item-action">
            📋 Consultar Ajustes de Inventario
        </a>
    </div>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al Inicio</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
