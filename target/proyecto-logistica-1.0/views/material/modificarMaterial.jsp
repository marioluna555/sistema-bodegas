<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Material</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Modificar Material</h1>

    <form action="${pageContext.request.contextPath}/material" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="id" value="${material.id}" />
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Código de Material</label>
                <input type="text" name="codigoMaterial" class="form-control" value="${material.codigoMaterial}" readonly>
            </div>
            <div class="col-md-6">
                <label class="form-label">Nombre</label>
                <input type="text" name="nombreMaterial" class="form-control" value="${material.nombreMaterial}" required>
            </div>
            <div class="col-12">
                <label class="form-label">Descripción</label>
                <input type="text" name="descripcion" class="form-control" value="${material.descripcion}">
            </div>
            <div class="col-md-6">
                <label class="form-label">Categoría</label>
                <select name="categoria" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="Materia Prima" ${material.categoria == 'Materia Prima' ? 'selected' : ''}>Materia Prima</option>
                    <option value="Producto Terminado" ${material.categoria == 'Producto Terminado' ? 'selected' : ''}>Producto Terminado</option>
                    <option value="Insumo" ${material.categoria == 'Insumo' ? 'selected' : ''}>Insumo</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Presentación y Cantidad</label>
                <input type="text" name="presentacionCantidad" class="form-control" value="${material.presentacionCantidad}">
            </div>
            <div class="col-md-4">
                <label class="form-label">Peso (kg)</label>
                <input type="text" name="peso" class="form-control" value="${material.peso}">
            </div>
            <div class="col-md-4">
                <label class="form-label">Volumen (m³)</label>
                <input type="text" name="volumen" class="form-control" value="${material.volumen}">
            </div>
            <div class="col-md-4">
                <label class="form-label">Stock Mínimo</label>
                <input type="text" name="stockMinimo" class="form-control" value="${material.stockMinimo}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Stock Máximo</label>
                <input type="text" name="stockMaximo" class="form-control" value="${material.stockMaximo}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Ubicación Predeterminada</label>
                <select name="ubicacion" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <!-- Opciones se llenan por JS -->
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Proveedor Asociado</label>
                <select name="proveedor" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <!-- Opciones se llenan por JS -->
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Costo Unitario</label>
                <input type="text" name="costoUnitario" class="form-control" value="${material.costoUnitario}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Costo Total</label>
                <input type="text" name="costoTotal" class="form-control" value="${material.costoTotal}" required>
            </div>
            <div class="col-12">
                <label class="form-label">Observaciones</label>
                <input type="text" name="observaciones" class="form-control" value="${material.observaciones}">
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
<script>
document.addEventListener("DOMContentLoaded", function() {
    // Llenar ubicaciones
    fetch("${pageContext.request.contextPath}/api/unidadesAlmacenamiento")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="ubicacion"]');
            select.length = 1;
            const ubicacionId = "${material.ubicacion != null ? material.ubicacion.id : ''}";
            data.forEach(unidad => {
                const option = document.createElement("option");
                option.value = unidad.id;
                option.textContent = `${unidad.nombre} (${unidad.codigoUnidad})`;
                if (ubicacionId && unidad.id == ubicacionId) {
                    option.selected = true;
                }
                select.appendChild(option);
            });
        });
    // Llenar proveedores
    fetch("${pageContext.request.contextPath}/api/proveedores")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="proveedor"]');
            select.length = 1;
            const proveedorId = "${material.proveedor != null ? material.proveedor.id : ''}";
            data.forEach(proveedor => {
                const option = document.createElement("option");
                option.value = proveedor.id;
                option.textContent = proveedor.nombreRazonSocial;
                if (proveedorId && proveedor.id == proveedorId) {
                    option.selected = true;
                }
                select.appendChild(option);
            });
        });
});
</script>
</body>
</html>