<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Cliente</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Crear Cliente</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Número de Cliente</label>
            <input type="text" name="numeroCliente" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Nombre / Razón Social</label>
            <input type="text" name="nombreRazonSocial" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo de Cliente (Individual/Empresa)</label>
            <input type="text" name="tipoCliente" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Identificación Fiscal (NIT)</label>
            <input type="text" name="nit" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Dirección de Facturación</label>
            <input type="text" name="direccionFacturacion" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Dirección de Entrega</label>
            <input type="text" name="direccionEntrega" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Teléfono</label>
            <input type="text" name="telefono" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Correo Electrónico</label>
            <input type="email" name="correo" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Persona de Contacto</label>
            <input type="text" name="personaContacto" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Método de Pago</label>
            <input type="text" name="metodoPago" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Crear Cliente</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>