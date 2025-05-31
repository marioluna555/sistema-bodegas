package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.persistence.*;
import model.UnidadAlmacenamiento;
import java.io.IOException;
import java.util.List;

@WebServlet("/unidadAlmacenamiento")
public class UnidadAlmacenamientoController extends HttpServlet {
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
                String busqueda = request.getParameter("codigoBusqueda");
                List<UnidadAlmacenamiento> unidades;
                if (busqueda != null && !busqueda.trim().isEmpty()) {
                    unidades = em.createQuery(
                        "SELECT u FROM UnidadAlmacenamiento u WHERE LOWER(u.codigoUnidad) LIKE :busqueda",
                        UnidadAlmacenamiento.class)
                        .setParameter("busqueda", "%" + busqueda.toLowerCase() + "%")
                        .getResultList();
                } else {
                    unidades = em.createQuery("SELECT u FROM UnidadAlmacenamiento u", UnidadAlmacenamiento.class).getResultList();
                }
                request.setAttribute("unidades", unidades);
                request.getRequestDispatcher("/views/unidadAlmacenamiento/consultarUnidad.jsp").forward(request, response);
            } else if ("modificar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                UnidadAlmacenamiento unidad = em.find(UnidadAlmacenamiento.class, id);
                request.setAttribute("unidad", unidad);
                request.getRequestDispatcher("/views/unidadAlmacenamiento/modificarUnidad.jsp").forward(request, response);
            } else if ("desactivar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                em.getTransaction().begin();
                UnidadAlmacenamiento unidad = em.find(UnidadAlmacenamiento.class, id);
                if (unidad != null) {
                    em.remove(unidad);
                }
                em.getTransaction().commit();
                response.sendRedirect("unidadAlmacenamiento?action=consultar");
            } else {
                // Para el formulario de crear, pasar la lista de unidades para el select de bodega padre
                List<UnidadAlmacenamiento> unidadesAlmacenamiento = em.createQuery("SELECT u FROM UnidadAlmacenamiento u", UnidadAlmacenamiento.class).getResultList();
                request.setAttribute("unidadesAlmacenamiento", unidadesAlmacenamiento);
                request.getRequestDispatcher("/views/unidadAlmacenamiento/crearUnidad.jsp").forward(request, response);
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
                String codigoUnidad = request.getParameter("codigoUnidad");
                em.getTransaction().begin();
                try {
                    UnidadAlmacenamiento unidad = em.createQuery(
                        "SELECT u FROM UnidadAlmacenamiento u WHERE u.codigoUnidad = :codigoUnidad", UnidadAlmacenamiento.class)
                        .setParameter("codigoUnidad", codigoUnidad)
                        .getSingleResult();
                    if (unidad != null) {
                        em.remove(unidad);
                        em.getTransaction().commit();
                        response.sendRedirect("unidadAlmacenamiento?action=consultar");
                        return;
                    }
                } catch (NoResultException e) {
                    em.getTransaction().rollback();
                    request.setAttribute("error", "Unidad no encontrada");
                    request.getRequestDispatcher("/views/unidadAlmacenamiento/desactivarUnidad.jsp").forward(request, response);
                    return;
                }
            } else {
                String idStr = request.getParameter("id");
                em.getTransaction().begin();
                UnidadAlmacenamiento unidad;
                if (idStr != null && !idStr.isEmpty()) {
                    // Modificar
                    Long id = Long.valueOf(idStr);
                    unidad = em.find(UnidadAlmacenamiento.class, id);
                    if (unidad != null) {
                        unidad.setCodigoUnidad(request.getParameter("codigoUnidad"));
                        unidad.setNombre(request.getParameter("nombre"));
                        unidad.setTipo(request.getParameter("tipo"));
                        unidad.setClase(request.getParameter("clase"));
                        String bodegaPadreId = request.getParameter("bodegaPadre");
                        if (bodegaPadreId != null && !bodegaPadreId.isEmpty()) {
                            UnidadAlmacenamiento bodegaPadre = em.find(UnidadAlmacenamiento.class, Long.valueOf(bodegaPadreId));
                            unidad.setBodegaPadre(bodegaPadre);
                        } else {
                            unidad.setBodegaPadre(null);
                        }
                        unidad.setVolumenTotal(request.getParameter("volumenTotal"));
                        unidad.setUbicacionFisica(request.getParameter("ubicacionFisica"));
                        unidad.setObservaciones(request.getParameter("observaciones"));
                    }
                } else {
                    // Crear
                    unidad = new UnidadAlmacenamiento();
                    unidad.setCodigoUnidad(request.getParameter("codigoUnidad"));
                    unidad.setNombre(request.getParameter("nombre"));
                    unidad.setTipo(request.getParameter("tipo"));
                    unidad.setClase(request.getParameter("clase"));
                    String bodegaPadreId = request.getParameter("bodegaPadre");
                    if (bodegaPadreId != null && !bodegaPadreId.isEmpty()) {
                        UnidadAlmacenamiento bodegaPadre = em.find(UnidadAlmacenamiento.class, Long.valueOf(bodegaPadreId));
                        unidad.setBodegaPadre(bodegaPadre);
                    } else {
                        unidad.setBodegaPadre(null);
                    }
                    unidad.setVolumenTotal(request.getParameter("volumenTotal"));
                    unidad.setUbicacionFisica(request.getParameter("ubicacionFisica"));
                    unidad.setObservaciones(request.getParameter("observaciones"));
                    em.persist(unidad);
                }
                em.getTransaction().commit();
                response.sendRedirect("unidadAlmacenamiento?action=consultar");
            }
        } finally {
            em.close();
        }
    }
}