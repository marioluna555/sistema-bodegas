package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.persistence.*;
import model.Material;
import model.UnidadAlmacenamiento;
import java.util.List;
import java.text.SimpleDateFormat;
import java.io.IOException;

@WebServlet("/material")
public class MaterialController extends HttpServlet {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        EntityManager em = emf.createEntityManager();
        try {
            if ("consultar".equals(action)) {
                String busqueda = request.getParameter("busquedaMaterial");
                List<Material> materiales;
                if (busqueda != null && !busqueda.trim().isEmpty()) {
                    materiales = em.createQuery(
                        "SELECT m FROM Material m WHERE LOWER(m.codigoMaterial) LIKE :busqueda OR LOWER(m.nombreMaterial) LIKE :busqueda",
                        Material.class)
                        .setParameter("busqueda", "%" + busqueda.toLowerCase() + "%")
                        .getResultList();
                } else {
                    materiales = em.createQuery("SELECT m FROM Material m", Material.class).getResultList();
                }
                request.setAttribute("materiales", materiales);
                request.getRequestDispatcher("/views/material/consultarMaterial.jsp").forward(request, response);
            } else if ("modificar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                Material material = em.find(Material.class, id);
                request.setAttribute("material", material);
                request.getRequestDispatcher("/views/material/modificarMaterial.jsp").forward(request, response);
            } else if ("desactivar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                em.getTransaction().begin();
                Material material = em.find(Material.class, id);
                if (material != null) {
                    em.remove(material);
                }
                em.getTransaction().commit();
                response.sendRedirect("material?action=consultar");
            } else {
                request.getRequestDispatcher("/views/material/crearMaterial.jsp").forward(request, response);
            }
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            String action = request.getParameter("action");
            if ("desactivar".equals(action)) {
                String codigoMaterial = request.getParameter("codigoMaterial");
                em.getTransaction().begin();
                try {
                    Material material = em.createQuery(
                        "SELECT m FROM Material m WHERE m.codigoMaterial = :codigoMaterial", Material.class)
                        .setParameter("codigoMaterial", codigoMaterial)
                        .getSingleResult();
                    if (material != null) {
                        em.remove(material);
                        em.getTransaction().commit();
                        response.sendRedirect("material?action=consultar");
                        return;
                    }
                } catch (NoResultException e) {
                    em.getTransaction().rollback();
                    request.setAttribute("error", "Material no encontrado");
                    request.getRequestDispatcher("/views/material/desactivarMaterial.jsp").forward(request, response);
                    return;
                }
            } else {
                String idStr = request.getParameter("id");
                em.getTransaction().begin();
                Material material;
                if (idStr != null && !idStr.isEmpty()) {
                    // Modificar
                    Long id = Long.valueOf(idStr);
                    material = em.find(Material.class, id);
                    if (material != null) {
                        material.setCodigoMaterial(request.getParameter("codigoMaterial"));
                        material.setNombreMaterial(request.getParameter("nombreMaterial"));
                        material.setDescripcion(request.getParameter("descripcion"));
                        material.setCategoria(request.getParameter("categoria"));
                        material.setPresentacionCantidad(request.getParameter("presentacionCantidad"));
                        material.setPeso(request.getParameter("peso"));
                        material.setVolumen(request.getParameter("volumen"));
                        material.setStockDisponible(request.getParameter("stockDisponible"));
                        material.setStockMinimo(request.getParameter("stockMinimo"));
                        material.setStockMaximo(request.getParameter("stockMaximo"));
                        material.setLoteSerie(request.getParameter("loteSerie"));
                        try {
                            String fechaVencimientoStr = request.getParameter("fechaVencimiento");
                            if (fechaVencimientoStr != null && !fechaVencimientoStr.isEmpty()) {
                                material.setFechaVencimiento(new SimpleDateFormat("yyyy-MM-dd").parse(fechaVencimientoStr));
                            }
                        } catch (Exception e) { /* ignorar */ }
                        String ubicacionId = request.getParameter("ubicacion");
                        if (ubicacionId != null && !ubicacionId.isEmpty()) {
                            UnidadAlmacenamiento ubicacion = em.find(model.UnidadAlmacenamiento.class, Long.valueOf(ubicacionId));
                            material.setUbicacion(ubicacion);
                        } else {
                            material.setUbicacion(null);
                        }
                        String proveedorId = request.getParameter("proveedor");
                        if (proveedorId != null && !proveedorId.isEmpty()) {
                            model.Proveedor proveedor = em.find(model.Proveedor.class, Long.valueOf(proveedorId));
                            material.setProveedor(proveedor);
                        } else {
                            material.setProveedor(null);
                        }
                        material.setCostoUnitario(request.getParameter("costoUnitario"));
                        material.setCostoTotal(request.getParameter("costoTotal"));
                        material.setObservaciones(request.getParameter("observaciones"));
                    }
                } else {
                    // Crear
                    material = new Material();
                    material.setCodigoMaterial(request.getParameter("codigoMaterial"));
                    material.setNombreMaterial(request.getParameter("nombreMaterial"));
                    material.setDescripcion(request.getParameter("descripcion"));
                    material.setCategoria(request.getParameter("categoria"));
                    material.setPresentacionCantidad(request.getParameter("presentacionCantidad"));
                    material.setPeso(request.getParameter("peso"));
                    material.setVolumen(request.getParameter("volumen"));
                    material.setStockDisponible(request.getParameter("stockDisponible"));
                    material.setStockMinimo(request.getParameter("stockMinimo"));
                    material.setStockMaximo(request.getParameter("stockMaximo"));
                    material.setLoteSerie(request.getParameter("loteSerie"));
                    try {
                        String fechaVencimientoStr = request.getParameter("fechaVencimiento");
                        if (fechaVencimientoStr != null && !fechaVencimientoStr.isEmpty()) {
                            material.setFechaVencimiento(new SimpleDateFormat("yyyy-MM-dd").parse(fechaVencimientoStr));
                        }
                    } catch (Exception e) { /* ignorar */ }
                    String ubicacionId = request.getParameter("ubicacion");
                    if (ubicacionId != null && !ubicacionId.isEmpty()) {
                        UnidadAlmacenamiento ubicacion = em.find(model.UnidadAlmacenamiento.class, Long.valueOf(ubicacionId));
                        material.setUbicacion(ubicacion);
                    } else {
                        material.setUbicacion(null);
                    }
                    String proveedorId = request.getParameter("proveedor");
                    if (proveedorId != null && !proveedorId.isEmpty()) {
                        model.Proveedor proveedor = em.find(model.Proveedor.class, Long.valueOf(proveedorId));
                        material.setProveedor(proveedor);
                    } else {
                        material.setProveedor(null);
                    }
                    material.setCostoUnitario(request.getParameter("costoUnitario"));
                    material.setCostoTotal(request.getParameter("costoTotal"));
                    material.setObservaciones(request.getParameter("observaciones"));
                    em.persist(material);
                }
                em.getTransaction().commit();
                response.sendRedirect("material?action=consultar");
            }
        } finally {
            em.close();
        }
    }
}