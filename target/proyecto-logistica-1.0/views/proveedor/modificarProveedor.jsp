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

    <form action="${pageContext.request.contextPath}/proveedor" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="id" value="${proveedor.id}" />
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Número de Proveedor</label>
                <input type="text" name="numeroProveedor" class="form-control" value="${proveedor.numeroProveedor}" readonly>
            </div>
            <div class="col-md-6">
                <label class="form-label">Nombre / Razón Social</label>
                <input type="text" name="nombreRazonSocial" class="form-control" value="${proveedor.nombreRazonSocial}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Identificación Fiscal (NIT)</label>
                <input type="text" name="nit" class="form-control" value="${proveedor.nit}" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Tipo de Proveedor</label>
                <select name="tipoProveedor" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="Interno" ${proveedor.tipoProveedor == 'Interno' ? 'selected' : ''}>Interno</option>
                    <option value="Externo" ${proveedor.tipoProveedor == 'Externo' ? 'selected' : ''}>Externo</option>
                </select>
            </div>
            <div class="col-12">
                <label class="form-label">Dirección Fiscal</label>
                <input type="text" name="direccionFiscal" class="form-control" value="${proveedor.direccionFiscal}">
            </div>
            <div class="col-md-6">
                <label class="form-label">Representante Legal</label>
                <input type="text" name="representanteLegal" class="form-control" value="${proveedor.representanteLegal}">
            </div>
            <div class="col-md-6">
                <label class="form-label">Teléfono</label>
                <input type="text" name="telefono" class="form-control" value="${proveedor.telefono}">
            </div>

            <div class="col-md-6">
                <label class="form-label">Método de Pago</label>
                <select name="metodoPago" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="TRANSFERENCIA" ${proveedor.metodoPago == 'TRANSFERENCIA' ? 'selected' : ''}>Transferencia</option>
                    <option value="EFECTIVO" ${proveedor.metodoPago == 'EFECTIVO' ? 'selected' : ''}>Efectivo</option>
                    <option value="CHEQUE" ${proveedor.metodoPago == 'CHEQUE' ? 'selected' : ''}>Cheque</option>
                    <option value="TARJETA" ${proveedor.metodoPago == 'TARJETA' ? 'selected' : ''}>Tarjeta</option>
                    <option value="OTRO" ${proveedor.metodoPago == 'OTRO' ? 'selected' : ''}>Otro</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Condición de Pago</label>
                <select name="condicionPago" class="form-control">
                    <option value="">Seleccione...</option>
                    <option value="CONTADO" ${proveedor.condicionPago == 'CONTADO' ? 'selected' : ''}>Contado</option>
                    <option value="CREDITO_15" ${proveedor.condicionPago == 'CREDITO_15' ? 'selected' : ''}>Crédito 15 días</option>
                    <option value="CREDITO_30" ${proveedor.condicionPago == 'CREDITO_30' ? 'selected' : ''}>Crédito 30 días</option>
                    <option value="CREDITO_60" ${proveedor.condicionPago == 'CREDITO_60' ? 'selected' : ''}>Crédito 60 días</option>
                    <option value="OTRO" ${proveedor.condicionPago == 'OTRO' ? 'selected' : ''}>Otro</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Banco</label>
                <select name="banco" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="BANRURAL" ${proveedor.banco == 'BANRURAL' ? 'selected' : ''}>Banrural</option>
                    <option value="BANCO INDUSTRIAL" ${proveedor.banco == 'BANCO INDUSTRIAL' ? 'selected' : ''}>Banco Industrial</option>
                    <option value="BAC" ${proveedor.banco == 'BAC' ? 'selected' : ''}>BAC</option>
                    <option value="BANTRAB" ${proveedor.banco == 'BANTRAB' ? 'selected' : ''}>Bantrab</option>
                    <option value="BANCO G&T" ${proveedor.banco == 'BANCO G&T' ? 'selected' : ''}>Banco G&T</option>
                    <option value="BANCO PROMERICA" ${proveedor.banco == 'BANCO PROMERICA' ? 'selected' : ''}>Banco Promerica</option>
                    <option value="BANCO INTERNACIONAL" ${proveedor.banco == 'BANCO INTERNACIONAL' ? 'selected' : ''}>Banco Internacional</option>
                    <option value="BANCO CHN" ${proveedor.banco == 'BANCO CHN' ? 'selected' : ''}>Banco CHN</option>
                    <option value="BANCO FICOHSA" ${proveedor.banco == 'BANCO FICOHSA' ? 'selected' : ''}>Banco Ficohsa</option>
                    <option value="BANCO AZTECA" ${proveedor.banco == 'BANCO AZTECA' ? 'selected' : ''}>Banco Azteca</option>
                    <option value="BANCO INVOLSA" ${proveedor.banco == 'BANCO INVOLSA' ? 'selected' : ''}>Banco Involsa</option>
                    <option value="BANCO AGROMERCANTIL" ${proveedor.banco == 'BANCO AGROMERCANTIL' ? 'selected' : ''}>Banco Agromercantil</option>
                    <option value="OTRO" ${proveedor.banco == 'OTRO' ? 'selected' : ''}>Otro</option>
                </select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Tipo de Cuenta</label>
                <select name="tipoCuenta" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="Monetaria" ${proveedor.tipoCuenta == 'Monetaria' ? 'selected' : ''}>Monetaria</option>
                    <option value="Ahorro" ${proveedor.tipoCuenta == 'Ahorro' ? 'selected' : ''}>Ahorro</option>
                </select>
            </div>

            <div class="col-md-3">
                <label class="form-label">Número de Cuenta</label>
                <input type="text" name="numeroCuenta" class="form-control" value="${proveedor.numeroCuenta}">
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