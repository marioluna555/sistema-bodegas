package controller;

import model.OrdenVenta;
import model.Material;
import java.io.IOException;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ordenVenta")
public class OrdenVentaController extends HttpServlet {
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

    // Métodos para crear, consultar y confirmar entrega de orden de venta
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            List<OrdenVenta> ordenes = em.createQuery("SELECT o FROM OrdenVenta o ORDER BY o.id DESC", OrdenVenta.class).getResultList();
            req.setAttribute("ordenesVenta", ordenes);
        } finally {
            em.close();
        }
        req.getRequestDispatcher("/views/movimientos/consultarOrdenVenta.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if ("confirmarEntrega".equals(accion)) {
            String ordenIdParam = req.getParameter("ordenId");
            if (ordenIdParam == null || ordenIdParam.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/ordenVenta");
                return;
            }
            int ordenId = Integer.parseInt(ordenIdParam);
            confirmarEntrega(ordenId);
            resp.sendRedirect(req.getContextPath() + "/ordenVenta");
            return;
        }
        // Solo procesar creación de orden si no es acción de confirmarEntrega
        if (req.getParameter("materialId") == null || req.getParameter("clienteId") == null || req.getParameter("unidadAlmacenamientoId") == null) {
            resp.sendRedirect(req.getContextPath() + "/ordenVenta");
            return;
        }
        int materialId = Integer.parseInt(req.getParameter("materialId"));
        double cantidad = Double.parseDouble(req.getParameter("cantidad"));
        int clienteId = Integer.parseInt(req.getParameter("clienteId"));
        int unidadAlmacenamientoId = Integer.parseInt(req.getParameter("unidadAlmacenamientoId"));
        String usuario = req.getRemoteUser() != null ? req.getRemoteUser() : "admin";
        String observaciones = req.getParameter("observaciones");
        OrdenVenta orden = new OrdenVenta();
        orden.setMaterial(new model.Material());
        orden.getMaterial().setId(materialId);
        orden.setCantidad(cantidad);
        orden.setUsuario(usuario);
        orden.setEntregado(false);
        orden.setObservaciones(observaciones);
        // Asignar cliente
        model.Cliente cliente = new model.Cliente();
        cliente.setId((long) clienteId);
        orden.setCliente(cliente);
        // Asignar unidad de almacenamiento de salida
        model.UnidadAlmacenamiento unidad = new model.UnidadAlmacenamiento();
        unidad.setId((long) unidadAlmacenamientoId);
        orden.setUnidadAlmacenamientoSalida(unidad);
        String fechaParam = req.getParameter("fecha");
        if (fechaParam != null && !fechaParam.isEmpty()) {
            try {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                orden.setFecha(sdf.parse(fechaParam));
            } catch (Exception e) {
                orden.setFecha(new java.util.Date());
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
        resp.sendRedirect(req.getContextPath() + "/ordenVenta");
    }

    // Método para confirmar entrega de orden de venta y actualizar stock
    public void confirmarEntrega(int ordenId) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            OrdenVenta orden = em.find(OrdenVenta.class, ordenId);
            if (orden != null) {
                orden.setEntregado(true);
                // Actualizar stock del material (restar la cantidad vendida)
                Material material = null;
                if (orden.getMaterial() != null) {
                    material = em.find(Material.class, orden.getMaterial().getId());
                }
                if (material != null) {
                    try {
                        double stockActual = Double.parseDouble(material.getStockDisponible());
                        material.setStockDisponible(String.valueOf(stockActual - orden.getCantidad()));
                    } catch (Exception e) {
                        // Si el stock no es numérico, lo inicializa negativo
                        material.setStockDisponible(String.valueOf(-orden.getCantidad()));
                    }
                }
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
