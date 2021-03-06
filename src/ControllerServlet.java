import javax.servlet.http.*;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession();
        String x = request.getParameter("koordx");
        String r = request.getParameter("radius");
        String y = request.getParameter("koordy");
        System.out.println("Enter parameter:\nX:" + x + "\nY:" + y + "\nR:" + r);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (x == null || y == null || r == null) {
            request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            System.out.println("I'm Here");
            request.getServletContext().getRequestDispatcher("/check_area").forward(request, response);
        }
    }
}