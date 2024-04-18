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
import model.Categories;
import model.Products;

/**
 *
 * @author TT
 */
public class ProductsDAO extends DBContext {

    public List<Products> getAllProducts() {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM [dbo].[Products]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                // Populate Products object and add it to the list
                // (Similar to what you are doing in getProductById method)
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescribe(rs.getString("describe"));
                p.setImages(rs.getString("images"));
                p.setPrice(rs.getFloat("price"));
                Categories c = getCteCategorybyId(rs.getInt("cid"));
                p.setCategories(c);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> getProductById(int cid) {
        List<Products> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[images]\n"
                + "      ,[describe]\n"
                + "      ,[price]\n"
                + "      ,[cid]\n"
                + "  FROM [dbo].[Products]"
                + "  where cid= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImages(rs.getString("images"));
                p.setDescribe(rs.getString("describe"));
                p.setPrice(rs.getFloat("price"));
                Categories c = getCteCategorybyId(rs.getInt("cid"));
                p.setCategories(c);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public Products getProductsById(int id) {
        String sql = "SELECT * "
                + "  FROM [dbo].[Products]"
                + "  where id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImages(rs.getString("images"));
                p.setDescribe(rs.getString("describe"));
                p.setPrice(rs.getFloat("price"));
                Categories c = getCteCategorybyId(rs.getInt("cid"));
                p.setCategories(c);
                return p;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public Categories getCteCategorybyId(int id) {

        String sql = "select * from Categories where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Categories c = new Categories(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Products> search(String name) {
        List<Products> list = new ArrayList<>();
        String sql = "select * from Products where describe like '%" + name + "%'";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImages(rs.getString("images"));
                p.setDescribe(rs.getString("describe"));
                p.setPrice(rs.getFloat("price"));
                Categories c = getCteCategorybyId(rs.getInt("cid"));
                p.setCategories(c);
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean insert(Products p) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([name]\n"
                + "           ,[images]\n"
                + "           ,[describe]\n"
                + "           ,[price]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        boolean r = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getImages());
            st.setString(3, p.getDescribe());
            st.setFloat(4, p.getPrice());
            st.setInt(5, p.getCategories().getId());
            st.executeUpdate();
            r = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public boolean update(Products p) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [name] = ?\n"
                + "      ,[images] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";
        boolean r = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getName());
            st.setString(2, p.getImages());
            st.setString(3, p.getDescribe());
            st.setFloat(4, p.getPrice());
            st.setInt(5, p.getCategories().getId());
            st.setInt(6, p.getId());
            st.executeUpdate();
            r = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
}
