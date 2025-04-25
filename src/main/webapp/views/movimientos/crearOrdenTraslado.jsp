<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Orden de Traslado</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Crear Orden de Traslado</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Unidad de Almacenamiento de Origen</label>
                <input type="text" name="unidadOrigen" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Unidad de Almacenamiento de Destino</label>
                <input type="text" name="unidadDestino" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Material</label>
                <input type="text" name="material" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Cantidad</label>
                <input type="number" name="cantidad" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Fecha de Salida Planificada</label>
                <input type="date" name="fechaSalida" class="form-control" required>
            </div>
        </div>

        <button type="submit" class="btn btn-primary w-100 mt-4">Crear Traslado</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>