<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar Ordenes de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="mb-4 text-center">Órdenes de Venta</h1>
    <table class="table table-bordered table-hover">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Material</th>
                <th>Cantidad Venta</th>
                <th>Usuario</th>
                <th>Entregado</th>
                <th>Observaciones</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody>
            <% 
                java.util.List<model.OrdenVenta> ordenesVenta = (java.util.List<model.OrdenVenta>) request.getAttribute("ordenesVenta");
                if (ordenesVenta != null && !ordenesVenta.isEmpty()) {
                    for (model.OrdenVenta orden : ordenesVenta) {
            %>
            <tr>
                <td><%= orden.getId() %></td>
                <td><%= orden.getFecha() %></td>
                <td><%= orden.getMaterial() != null ? orden.getMaterial().getNombreMaterial() : "" %></td>
                <td><%= orden.getCantidad() %></td>
                <td><%= orden.getUsuario() %></td>
                <td><%= orden.isEntregado() ? "Sí" : "No" %></td>
                <td><%= orden.getObservaciones() %></td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/ordenVenta">
                        <input type="hidden" name="accion" value="confirmarEntrega" />
                        <input type="hidden" name="ordenId" value="<%= orden.getId() %>" />
                        <button class="btn btn-success btn-sm" type="submit" <%= orden.isEntregado() ? "disabled" : "" %>>Confirmar Entrega</button>
                    </form>
                </td>
            </tr>
            <%   }
                } else { %>
            <tr>
                <td colspan="8" class="text-center">No hay órdenes de venta registradas.</td>
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
