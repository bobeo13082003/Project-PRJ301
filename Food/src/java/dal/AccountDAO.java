/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Accounts;

/**
 *
 * @author TT
 */
public class AccountDAO extends DBContext {

    public Accounts getAccount(String username, String password) {
        String sql = "select * from Account\n"
                + "where username = ? and password = ?";
        Accounts accounts;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                boolean role = rs.getBoolean("role");
                accounts = new Accounts(id, username, password, firstname, lastname, phone, address, role);
                return accounts;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Accounts getAccountById(int id) {
        String sql = "select * from Account\n"
                + "where id = ?";
        Accounts a;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                a = new Accounts();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setFirstname(rs.getString("firstname"));
                a.setLastname(rs.getString("lastname"));
                a.setPhone(rs.getString("phone"));
                a.setAddress(rs.getString("address"));
                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean register(Accounts account) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[firstname]\n"
                + "           ,[lastname]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        boolean result = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getFirstname());
            st.setString(4, account.getLastname());
            st.setString(5, account.getPhone());
            st.setString(6, account.getAddress());
            st.setBoolean(7, account.isRole());
            st.executeUpdate();
            result = true;
        } catch (SQLException e) {
        }
        return result;
    }

    public boolean changeProfile(Accounts a) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      [password] = ?\n"
                + "      ,[firstname] = ?\n"
                + "      ,[lastname] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[address] = ?\n"
                + "\n"
                + " WHERE id = ?";
        boolean result = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getFirstname());
            st.setString(3, a.getLastname());
            st.setString(4, a.getPhone());
            st.setString(5, a.getAddress());
            st.setInt(6, a.getId());
            st.executeUpdate();
            result = true;
        } catch (SQLException e) {
        }
        return result;
    }

}
