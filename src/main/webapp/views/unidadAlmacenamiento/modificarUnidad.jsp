<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Unidad de Almacenamiento</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Modificar Unidad de Almacenamiento</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Código de Unidad (solo lectura)</label>
                <input type="text" name="codigoUnidad" class="form-control" readonly>
            </div>

            <div class="col-md-6">
                <label class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Tipo</label>
                <input type="text" name="tipo" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Clase</label>
                <input type="text" name="clase" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Bodega Padre</label>
                <input type="text" name="bodegaPadre" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Volumen Total (m³)</label>
                <input type="text" name="volumenTotal" class="form-control">
            </div>

            <div class="col-12">
                <label class="form-label">Ubicación Física</label>
                <input type="text" name="ubicacionFisica" class="form-control">
            </div>

            <div class="col-12">
                <label class="form-label">Observaciones</label>
                <input type="text" name="observaciones" class="form-control">
            </div>
        </div>

        <button type="submit" class="btn btn-warning w-100 mt-4">Guardar Cambios</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>