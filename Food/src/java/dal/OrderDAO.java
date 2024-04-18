/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Accounts;
import model.Cart;
import model.Items;

/**
 *
 * @author TT
 */
public class OrderDAO extends DBContext {

    public void addOrder(Accounts a, Cart cart) {
        LocalDate cDate = LocalDate.now();
        String date = cDate.toString();
        try {
            //Add Order
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([date]\n"
                    + "           ,[totalmoney]\n"
                    + "           ,[aid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setDouble(2, cart.getTotalMoney());
            st.setInt(3, a.getId());
            st.executeUpdate();
            // get id of order add new
            String sql1 = "select TOP 1 id from orders order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //insert on orderdetails
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Items items : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([oid]\n"
                            + "           ,[pid]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, items.getProducts().getId());
                    st2.setInt(3, items.getQuantity());
                    st2.setDouble(4, items.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
        }
    }

}
