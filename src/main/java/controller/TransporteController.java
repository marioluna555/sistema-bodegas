package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.persistence.*;
import model.Transporte;
import java.io.IOException;
import java.util.List;

@WebServlet("/transporte")
public class TransporteController extends HttpServlet {
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
                String busqueda = request.getParameter("numeroBusqueda");
                List<Transporte> transportes;
                if (busqueda != null && !busqueda.trim().isEmpty()) {
                    transportes = em.createQuery(
                        "SELECT t FROM Transporte t WHERE LOWER(t.numeroTransporte) LIKE :busqueda",
                        Transporte.class)
                        .setParameter("busqueda", "%" + busqueda.toLowerCase() + "%")
                        .getResultList();
                } else {
                    transportes = em.createQuery("SELECT t FROM Transporte t", Transporte.class).getResultList();
                }
                request.setAttribute("transportes", transportes);
                request.getRequestDispatcher("/views/transporte/consultarTransporte.jsp").forward(request, response);
            } else if ("modificar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                Transporte transporte = em.find(Transporte.class, id);
                request.setAttribute("transporte", transporte);
                request.getRequestDispatcher("/views/transporte/modificarTransporte.jsp").forward(request, response);
            } else if ("desactivar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                em.getTransaction().begin();
                Transporte transporte = em.find(Transporte.class, id);
                if (transporte != null) {
                    em.remove(transporte);
                }
                em.getTransaction().commit();
                response.sendRedirect("transporte?action=consultar");
            } else {
                request.getRequestDispatcher("/views/transporte/crearTransporte.jsp").forward(request, response);
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
                String idStr = request.getParameter("idTransporte");
                em.getTransaction().begin();
                try {
                    Long id = Long.valueOf(idStr);
                    Transporte transporte = em.find(Transporte.class, id);
                    if (transporte != null) {
                        em.remove(transporte);
                        em.getTransaction().commit();
                        response.sendRedirect("transporte?action=consultar");
                        return;
                    } else {
                        em.getTransaction().rollback();
                        request.setAttribute("error", "Transporte no encontrado");
                        request.getRequestDispatcher("/views/transporte/desactivarTransporte.jsp").forward(request, response);
                        return;
                    }
                } catch (Exception e) {
                    em.getTransaction().rollback();
                    request.setAttribute("error", "Error al desactivar el transporte");
                    request.getRequestDispatcher("/views/transporte/desactivarTransporte.jsp").forward(request, response);
                    return;
                }
            }
            String idStr = request.getParameter("id");
            em.getTransaction().begin();
            Transporte transporte;
            if (idStr != null && !idStr.isEmpty()) {
                // Modificar
                Long id = Long.valueOf(idStr);
                transporte = em.find(Transporte.class, id);
                if (transporte != null) {
                    transporte.setNumeroTransporte(request.getParameter("numeroTransporte"));
                    transporte.setTipoVehiculo(request.getParameter("tipoVehiculo"));
                    transporte.setPlaca(request.getParameter("placa"));
                    transporte.setMarca(request.getParameter("marca"));
                    transporte.setCapacidad(request.getParameter("capacidad"));
                    transporte.setKilometraje(request.getParameter("kilometraje"));
                    transporte.setConductor(request.getParameter("conductor"));
                }
            } else {
                // Crear
                transporte = new Transporte();
                transporte.setNumeroTransporte(request.getParameter("numeroTransporte"));
                transporte.setTipoVehiculo(request.getParameter("tipoVehiculo"));
                transporte.setPlaca(request.getParameter("placa"));
                transporte.setMarca(request.getParameter("marca"));
                transporte.setCapacidad(request.getParameter("capacidad"));
                transporte.setKilometraje(request.getParameter("kilometraje"));
                transporte.setConductor(request.getParameter("conductor"));
                em.persist(transporte);
            }
            em.getTransaction().commit();
            response.sendRedirect("transporte?action=consultar");
        } finally {
            em.close();
        }
    }
}