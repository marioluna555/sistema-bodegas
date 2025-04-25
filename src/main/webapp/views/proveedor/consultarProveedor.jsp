<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar Proveedores</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Consultar Proveedores</h1>

    <!-- Formulario de búsqueda -->
    <form action="#" method="get" class="card p-4 shadow-sm mb-5">
        <div class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="busquedaProveedor" class="col-form-label">Buscar por Número / Nombre:</label>
            </div>
            <div class="col-auto">
                <input type="text" id="busquedaProveedor" name="busquedaProveedor" class="form-control">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">Buscar</button>
            </div>
        </div>
    </form>

    <!-- Tabla de resultados -->
    <h2 class="mb-3">Resultados:</h2>
    <div class="table-responsive shadow-sm">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Número</th>
                    <th>Nombre / Razón Social</th>
                    <th>NIT</th>
                    <th>Tipo</th>
                    <th>Banco</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                <!-- Aquí irán los resultados dinámicamente -->
            </tbody>
        </table>
    </div>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>