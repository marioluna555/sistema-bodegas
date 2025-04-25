<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Transporte</title>
    <!-- Agregamos Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Modificar Transporte</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">ID Transporte</label>
            <input type="text" name="idTransporte" class="form-control" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo de Vehículo</label>
            <input type="text" name="tipoVehiculo" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Placa / Matrícula</label>
            <input type="text" name="placa" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Marca / Modelo</label>
            <input type="text" name="marcaModelo" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Capacidad de Carga</label>
            <input type="text" name="capacidadCarga" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Kilometraje Actual</label>
            <input type="text" name="kilometraje" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Conductor Asignado</label>
            <input type="text" name="conductorAsignado" class="form-control">
        </div>

        <button type="submit" class="btn btn-warning w-100">Guardar Cambios</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>