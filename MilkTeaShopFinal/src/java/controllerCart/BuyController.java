/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllerCart;

import Model.Account;
import Model.Cart;
import Model.Order;
import java.io.IOException;
import java.io.PrintWriter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class BuyController extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     
            HttpSession s = request.getSession();
            Cart cart = (Cart)s.getAttribute("cart");
            String username = request.getParameter("txt_username");
            
            if(username.length() >0){
                String description="";
            
            LocalDateTime c = LocalDateTime.now();  // lay thoi gian tai thoi diem bam nut BUY
             
            for(String id: cart.getItem())
                 description +=String.format("%d", cart.getQuantity(id)) + "-" + id + ","; //ép kiểu %d cho id thành số và format : "số lượng - id Sản phẩm"
                 
                 
            Account loginUser =(Account)s.getAttribute("login_user"); // chi 1 Account/ shopping khac nhau
            String total = request.getParameter("txt_total");
            
            Order order = new Order("",loginUser.getId() , description, c.toString() , total, "1");
            boolean ok = DAOOrder.OrderTool.createOrder(order); // Kiem tra co Order trong sql hay chua
            
            if(ok){
                request.setAttribute("status", "BUY SUCCESSFULLY");
                s.setAttribute("cart", new Cart()); // An nut Buy thi tao Cart moi
            }
            else {
                request.setAttribute("status", "BUY ERROR");
            }
            
            request.getRequestDispatcher("ShowCartController").forward(request, response);
            } else{
                request.setAttribute("message", "YOU MUST LOGIN OR SIGN IN TO BUY!!");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        }catch (Exception e){
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
