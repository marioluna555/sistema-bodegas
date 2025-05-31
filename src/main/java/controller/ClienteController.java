package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import jakarta.persistence.*;
import model.Cliente;
import java.util.List;

@WebServlet("/cliente")
public class ClienteController extends HttpServlet {
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
        if (action == null && request.getParameter("busquedaCliente") != null) {
            action = "consultar";
        }
        EntityManager em = emf.createEntityManager();
        try {
            if ("consultar".equals(action)) {
                String busqueda = request.getParameter("busquedaCliente");
                List<Cliente> clientes;
                if (busqueda != null && !busqueda.trim().isEmpty()) {
                    clientes = em.createQuery(
                        "SELECT c FROM Cliente c WHERE LOWER(c.numeroCliente) LIKE :busqueda OR LOWER(c.nombreRazonSocial) LIKE :busqueda",
                        Cliente.class)
                        .setParameter("busqueda", "%" + busqueda.toLowerCase() + "%")
                        .getResultList();
                } else {
                    clientes = em.createQuery("SELECT c FROM Cliente c", Cliente.class).getResultList();
                }
                request.setAttribute("clientes", clientes);
                request.getRequestDispatcher("/views/cliente/consultarCliente.jsp").forward(request, response);
            } else if ("modificar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                Cliente cliente = em.find(Cliente.class, id);
                request.setAttribute("cliente", cliente);
                request.getRequestDispatcher("/views/cliente/modificarCliente.jsp").forward(request, response);
            } else if ("desactivar".equals(action)) {
                Long id = Long.valueOf(request.getParameter("id"));
                em.getTransaction().begin();
                Cliente cliente = em.find(Cliente.class, id);
                if (cliente != null) {
                    em.remove(cliente);
                }
                em.getTransaction().commit();
                response.sendRedirect("cliente?action=consultar");
            } else {
                request.getRequestDispatcher("/views/cliente/crearCliente.jsp").forward(request, response);
            }
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            String idStr = request.getParameter("id");
            em.getTransaction().begin();
            Cliente cliente;
            if (idStr != null && !idStr.isEmpty()) {
                // Modificar
                Long id = Long.valueOf(idStr);
                cliente = em.find(Cliente.class, id);
                if (cliente != null) {
                    cliente.setNumeroCliente(request.getParameter("numeroCliente"));
                    cliente.setNombreRazonSocial(request.getParameter("nombreRazonSocial"));
                    cliente.setTipoCliente(request.getParameter("tipoCliente"));
                    cliente.setNit(request.getParameter("nit"));
                    cliente.setDireccionFacturacion(request.getParameter("direccionFacturacion"));
                    cliente.setDireccionEntrega(request.getParameter("direccionEntrega"));
                    cliente.setTelefono(request.getParameter("telefono"));
                    cliente.setCorreo(request.getParameter("correo"));
                    cliente.setPersonaContacto(request.getParameter("personaContacto"));
                    cliente.setMetodoPago(request.getParameter("metodoPago"));
                }
            } else {
                // Crear
                cliente = new Cliente();
                cliente.setNumeroCliente(request.getParameter("numeroCliente"));
                cliente.setNombreRazonSocial(request.getParameter("nombreRazonSocial"));
                cliente.setTipoCliente(request.getParameter("tipoCliente"));
                cliente.setNit(request.getParameter("nit"));
                cliente.setDireccionFacturacion(request.getParameter("direccionFacturacion"));
                cliente.setDireccionEntrega(request.getParameter("direccionEntrega"));
                cliente.setTelefono(request.getParameter("telefono"));
                cliente.setCorreo(request.getParameter("correo"));
                cliente.setPersonaContacto(request.getParameter("personaContacto"));
                cliente.setMetodoPago(request.getParameter("metodoPago"));
                em.persist(cliente);
            }
            em.getTransaction().commit();
            response.sendRedirect("cliente?action=consultar");
        } finally {
            em.close();
        }
    }
}