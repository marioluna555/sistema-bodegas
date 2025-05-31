<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Orden de Venta</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Crear Orden de Venta</h1>

    <form action="${pageContext.request.contextPath}/ordenVenta" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Cliente</label>
                <select name="clienteId" class="form-control" required>
                    <option value="">Seleccione...</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Material</label>
                <select name="materialId" class="form-control" required>
                    <option value="">Seleccione...</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Cantidad</label>
                <input type="number" step="0.01" name="cantidad" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Unidad de Almacenamiento de Salida</label>
                <select name="unidadAlmacenamientoId" class="form-control" required>
                    <option value="">Seleccione...</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Fecha de Salida Planificada</label>
                <input type="date" name="fecha" class="form-control" required>
            </div>

            <div class="col-md-12">
                <label class="form-label">Observaciones</label>
                <input type="text" name="observaciones" class="form-control">
            </div>
        </div>

        <button type="submit" class="btn btn-primary w-100 mt-4">Crear Orden de Venta</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // Llenar clientes
    fetch("${pageContext.request.contextPath}/api/clientes")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="clienteId"]');
            select.length = 1;
            data.forEach(cliente => {
                const option = document.createElement("option");
                option.value = cliente.id;
                option.textContent = cliente.nombreRazonSocial;
                select.appendChild(option);
            });
        });
    // Llenar materiales
    fetch("${pageContext.request.contextPath}/api/materiales")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="materialId"]');
            select.length = 1;
            data.forEach(material => {
                const option = document.createElement("option");
                option.value = material.id;
                option.textContent = material.nombreMaterial + " (" + material.codigoMaterial + ")";
                select.appendChild(option);
            });
        });
    // Llenar almacenes
    fetch("${pageContext.request.contextPath}/api/unidadesAlmacenamiento")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="unidadAlmacenamientoId"]');
            select.length = 1;
            data.forEach(almacen => {
                const option = document.createElement("option");
                option.value = almacen.id;
                option.textContent = almacen.nombre;
                select.appendChild(option);
            });
        });
});
</script>
</body>
</html>