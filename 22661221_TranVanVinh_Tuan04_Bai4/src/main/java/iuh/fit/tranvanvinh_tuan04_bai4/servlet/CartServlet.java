package iuh.fit.tranvanvinh_tuan04_bai4.servlet;

import iuh.fit.tranvanvinh_tuan04_bai4.dao.ProductDAO;
import iuh.fit.tranvanvinh_tuan04_bai4.model.CartBean;
import iuh.fit.tranvanvinh_tuan04_bai4.model.Product;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.sql.DataSource;  // chú ý import datasource đúng package!

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Resource(name="jdbc/bookdb")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("giohang.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        CartBean cart = (CartBean) session.getAttribute("cart");
        if (cart == null) {
            cart = new CartBean();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Product p = productDAO.getProductById(id);
                if(p != null) {
                    cart.addProduct(p);
                }
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("productId"));
                int quantity = Integer.parseInt(req.getParameter("quantity"));
                cart.updateQuantity(id, quantity);
            } else if ("remove".equals(action)) {
                int id = Integer.parseInt(req.getParameter("productId"));
                cart.removeProduct(id);
            } else if ("clear".equals(action)) {
                cart.clear();
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        resp.sendRedirect("cart");
    }
}
