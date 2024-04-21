/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DEVANSH GOYAL
 */
public class Addbus extends HttpServlet {
    
    
    
    /*
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
        HttpSession hs = request.getSession(false);
        String agency_name=(String)hs.getAttribute("agency_name");
        String agency_email=(String)hs.getAttribute("agency_email");
        String Bus_no=request.getParameter("Bus_no");
        String Bus_type = request.getParameter("Bus_type");
        String ts = request.getParameter("total_seats");
        int total_seats = Integer.parseInt(ts);
        String Driver_name = request.getParameter("Driver_name");
        String Driver_contact = request.getParameter("Driver_contact");
        String city_from = request.getParameter("city_from");
        String city_to = request.getParameter("city_to");
        String r =request.getParameter("rate");
        int rate = Integer.parseInt(r);
        
        String arr_date = request.getParameter("arr_date");
        String arr_time = request.getParameter("arr_time");
        String arr_day = request.getParameter("arr_day");
        
        
        
        String dep_date = request.getParameter("dep_date");
        String dep_time = request.getParameter("dep_time");
        String dep_day = request.getParameter("dep_day");
        
        
        
        
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
            Statement smt = cn.createStatement();
            int i = smt.executeUpdate("insert into bus(agency_name,Bus_no,Bus_type,Driver_name,Driver_contact,total_seats,city_from,city_to,dep_time,arr_time,rate,agency_email,arr_date,arr_day,dep_date,dep_day) values ('"+agency_name+"','"+Bus_no+"','"+Bus_type+"','"+Driver_name+"','"+Driver_contact+"',"+total_seats+",'"+city_from+"','"+city_to+"','"+dep_time+"','"+arr_time+"',"+rate+",'"+agency_email+"','"+arr_date+"','"+arr_day+"','"+dep_date+"','"+dep_day+"')");

            if(i>0){
                out.print("<script>alert('Bus added Successfully !')</script>");
                RequestDispatcher rd = request.getRequestDispatcher("showbus.jsp");
                rd.include(request, response);
            }
            cn.close();
        }
        catch(ClassNotFoundException | SQLException e){
            out.print("<script>alert('Something went wrong please try again!')</script>");
            RequestDispatcher rd = request.getRequestDispatcher("agencieshome.jsp");
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
