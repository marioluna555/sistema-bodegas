package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.persistence.*;
import model.Proveedor;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;

@WebServlet("/api/proveedores")
public class ProveedorApiController extends HttpServlet {
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        EntityManager em = emf.createEntityManager();
        try {
            List<Proveedor> proveedores = em.createQuery("SELECT p FROM Proveedor p", Proveedor.class).getResultList();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(proveedores));
        } finally {
            em.close();
        }
    }
}
