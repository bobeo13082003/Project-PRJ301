/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categories;
import model.Products;

/**
 *
 * @author TT
 */
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("uid");
        int id;
        ProductsDAO dao = new ProductsDAO();
        try {
            id = Integer.parseInt(pid);
            Products products = dao.getProductsById(id);
            request.setAttribute("product", products);
        } catch (Exception e) {
        }
        request.getRequestDispatcher("view/update.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String images = request.getParameter("images");
        String describe = request.getParameter("describe");
        String price = request.getParameter("price");
        String idc = request.getParameter("categoryname");
        String idn = request.getParameter("uid");
        float newprice;
        int cid;
        int idp;
        ProductsDAO dao = new ProductsDAO();
        try {
            idp = Integer.parseInt(idn);
            newprice = Float.parseFloat(price);
            cid = Integer.parseInt(idc);
            Categories categories = new Categories();
            categories.setId(cid);
            Products products = new Products(idp, name, images, describe, newprice, categories);
            boolean update = dao.update(products);
            if (update == true) {
                request.setAttribute("succes", "Update Product Succesfully");
            } else {
                request.setAttribute("fail", "Update Failure");
            }
            request.getRequestDispatcher("view/update.jsp").forward(request, response);
            doGet(request, response);
        } catch (Exception e) {
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
