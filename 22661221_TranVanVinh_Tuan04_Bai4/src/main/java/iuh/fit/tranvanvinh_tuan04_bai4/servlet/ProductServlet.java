package iuh.fit.tranvanvinh_tuan04_bai4.servlet;


import java.io.IOException;
import java.util.List;

import javax.sql.DataSource;

import iuh.fit.tranvanvinh_tuan04_bai4.dao.ProductDAO;
import iuh.fit.tranvanvinh_tuan04_bai4.model.Product;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/danhsach", "/chitietsach"})
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Resource(name="jdbc/bookdb")
    private DataSource dataSource;

    @Override
    public void init() {
        productDAO = new ProductDAO(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");

        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Product product = productDAO.getProductById(id);
            if (product != null) {
                req.setAttribute("product", product);
                req.getRequestDispatcher("/chitietsach.jsp").forward(req, resp);
                return;
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }
        }

        List<Product> products = productDAO.getAllProducts();
        req.setAttribute("books", products);
        req.getRequestDispatcher("/danhsach.jsp").forward(req, resp);
    }
}
