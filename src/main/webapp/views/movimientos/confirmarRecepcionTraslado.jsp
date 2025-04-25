<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmar Recepción de Orden de Traslado</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Confirmar Recepción de Orden de Traslado</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">ID del Movimiento</label>
            <input type="text" name="idMovimiento" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Cantidad Recibida</label>
            <input type="number" name="cantidadRecibida" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Confirmar Recepción</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>