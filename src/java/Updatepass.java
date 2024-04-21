/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author DEVANSH GOYAL
 */
public class Updatepass extends HttpServlet {

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
      PrintWriter out = response.getWriter();
      String email=request.getParameter("mail");
      String pwd= request.getParameter("newpass");
      
      try{
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
         Statement smt = cn.createStatement();
         int i = smt.executeUpdate("UPDATE Agencies SET password = '" + pwd + "' WHERE email = '" + email + "'");

         if(i>0){
             
             
             out.print("<script>alert('Password Updated Successfully !')</script>");
           RequestDispatcher rd =request.getRequestDispatcher("index.html");
        rd.include(request, response);
        
        
         }
         else{
           out.print("<script>alert('Password Update Failed!')</script>");
        RequestDispatcher rd = request.getRequestDispatcher("index.html");
        rd.include(request, response);
         }
         cn.close();
      }
      catch(ClassNotFoundException | SQLException  e){
          out.print("<script>alert('Something Wen't Wrong! Please Try Again')</script>");
            RequestDispatcher rd = request.getRequestDispatcher("index.html");
            rd.include(request, response);
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
