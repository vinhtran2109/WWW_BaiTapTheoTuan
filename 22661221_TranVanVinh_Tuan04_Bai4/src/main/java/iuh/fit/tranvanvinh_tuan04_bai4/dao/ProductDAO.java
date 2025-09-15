package iuh.fit.tranvanvinh_tuan04_bai4.dao;


import iuh.fit.tranvanvinh_tuan04_bai4.model.Product;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private DataSource dataSource;

    public ProductDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("ID"),
                        rs.getString("MODEL"),
                        rs.getString("DESCRIPTION"),
                        rs.getInt("QUANTITY"),
                        rs.getDouble("PRICE"),
                        rs.getString("IMGURL")
                );
                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE ID=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("ID"),
                            rs.getString("MODEL"),
                            rs.getString("DESCRIPTION"),
                            rs.getInt("QUANTITY"),
                            rs.getDouble("PRICE"),
                            rs.getString("IMGURL")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
