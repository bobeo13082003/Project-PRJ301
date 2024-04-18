/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.ProductDetail;
import model.Products;

/**
 *
 * @author TT
 */
public class ProductDetalDAO extends DBContext {

    public ProductDetail getProductById(int pid) {
        String sql = "select * from Products p join ProductDetail d\n"
                + "on p.id = d.pid where d.pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImages(rs.getString("images"));
                p.setDescribe(rs.getString("describe"));
                p.setPrice(rs.getFloat("price"));
                ProductDetail d = new ProductDetail();
                d.setDescription(rs.getString("description"));
                d.setProducts(p);
                return d;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
