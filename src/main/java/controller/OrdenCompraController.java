package controller;

import model.OrdenCompra;
import model.Material;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

@WebServlet("/ordenCompra")
public class OrdenCompraController extends HttpServlet {

    private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("logisticaPU");
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
    
    // Métodos para crear, consultar y confirmar recepción de orden de compra
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("logisticaPU");
        EntityManager em = emf.createEntityManager();
        try {
            List<OrdenCompra> ordenes = em.createQuery("SELECT o FROM OrdenCompra o ORDER BY o.id DESC", OrdenCompra.class).getResultList();
            req.setAttribute("ordenesCompra", ordenes);
        } finally {
            em.close();
            emf.close();
        }
        req.getRequestDispatcher("/views/movimientos/consultarOrdenCompra.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if ("confirmarRecepcion".equals(accion)) {
            int ordenId = Integer.parseInt(req.getParameter("ordenId"));
            confirmarRecepcion(ordenId);
            resp.sendRedirect(req.getContextPath() + "/ordenCompra");
            return;
        }
        // Obtener datos del formulario
        int materialId = Integer.parseInt(req.getParameter("materialId"));
        double cantidad = Double.parseDouble(req.getParameter("cantidad"));
        String usuario = req.getRemoteUser() != null ? req.getRemoteUser() : "admin";
        String observaciones = req.getParameter("observaciones");

        // Crear la orden de compra (no recibida aún)
        OrdenCompra orden = new OrdenCompra();
        orden.setMaterial(new model.Material());
        orden.getMaterial().setId(materialId);
        orden.setCantidad(cantidad);
        orden.setUsuario(usuario);
        orden.setRecibido(false);
        orden.setObservaciones(observaciones);
        // Si el usuario envía la fecha, úsala; si no, usa la actual
        String fechaParam = req.getParameter("fecha");
        if (fechaParam != null && !fechaParam.isEmpty()) {
            try {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                orden.setFecha(sdf.parse(fechaParam));
            } catch (Exception e) {
                orden.setFecha(new java.util.Date()); // fallback
            }
        } else {
            orden.setFecha(new java.util.Date());
        }
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(orden);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
        // Redirigir a la consulta
        resp.sendRedirect(req.getContextPath() + "/ordenCompra");
    }

    // Método para confirmar recepción de orden de compra y actualizar stock
    public void confirmarRecepcion(int ordenId) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            OrdenCompra orden = em.find(OrdenCompra.class, ordenId);
            if (orden != null) {
                orden.setRecibido(true);
                // Actualizar stock del material solo si existe
                Material material = null;
                if (orden.getMaterial() != null) {
                    material = em.find(Material.class, orden.getMaterial().getId());
                }
                if (material != null) {
                    try {
                        double stockActual = Double.parseDouble(material.getStockDisponible());
                        material.setStockDisponible(String.valueOf(stockActual + orden.getCantidad()));
                    } catch (Exception e) {
                        material.setStockDisponible(String.valueOf(orden.getCantidad()));
                    }
                }
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
