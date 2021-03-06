import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class AreaCheckServlet extends HttpServlet {
    //ArrayList<String> points = new ArrayList<>();
   // ArrayList<String> rows = new ArrayList<>();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println("I am in Checker");
        try (PrintWriter out = response.getWriter()) {
            long startTime = System.nanoTime();
            boolean flagX = false, flagY = false, flagR = false;
            double x = 0, y = 0, r = 0;
            try {
                x = Double.parseDouble(request.getParameter("koordx").replace(',', '.').trim());
                if (x < -3 || x > 3) {
                    out.println("X не входит в диапазон</br>");
                } else
                    flagX = true;
            } catch (NumberFormatException e) {
                out.println("X не число</br>");
            }

            try {
                y = Double.parseDouble(request.getParameter("koordy").replace(',', '.').trim());
                if (y < -3 || y > 3) {
                    out.println("Y не входит в диапазон</br>");
                } else
                    flagY = true;
            } catch (NumberFormatException e) {
                out.println("Y не число</br>");
            }

            try {
                r = Double.parseDouble(request.getParameter("radius").replace(',', '.').trim());
                if (r < 1 || r > 5) {
                    out.println("выберите R</br>");
                } else
                    flagR = true;
            } catch (NumberFormatException e) {
                out.println("R не число</br>");
            }

            long endTime = System.nanoTime();
            long runtime = (endTime - startTime)/100;
            out.println("все хорошо, ну почти");
            ArrayList<String> rows = (ArrayList<String>) request.getSession().getAttribute("rows");
            if (rows==null) rows = new ArrayList<>();
            ArrayList<String> points = (ArrayList<String>) request.getSession().getAttribute("points");
            if (points==null) points = new ArrayList<>();
            if (flagX && flagY && flagR) {
                System.out.println("все хорошо, доставай кусок таблички");
                Point point = new Point(x, y, r, runtime);
                points.add(point.getPoint());
                rows.add(point.getTableRow());
                request.getSession().setAttribute("point", point.getPoint());
                request.getSession().setAttribute("row", point.getTableRow());
                request.getSession().setAttribute("points", points);
                request.getSession().setAttribute("rows", rows);
                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/answer.jsp");
                dispatcher.forward(request, response);
                //request.getServletContext().getRequestDispatcher("/answer.jsp").forward(request, response);
                //request.getRequestDispatcher("/answer.jsp").forward(request, response);
                System.out.println("RRR");
                //response.setContentType("/answer.jsp");
                //System.out.println(rows);
            } else
                request.setAttribute("txt","<p>Incorrect input</p>" );
            doGet(request, response);
            //out.println("<p>Incorrect input</p>");
        }
    }
}
