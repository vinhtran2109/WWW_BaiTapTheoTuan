import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/registerStudent")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward to a registration form (e.g., registerStudent.jsp)
        req.getRequestDispatcher("registerStudent.jsp").forward(req, resp);
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pinCode = request.getParameter("pinCode");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        String[] hobbiesArray = request.getParameterValues("hobbies");
        List<String> hobbies = (hobbiesArray != null) ? Arrays.asList(hobbiesArray) : null;

        Student student = new Student(firstName, lastName, dateOfBirth, email, mobile,
                gender, address, city, pinCode, state, country, hobbies);

        request.setAttribute("student", student);

        // ✅ Chuyển sang trang kết quả
        request.getRequestDispatcher("registerStudent.jsp").forward(request, response);
    }

}