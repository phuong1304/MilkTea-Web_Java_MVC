
package controllerProduct;

import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProductController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String id = request.getParameter("txt_id");
            String pname = request.getParameter("txt_pname");
            String price = request.getParameter("txt_price");
            
            String status = request.getParameter("txt_status");
            
            String search = request.getParameter("txt_search");
            
            
//            DAOProduct.ToolProduct.updateProduct(pname, price, imagePath, status, id);
            boolean ok = DAOProduct.ToolProduct.updateProduct(status, id);
            if (ok )
                request.setAttribute("status", "UPDATE PRODUCT SUCCESSFULLY");
            else
                request.setAttribute("status", "UPDATE PRODUCT ERROR");
            
            request.getRequestDispatcher("ProductController").forward(request, response);
        }
        catch (Exception e) {
            
        
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
