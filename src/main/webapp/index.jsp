<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menú Principal - Sistema de Logística</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="text-center mb-5">
            <h1 class="display-4">🚛 Bienvenido al Sistema de Logística</h1>
            <p class="lead">Seleccione un módulo para gestionar.</p>
        </div>

        <div class="row">
            <!-- Transporte -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        Módulo de Transportes
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="views/transporte/crearTransporte.jsp" class="btn btn-link">Crear Transporte</a></li>
                            <li><a href="views/transporte/modificarTransporte.jsp" class="btn btn-link">Modificar Transporte</a></li>
                            <li><a href="views/transporte/desactivarTransporte.jsp" class="btn btn-link">Desactivar Transporte</a></li>
                            <li><a href="views/transporte/consultarTransporte.jsp" class="btn btn-link">Consultar Transporte</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Unidad de Almacenamiento -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        Módulo de Unidades de Almacenamiento
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="views/unidadAlmacenamiento/crearUnidad.jsp" class="btn btn-link">Crear Unidad de Almacenamiento</a></li>
                            <li><a href="views/unidadAlmacenamiento/modificarUnidad.jsp" class="btn btn-link">Modificar Unidad de Almacenamiento</a></li>
                            <li><a href="views/unidadAlmacenamiento/desactivarUnidad.jsp" class="btn btn-link">Desactivar Unidad de Almacenamiento</a></li>
                            <li><a href="views/unidadAlmacenamiento/consultarUnidad.jsp" class="btn btn-link">Consultar Unidades de Almacenamiento</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Proveedor -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-dark">
                        Módulo de Proveedores
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="views/proveedor/crearProveedor.jsp" class="btn btn-link">Crear Proveedor</a></li>
                            <li><a href="views/proveedor/modificarProveedor.jsp" class="btn btn-link">Modificar Proveedor</a></li>
                            <li><a href="views/proveedor/desactivarProveedor.jsp" class="btn btn-link">Desactivar Proveedor</a></li>
                            <li><a href="views/proveedor/consultarProveedor.jsp" class="btn btn-link">Consultar Proveedores</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Cliente -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-info text-white">
                        Módulo de Clientes
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="views/cliente/crearCliente.jsp" class="btn btn-link">Crear Cliente</a></li>
                            <li><a href="views/cliente/modificarCliente.jsp" class="btn btn-link">Modificar Cliente</a></li>
                            <li><a href="views/cliente/desactivarCliente.jsp" class="btn btn-link">Desactivar Cliente</a></li>
                            <li><a href="views/cliente/consultarCliente.jsp" class="btn btn-link">Consultar Clientes</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Material -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-danger text-white">
                        Módulo de Materiales
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="views/material/crearMaterial.jsp" class="btn btn-link">Crear Material</a></li>
                            <li><a href="views/material/modificarMaterial.jsp" class="btn btn-link">Modificar Material</a></li>
                            <li><a href="views/material/desactivarMaterial.jsp" class="btn btn-link">Desactivar Material</a></li>
                            <li><a href="views/material/consultarMaterial.jsp" class="btn btn-link">Consultar Materiales</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Movimientos -->
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-danger text-white">
                        Módulo de Movimientos
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><a href="views/movimientos/menuMovimientos.jsp" class="btn btn-link">Acceder a Movimientos</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Bootstrap JS (opcional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>