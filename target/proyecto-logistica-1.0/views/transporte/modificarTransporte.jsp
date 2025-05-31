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

    <form action="${pageContext.request.contextPath}/transporte" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="id" value="${transporte.id}" />
        <div class="mb-3">
            <label class="form-label">Número de Transporte</label>
            <input type="text" class="form-control" name="numeroTransporte" value="${transporte.numeroTransporte}" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Tipo de Vehículo</label>
            <select name="tipoVehiculo" class="form-control" required>
                <option value="">Seleccione...</option>
                <option value="Camión" ${transporte.tipoVehiculo == 'Camión' ? 'selected' : ''}>Camión</option>
                <option value="Furgón" ${transporte.tipoVehiculo == 'Furgón' ? 'selected' : ''}>Furgón</option>
                <option value="PickUp" ${transporte.tipoVehiculo == 'PickUp' ? 'selected' : ''}>PickUp</option>
                <option value="Motocicleta" ${transporte.tipoVehiculo == 'Motocicleta' ? 'selected' : ''}>Motocicleta</option>
                <option value="Otro" ${transporte.tipoVehiculo == 'Otro' ? 'selected' : ''}>Otro</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Placa / Matrícula</label>
            <input type="text" class="form-control" name="placa" value="${transporte.placa}">
        </div>
        <div class="mb-3">
            <label class="form-label">Marca / Modelo</label>
            <input type="text" class="form-control" name="marca" value="${transporte.marca}">
        </div>
        <div class="mb-3">
            <label class="form-label">Capacidad de Carga (kg/m³)</label>
            <input type="text" class="form-control" name="capacidad" value="${transporte.capacidad}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Kilometraje Actual</label>
            <input type="text" class="form-control" name="kilometraje" value="${transporte.kilometraje}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Conductor Asignado</label>
            <input type="text" class="form-control" name="conductor" value="${transporte.conductor}">
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