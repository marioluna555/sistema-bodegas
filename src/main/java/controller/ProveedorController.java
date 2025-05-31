package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import jakarta.persistence.*;
import model.Proveedor;
import java.util.List;

@WebServlet("/proveedor")
public class ProveedorController extends HttpServlet {
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
        if (action == null && request.getParameter("busquedaProveedor") != null) {
            action = "consultar";
        }
        EntityManager em = emf.createEntityManager();
        try {
            if ("consultar".equals(action)) {
                String busqueda = request.getParameter("busquedaProveedor");
                List<Proveedor> proveedores;
                if (busqueda != null && !busqueda.trim().isEmpty()) {
                    proveedores = em.createQuery(
                        "SELECT p FROM Proveedor p WHERE LOWER(p.numeroProveedor) LIKE :busqueda OR LOWER(p.nombreRazonSocial) LIKE :busqueda",
                        Proveedor.class)
                        .setParameter("busqueda", "%" + busqueda.toLowerCase() + "%")
                        .getResultList();
                } else {
                    proveedores = em.createQuery("SELECT p FROM Proveedor p", Proveedor.class).getResultList();
                }
                request.setAttribute("proveedores", proveedores);
                request.getRequestDispatcher("/views/proveedor/consultarProveedor.jsp").forward(request, response);
            } else if ("modificar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                Proveedor proveedor = em.find(Proveedor.class, id);
                request.setAttribute("proveedor", proveedor);
                request.getRequestDispatcher("/views/proveedor/modificarProveedor.jsp").forward(request, response);
            } else if ("desactivar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                em.getTransaction().begin();
                Proveedor proveedor = em.find(Proveedor.class, id);
                if (proveedor != null) {
                    em.remove(proveedor);
                }
                em.getTransaction().commit();
                response.sendRedirect("proveedor?action=consultar");
            } else {
                request.getRequestDispatcher("/views/proveedor/crearProveedor.jsp").forward(request, response);
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
                String numeroProveedor = request.getParameter("numeroProveedor");
                em.getTransaction().begin();
                try {
                    Proveedor proveedor = em.createQuery(
                        "SELECT p FROM Proveedor p WHERE p.numeroProveedor = :numeroProveedor", Proveedor.class)
                        .setParameter("numeroProveedor", numeroProveedor)
                        .getSingleResult();
                    if (proveedor != null) {
                        em.remove(proveedor);
                    }
                    em.getTransaction().commit();
                } catch (NoResultException e) {
                    em.getTransaction().rollback();
                    request.setAttribute("error", "Proveedor no encontrado");
                    request.getRequestDispatcher("/views/proveedor/desactivarProveedor.jsp").forward(request, response);
                    return;
                }
                response.sendRedirect("proveedor?action=consultar");
                return;
            }
            String idStr = request.getParameter("id");
            em.getTransaction().begin();
            Proveedor proveedor;
            if (idStr != null && !idStr.isEmpty()) {
                // Modificar
                Long id = Long.valueOf(idStr);
                proveedor = em.find(Proveedor.class, id);
                if (proveedor != null) {
                    proveedor.setNumeroProveedor(request.getParameter("numeroProveedor"));
                    proveedor.setNombreRazonSocial(request.getParameter("nombreRazonSocial"));
                    proveedor.setNit(request.getParameter("nit"));
                    proveedor.setTipoProveedor(request.getParameter("tipoProveedor"));
                    proveedor.setDireccionFiscal(request.getParameter("direccionFiscal"));
                    proveedor.setRepresentanteLegal(request.getParameter("representanteLegal"));
                    proveedor.setTelefono(request.getParameter("telefono"));
                    String metodoPagoStr = request.getParameter("metodoPago");
                    if (metodoPagoStr != null && !metodoPagoStr.isEmpty()) {
                        proveedor.setMetodoPago(Proveedor.MetodoPago.valueOf(metodoPagoStr));
                    } else {
                        proveedor.setMetodoPago(null);
                    }
                    String condicionPagoStr = request.getParameter("condicionPago");
                    if (condicionPagoStr != null && !condicionPagoStr.isEmpty()) {
                        proveedor.setCondicionPago(Proveedor.CondicionPago.valueOf(condicionPagoStr));
                    } else {
                        proveedor.setCondicionPago(null);
                    }
                    proveedor.setBanco(request.getParameter("banco"));
                    proveedor.setTipoCuenta(request.getParameter("tipoCuenta"));
                    proveedor.setNumeroCuenta(request.getParameter("numeroCuenta"));
                }
            } else {
                // Crear
                proveedor = new Proveedor();
                proveedor.setNumeroProveedor(request.getParameter("numeroProveedor"));
                proveedor.setNombreRazonSocial(request.getParameter("nombreRazonSocial"));
                proveedor.setNit(request.getParameter("nit"));
                proveedor.setTipoProveedor(request.getParameter("tipoProveedor"));
                proveedor.setDireccionFiscal(request.getParameter("direccionFiscal"));
                proveedor.setRepresentanteLegal(request.getParameter("representanteLegal"));
                proveedor.setTelefono(request.getParameter("telefono"));
                String metodoPagoStr = request.getParameter("metodoPago");
                if (metodoPagoStr != null && !metodoPagoStr.isEmpty()) {
                    proveedor.setMetodoPago(Proveedor.MetodoPago.valueOf(metodoPagoStr));
                } else {
                    proveedor.setMetodoPago(null);
                }
                String condicionPagoStr = request.getParameter("condicionPago");
                if (condicionPagoStr != null && !condicionPagoStr.isEmpty()) {
                    proveedor.setCondicionPago(Proveedor.CondicionPago.valueOf(condicionPagoStr));
                } else {
                    proveedor.setCondicionPago(null);
                }
                proveedor.setBanco(request.getParameter("banco"));
                proveedor.setTipoCuenta(request.getParameter("tipoCuenta"));
                proveedor.setNumeroCuenta(request.getParameter("numeroCuenta"));
                em.persist(proveedor);
            }
            em.getTransaction().commit();
            response.sendRedirect("proveedor?action=consultar");
        } finally {
            em.close();
        }
    }
}