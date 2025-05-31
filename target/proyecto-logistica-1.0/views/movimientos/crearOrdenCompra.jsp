<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Orden de Compra</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Crear Orden de Compra</h1>

    <form action="${pageContext.request.contextPath}/ordenCompra" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Proveedor</label>
                <select name="proveedorId" class="form-control" required>
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
                <label class="form-label">Cantidad de Compra</label>
                <input type="number" step="0.01" name="cantidad" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Almacén de destino</label>
                <select name="almacenDestino" class="form-control" required>
                    <option value="">Seleccione...</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Fecha de salida planificada</label>
                <input type="date" name="fechaSalida" class="form-control" required>
            </div>

            <div class="col-md-12">
                <label class="form-label">Observaciones</label>
                <input type="text" name="observaciones" class="form-control">
            </div>
        </div>

        <button type="submit" class="btn btn-success w-100 mt-4">Crear Orden de Compra</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // Llenar proveedores
    fetch("${pageContext.request.contextPath}/api/proveedores")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="proveedorId"]');
            select.length = 1;
            data.forEach(proveedor => {
                const option = document.createElement("option");
                option.value = proveedor.id;
                option.textContent = proveedor.nombreRazonSocial;
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
    // Llenar almacenes de destino
    fetch("${pageContext.request.contextPath}/api/unidadesAlmacenamiento")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="almacenDestino"]');
            select.length = 1;
            data.forEach(ua => {
                const option = document.createElement("option");
                option.value = ua.id;
                option.textContent = ua.nombre;
                select.appendChild(option);
            });
        });
});
</script>
</body>
</html>