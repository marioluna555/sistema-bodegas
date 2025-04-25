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

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Código de Material (solo lectura)</label>
                <input type="text" name="codigoMaterial" class="form-control" readonly>
            </div>

            <div class="col-md-6">
                <label class="form-label">Nombre</label>
                <input type="text" name="nombreMaterial" class="form-control" required>
            </div>

            <div class="col-12">
                <label class="form-label">Descripción</label>
                <input type="text" name="descripcion" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Categoría</label>
                <input type="text" name="categoria" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Presentación y Cantidad</label>
                <input type="text" name="presentacionCantidad" class="form-control">
            </div>

            <div class="col-md-4">
                <label class="form-label">Peso (kg)</label>
                <input type="text" name="peso" class="form-control">
            </div>

            <div class="col-md-4">
                <label class="form-label">Volumen (m³)</label>
                <input type="text" name="volumen" class="form-control">
            </div>

            <div class="col-md-4">
                <label class="form-label">Stock Mínimo</label>
                <input type="text" name="stockMinimo" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Stock Máximo</label>
                <input type="text" name="stockMaximo" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Proveedor Asociado</label>
                <input type="text" name="proveedor" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Costo Unitario</label>
                <input type="text" name="costoUnitario" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Costo Total</label>
                <input type="text" name="costoTotal" class="form-control">
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