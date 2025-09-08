package dao;

import model.Account;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountUtil {
    private DataSource dataSource;

    public AccountUtil(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Lấy danh sách account
    public List<Account> getAccounts() throws Exception {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM accounts ORDER BY id";

        try (Connection conn = dataSource.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Account acc = new Account(
                        rs.getString("FIRSTNAME"),
                        rs.getString("LASTNAME"),
                        rs.getString("EMAIL"),
                        rs.getString("PASSWORD"),
                        rs.getDate("DATEOFBIRTH")
                );
                acc.setId(rs.getInt("ID"));
                accounts.add(acc);
            }
        }
        return accounts;
    }

    // Thêm account mới
    public void addAccount(Account acc) throws Exception {
        String sql = "INSERT INTO accounts (firstname, lastname, email, password, dateofbirth) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, acc.getFirstname());
            ps.setString(2, acc.getLastname());
            ps.setString(3, acc.getEmail());
            ps.setString(4, acc.getPassword());
            ps.setDate(5, new java.sql.Date(acc.getDateOfBirth().getTime()));

            ps.executeUpdate();
        }
    }
}
