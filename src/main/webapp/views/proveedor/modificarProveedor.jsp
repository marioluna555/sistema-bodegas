<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Proveedor</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Modificar Proveedor</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Número de Proveedor (solo lectura)</label>
                <input type="text" name="numeroProveedor" class="form-control" readonly>
            </div>

            <div class="col-md-6">
                <label class="form-label">Nombre / Razón Social</label>
                <input type="text" name="nombreRazonSocial" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Identificación Fiscal (NIT)</label>
                <input type="text" name="nit" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Tipo de Proveedor</label>
                <input type="text" name="tipoProveedor" class="form-control" required>
            </div>

            <div class="col-12">
                <label class="form-label">Dirección Fiscal</label>
                <input type="text" name="direccionFiscal" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Representante Legal</label>
                <input type="text" name="representanteLegal" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Teléfono</label>
                <input type="text" name="telefono" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Método de Pago</label>
                <input type="text" name="metodoPago" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Condición de Pago</label>
                <input type="text" name="condicionPago" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Banco</label>
                <input type="text" name="banco" class="form-control">
            </div>

            <div class="col-md-3">
                <label class="form-label">Tipo de Cuenta</label>
                <input type="text" name="tipoCuenta" class="form-control">
            </div>

            <div class="col-md-3">
                <label class="form-label">Número de Cuenta</label>
                <input type="text" name="numeroCuenta" class="form-control">
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