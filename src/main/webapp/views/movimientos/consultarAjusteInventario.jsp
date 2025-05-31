<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar Ajustes de Inventario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="mb-4 text-center">Ajustes de Inventario</h1>
    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Material</th>
                <th>Cantidad</th>
                <th>Tipo de Ajuste</th>
                <th>Usuario</th>
                <th>Observaciones</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% 
                java.util.List<model.AjusteInventario> ajustesInventario = (java.util.List<model.AjusteInventario>) request.getAttribute("ajustesInventario");
                if (ajustesInventario != null && !ajustesInventario.isEmpty()) {
                    for (model.AjusteInventario ajuste : ajustesInventario) {
            %>
            <tr>
                <td><%= ajuste.getId() %></td>
                <td><%= ajuste.getFecha() %></td>
                <td><%= ajuste.getMaterial() != null ? ajuste.getMaterial().getNombreMaterial() : "" %></td>
                <td><%= ajuste.getCantidad() %></td>
                <td><%= ajuste.getTipoAjuste() %></td>
                <td><%= ajuste.getUsuario() %></td>
                <td><%= ajuste.getObservaciones() %></td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/ajusteInventario">
                        <input type="hidden" name="accion" value="aplicar" />
                        <input type="hidden" name="ajusteId" value="<%= ajuste.getId() %>" />
                        <button class="btn btn-success btn-sm" type="submit" <%= ajuste.isAplicado() ? "disabled" : "" %>>Aplicar Ajuste</button>
                    </form>
                </td>
            </tr>
            <%   }
                } else { %>
            <tr>
                <td colspan="8" class="text-center">No hay ajustes de inventario registrados.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-secondary">Volver al menú</a>
    </div>
</div>
</body>
</html>
