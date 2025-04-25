<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Desactivar Transporte</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <h1 class="text-center mb-4">🚫 Desactivar Transporte</h1>

    <form action="#" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label for="idTransporte" class="form-label">ID Transporte</label>
            <input type="text" id="idTransporte" name="idTransporte" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-danger w-100">Desactivar Transporte</button>
    </form>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al Inicio</a>
    </div>
</div>

<!-- Bootstrap JS (opcional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>