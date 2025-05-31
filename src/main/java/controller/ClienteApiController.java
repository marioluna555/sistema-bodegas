package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.persistence.*;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import model.Cliente;

@WebServlet("/api/clientes")
public class ClienteApiController extends HttpServlet {
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        try {
            List<Cliente> clientes = em.createQuery("SELECT c FROM Cliente c", Cliente.class).getResultList();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(new Gson().toJson(clientes));
        } finally {
            em.close();
        }
    }
}
