<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Cliente</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Modificar Cliente</h1>

    <form action="${pageContext.request.contextPath}/cliente" method="post" class="card p-4 shadow-sm">
        <input type="hidden" name="id" value="${cliente.id}" />

        <div class="mb-3">
            <label class="form-label">Número de Cliente (solo lectura)</label>
            <input type="text" name="numeroCliente" class="form-control" value="${cliente.numeroCliente}" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Nombre / Razón Social</label>
            <input type="text" name="nombreRazonSocial" class="form-control" value="${cliente.nombreRazonSocial}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo de Cliente</label>
            <input type="text" name="tipoCliente" class="form-control" value="${cliente.tipoCliente}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Identificación Fiscal (NIT)</label>
            <input type="text" name="nit" class="form-control" value="${cliente.nit}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Dirección de Facturación</label>
            <input type="text" name="direccionFacturacion" class="form-control" value="${cliente.direccionFacturacion}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Dirección de Entrega</label>
            <input type="text" name="direccionEntrega" class="form-control" value="${cliente.direccionEntrega}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Teléfono</label>
            <input type="text" name="telefono" class="form-control" value="${cliente.telefono}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Correo Electrónico</label>
            <input type="email" name="correo" class="form-control" value="${cliente.correo}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Persona de Contacto</label>
            <input type="text" name="personaContacto" class="form-control" value="${cliente.personaContacto}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Método de Pago</label>
            <input type="text" name="metodoPago" class="form-control" value="${cliente.metodoPago}" required>
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