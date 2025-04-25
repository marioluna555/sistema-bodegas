<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Transporte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <h1 class="mb-4 text-center">Crear Transporte</h1>

        <form action="#" method="post" class="card p-4 shadow-sm">
            <div class="mb-3">
                <label class="form-label">Número de Transporte</label>
                <input type="text" class="form-control" name="numeroTransporte">
            </div>

            <div class="mb-3">
                <label class="form-label">Tipo de Vehículo</label>
                <input type="text" class="form-control" name="tipoVehiculo">
            </div>

            <div class="mb-3">
                <label class="form-label">Placa / Matrícula</label>
                <input type="text" class="form-control" name="placa">
            </div>

            <div class="mb-3">
                <label class="form-label">Marca / Modelo</label>
                <input type="text" class="form-control" name="marca">
            </div>

            <div class="mb-3">
                <label class="form-label">Capacidad de Carga (kg/m³)</label>
                <input type="text" class="form-control" name="capacidad">
            </div>

            <div class="mb-3">
                <label class="form-label">Kilometraje Actual</label>
                <input type="text" class="form-control" name="kilometraje">
            </div>

            <div class="mb-3">
                <label class="form-label">Conductor Asignado</label>
                <input type="text" class="form-control" name="conductor">
            </div>

            <button type="submit" class="btn btn-primary w-100">Crear Transporte</button>
        </form>

        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al Menú</a>
        </div>
    </div>

</body>
</html>