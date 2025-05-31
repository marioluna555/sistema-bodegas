package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.persistence.*;
import model.UnidadAlmacenamiento;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;

@WebServlet("/api/unidadesAlmacenamiento")
public class UnidadAlmacenamientoApiController extends HttpServlet {
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
            List<UnidadAlmacenamiento> unidades = em.createQuery("SELECT u FROM UnidadAlmacenamiento u", UnidadAlmacenamiento.class).getResultList();
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(unidades));
        } finally {
            em.close();
        }
    }
}
