package controller;

import model.AjusteInventario;
import model.Material;
import java.io.IOException;
import java.util.List;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ajusteInventario")
public class AjusteInventarioController extends HttpServlet {
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

    // Métodos para crear, consultar y aplicar ajustes de inventario
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            List<AjusteInventario> ajustes = em.createQuery("SELECT a FROM AjusteInventario a ORDER BY a.id DESC", AjusteInventario.class).getResultList();
            req.setAttribute("ajustesInventario", ajustes);
        } finally {
            em.close();
        }
        req.getRequestDispatcher("/views/movimientos/consultarAjusteInventario.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if ("aplicar".equals(accion)) {
            String ajusteIdParam = req.getParameter("ajusteId");
            if (ajusteIdParam != null && !ajusteIdParam.isEmpty()) {
                int ajusteId = Integer.parseInt(ajusteIdParam);
                EntityManager em = emf.createEntityManager();
                try {
                    em.getTransaction().begin();
                    AjusteInventario ajuste = em.find(AjusteInventario.class, ajusteId);
                    if (ajuste != null) {
                        aplicarAjusteJPA(em, ajuste);
                    }
                    em.getTransaction().commit();
                } finally {
                    em.close();
                }
            }
            resp.sendRedirect(req.getContextPath() + "/ajusteInventario");
            return;
        }
        int materialId = Integer.parseInt(req.getParameter("materialId"));
        double cantidad = Double.parseDouble(req.getParameter("cantidad"));
        String tipoAjuste = req.getParameter("tipoAjuste");
        String usuario = req.getRemoteUser() != null ? req.getRemoteUser() : "admin";
        String observaciones = req.getParameter("observaciones");
        AjusteInventario ajuste = new AjusteInventario();
        ajuste.setMaterial(new model.Material());
        ajuste.getMaterial().setId(materialId);
        ajuste.setCantidad(cantidad);
        ajuste.setTipoAjuste(tipoAjuste);
        ajuste.setUsuario(usuario);
        ajuste.setObservaciones(observaciones);
        String fechaParam = req.getParameter("fecha");
        if (fechaParam != null && !fechaParam.isEmpty()) {
            try {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                ajuste.setFecha(sdf.parse(fechaParam));
            } catch (Exception e) {
                ajuste.setFecha(new java.util.Date());
            }
        } else {
            ajuste.setFecha(new java.util.Date());
        }
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(ajuste);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
        resp.sendRedirect(req.getContextPath() + "/ajusteInventario");
    }

    // Método para aplicar ajuste de inventario y actualizar stock usando JPA
    private void aplicarAjusteJPA(EntityManager em, AjusteInventario ajuste) {
        if (ajuste == null || ajuste.getMaterial() == null || ajuste.getMaterial().getId() == 0 || ajuste.isAplicado()) {
            return;
        }
        Material material = em.find(Material.class, ajuste.getMaterial().getId());
        if (material != null) {
            try {
                double stockActual = 0;
                if (material.getStockDisponible() != null && !material.getStockDisponible().isEmpty()) {
                    stockActual = Double.parseDouble(material.getStockDisponible());
                }
                if ("AUMENTO".equalsIgnoreCase(ajuste.getTipoAjuste())) {
                    material.setStockDisponible(String.valueOf(stockActual + ajuste.getCantidad()));
                } else if ("DISMINUCION".equalsIgnoreCase(ajuste.getTipoAjuste())) {
                    material.setStockDisponible(String.valueOf(stockActual - ajuste.getCantidad()));
                }
            } catch (Exception e) {
                if ("AUMENTO".equalsIgnoreCase(ajuste.getTipoAjuste())) {
                    material.setStockDisponible(String.valueOf(ajuste.getCantidad()));
                } else if ("DISMINUCION".equalsIgnoreCase(ajuste.getTipoAjuste())) {
                    material.setStockDisponible(String.valueOf(-ajuste.getCantidad()));
                }
            }
            ajuste.setAplicado(true);
            em.merge(ajuste);
        }
    }
}
