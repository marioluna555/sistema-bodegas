<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Proveedor</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Crear Proveedor</h1>

    <form action="${pageContext.request.contextPath}/proveedor" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Número de Proveedor</label>
                <input type="text" name="numeroProveedor" class="form-control" required>
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
                <select name="tipoProveedor" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="Interno">Interno</option>
                    <option value="Externo">Externo</option>
                </select>
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
                <select name="metodoPago" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="TRANSFERENCIA">Transferencia</option>
                    <option value="EFECTIVO">Efectivo</option>
                    <option value="CHEQUE">Cheque</option>
                    <option value="TARJETA">Tarjeta</option>
                    <option value="OTRO">Otro</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Condición de Pago</label>
                <select name="condicionPago" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="CONTADO">Contado</option>
                    <option value="CREDITO_15">Crédito 15 días</option>
                    <option value="CREDITO_30">Crédito 30 días</option>
                    <option value="CREDITO_60">Crédito 60 días</option>
                    <option value="OTRO">Otro</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Banco</label>
                <select name="banco" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="BANRURAL">Banrural</option>
                    <option value="BANCO INDUSTRIAL">Banco Industrial</option>
                    <option value="BAC">BAC</option>
                    <option value="BANTRAB">Bantrab</option>
                    <option value="BANCO G&T">Banco G&T</option>
                    <option value="BANCO PROMERICA">Banco Promerica</option>
                    <option value="BANCO INTERNACIONAL">Banco Internacional</option>
                    <option value="BANCO CHN">Banco CHN</option>
                    <option value="BANCO FICOHSA">Banco Ficohsa</option>
                    <option value="BANCO AZTECA">Banco Azteca</option>
                    <option value="BANCO INVOLSA">Banco Involsa</option>
                    <option value="BANCO AGROMERCANTIL">Banco Agromercantil</option>
                    <option value="OTRO">Otro</option>
                </select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Tipo de Cuenta</label>
                <select name="tipoCuenta" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="Monetaria">Monetaria</option>
                    <option value="Ahorro">Ahorro</option>
                </select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Número de Cuenta</label>
                <input type="text" name="numeroCuenta" class="form-control" required>
            </div>
        </div>

        <button type="submit" class="btn btn-success w-100 mt-4">Crear Proveedor</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>