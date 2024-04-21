/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.text.SimpleDateFormat;
import java.util.Date;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DEVANSH GOYAL
 */
public class Delbus extends HttpServlet {

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
        
        Date currentDate = new Date();
        SimpleDateFormat htmlDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentHtmlDate = htmlDateFormat.format(currentDate);
        
        Date currentTime = new Date();
        SimpleDateFormat htmlTimeFormat = new SimpleDateFormat("HH:mm:ss");
        String currentHtmlTime = htmlTimeFormat.format(currentTime);
        
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
        Statement smt = cn.createStatement();
       ResultSet rs = smt.executeQuery("select * from Bus");
        while(rs.next()){
        int id = rs.getInt("id");
        
        
        String anotherHtmlDate = rs.getString("dep_date"); // Example: Another HTML date
        int comparisonResult = currentHtmlDate.compareTo(anotherHtmlDate);
        
        // Output the result
         if (comparisonResult > 0) {
            int i = smt.executeUpdate("delete from Bus where id = "+id);
            int j= smt.executeUpdate("delete from Book where id = "+id);
            
        } 
         else if(comparisonResult ==0) {
           
            String anotherHtmlTime = rs.getString("dep_time"); // Example: Another HTML time
            int comparisonResult2 = currentHtmlTime.compareTo(anotherHtmlTime);
        
    
         if (comparisonResult2 >= 0) {
            int i = smt.executeUpdate("delete from Bus where id = "+id);
            int j= smt.executeUpdate("delete from Book where id = "+id);
            } 
        
        }
        
        
        
        }
        cn.close();
        RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
        rd.forward(request, response);
           
        }
        catch(Exception e){
        RequestDispatcher rd = request.getRequestDispatcher("user.html");
                rd.forward(request, response);
            
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
