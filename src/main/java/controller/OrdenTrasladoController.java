package controller;

import model.OrdenTraslado;
import model.Material;
import model.UnidadAlmacenamiento;
import java.io.IOException;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ordenTraslado")
public class OrdenTrasladoController extends HttpServlet {
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

    // Métodos para crear, consultar y confirmar salida/recepción de traslado
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            List<OrdenTraslado> ordenes = em.createQuery("SELECT o FROM OrdenTraslado o ORDER BY o.id DESC", OrdenTraslado.class).getResultList();
            req.setAttribute("ordenesTraslado", ordenes);
        } finally {
            em.close();
        }
        req.getRequestDispatcher("/views/movimientos/consultarOrdenTraslado.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int materialId = Integer.parseInt(req.getParameter("materialId"));
        double cantidad = Double.parseDouble(req.getParameter("cantidad"));
        int almacenOrigenId = Integer.parseInt(req.getParameter("almacenOrigen"));
        int almacenDestinoId = Integer.parseInt(req.getParameter("almacenDestino"));
        String usuario = req.getRemoteUser() != null ? req.getRemoteUser() : "admin";
        String observaciones = req.getParameter("observaciones");
        OrdenTraslado orden = new OrdenTraslado();
        orden.setMaterial(new model.Material());
        orden.getMaterial().setId(materialId);
        orden.setCantidad(cantidad);
        model.UnidadAlmacenamiento origen = new model.UnidadAlmacenamiento();
        origen.setId(almacenOrigenId);
        orden.setAlmacenOrigen(origen);
        model.UnidadAlmacenamiento destino = new model.UnidadAlmacenamiento();
        destino.setId(almacenDestinoId);
        orden.setAlmacenDestino(destino);
        orden.setSalida(false);
        orden.setRecibido(false);
        orden.setUsuario(usuario);
        orden.setObservaciones(observaciones);
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
        resp.sendRedirect(req.getContextPath() + "/ordenTraslado");
    }

    // Método para confirmar salida de traslado y actualizar stock en almacén origen
    public void confirmarSalida(int ordenId) {
        // Buscar la orden de traslado por ID (debería implementarse en DAO)
        // OrdenTraslado orden = OrdenTrasladoDAO.obtenerPorId(ordenId);
        // if (!orden.isSalida()) {
        //     MaterialDAO.disminuirStock(orden.getMaterial().getId(), orden.getCantidad());
        //     orden.setSalida(true);
        //     OrdenTrasladoDAO.actualizar(orden);
        // }
    }

    // Método para confirmar recepción de traslado y actualizar stock en almacén destino
    public void confirmarRecepcion(int ordenId) {
        // Buscar la orden de traslado por ID (debería implementarse en DAO)
        // OrdenTraslado orden = OrdenTrasladoDAO.obtenerPorId(ordenId);
        // if (!orden.isRecibido()) {
        //     MaterialDAO.aumentarStock(orden.getMaterial().getId(), orden.getCantidad());
        //     orden.setRecibido(true);
        //     OrdenTrasladoDAO.actualizar(orden);
        // }
    }
}
