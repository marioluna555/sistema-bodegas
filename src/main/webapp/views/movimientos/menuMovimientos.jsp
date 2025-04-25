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
        <a href="confirmarSalidaCompra.jsp" class="list-group-item list-group-item-action">
            🚚 Confirmar Salida de Transporte (Compra)
        </a>
        <a href="confirmarRecepcionCompra.jsp" class="list-group-item list-group-item-action">
            📦 Confirmar Recepción de Orden de Compra
        </a>
        <a href="crearOrdenVenta.jsp" class="list-group-item list-group-item-action">
            🏷️ Crear Orden de Venta
        </a>
        <a href="confirmarSalidaAlmacen.jsp" class="list-group-item list-group-item-action">
            🚚 Confirmar Salida del Almacén (Venta)
        </a>
        <a href="confirmarEntregaVenta.jsp" class="list-group-item list-group-item-action">
            📬 Confirmar Entrega de Orden de Venta
        </a>
        <a href="crearOrdenTraslado.jsp" class="list-group-item list-group-item-action">
            🔄 Crear Orden de Traslado de Materiales
        </a>
        <a href="confirmarSalidaTraslado.jsp" class="list-group-item list-group-item-action">
            🚛 Confirmar Salida de Orden de Traslado
        </a>
        <a href="confirmarRecepcionTraslado.jsp" class="list-group-item list-group-item-action">
            📦 Confirmar Recepción de Orden de Traslado
        </a>
        <a href="crearAjusteInventario.jsp" class="list-group-item list-group-item-action">
            🛠️ Crear Ajuste de Inventario
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
