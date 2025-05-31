<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Crear Unidad de Almacenamiento</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h1 class="mb-4 text-center">Crear Unidad de Almacenamiento</h1>

    <form action="${pageContext.request.contextPath}/unidadAlmacenamiento" method="post" class="card p-4 shadow-sm">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Código de Unidad</label>
                <input type="text" name="codigoUnidad" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Nombre</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Tipo</label>
                <select name="tipo" class="form-control" required>
                    <option value="">Seleccione...</option>
                    <option value="General" ${unidad.tipo == 'General' ? 'selected' : ''}>General</option>
                    <option value="Congelado" ${unidad.tipo == 'Congelado' ? 'selected' : ''}>Congelado</option>
                    <option value="Peligroso" ${unidad.tipo == 'Peligroso' ? 'selected' : ''}>Peligroso</option>
                    <option value="Refrigerado" ${unidad.tipo == 'Refrigerado' ? 'selected' : ''}>Refrigerado</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Clase (Uso específico)</label>
                <input type="text" name="clase" class="form-control">
            </div>

            <div class="col-md-6">
                <label class="form-label">Bodega Padre</label>
                <select name="bodegaPadre" class="form-control">
                    <option value="">Sin bodega padre</option>
                    <!-- Opciones se llenan por JS -->
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label">Volumen Total (m³)</label>
                <input type="text" name="volumenTotal" class="form-control">
            </div>

            <div class="col-12">
                <label class="form-label">Ubicación Física</label>
                <input type="text" name="ubicacionFisica" class="form-control">
            </div>

            <div class="col-12">
                <label class="form-label">Observaciones</label>
                <input type="text" name="observaciones" class="form-control">
            </div>
        </div>

        <button type="submit" class="btn btn-success w-100 mt-4">Crear Unidad</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    fetch("${pageContext.request.contextPath}/api/unidadesAlmacenamiento")
        .then(response => response.json())
        .then(data => {
            const select = document.querySelector('select[name="bodegaPadre"]');
            select.length = 1; // Deja solo "Sin bodega padre"
            data.forEach(unidad => {
                const option = document.createElement("option");
                option.value = unidad.id;
                option.textContent = unidad.nombre;
                select.appendChild(option);
            });
        })
        .catch(error => {
            console.error("Error cargando bodegas:", error);
        });
});
</script>
</body>
</html>