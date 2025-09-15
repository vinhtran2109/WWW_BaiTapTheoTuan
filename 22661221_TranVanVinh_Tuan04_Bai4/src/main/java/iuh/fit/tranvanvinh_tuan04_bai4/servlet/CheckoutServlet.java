package iuh.fit.tranvanvinh_tuan04_bai4.servlet;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/processCheckout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname");
        String address = req.getParameter("address");
        String payment = req.getParameter("payment");


        req.setAttribute("message", "Thank you, " + fullname + ". Your order has been received.");
        req.getSession().removeAttribute("cart"); // Xóa giỏ hàng sau khi thanh toán
        req.getRequestDispatcher("thanhtoan.jsp").forward(req, resp);
    }
}
