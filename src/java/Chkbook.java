/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
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
public class Chkbook extends HttpServlet {

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
       
        HttpSession session = request.getSession(false);
       String user_email = (String) session.getAttribute("user_email");
       String user_name = (String) session.getAttribute("user_name");
       String bus_id = (String) session.getAttribute("bus_id");
       int seats = Integer.parseInt(request.getParameter("seats"));
       int ts =  (int) session.getAttribute("ts");
       int id = Integer.parseInt(bus_id);
       String amt = request.getParameter("amt");
       HttpSession hs = request.getSession(true);
        hs.setAttribute("amt", amt);
        hs.setAttribute("avai_seats", seats);
       int s = ts-seats;
       //out.print(user_email+" : "+user_name+" : "+bus_id+" : "+seats+" : "+amt+" : "+ts );
       
     try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
            Statement smt = cn.createStatement();
            int i= smt.executeUpdate("update Bus set total_seats = "+s+" where id = "+id);
            if(i>0){
                
                int j = smt.executeUpdate("insert into Book values('"+bus_id+"','"+user_name+"','"+user_email+"',"+seats+",'"+amt+"')");
                if(j>0){
            RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
            rd.forward(request, response);
                }
                else{
                out.print("<script>alert('Something Wen't wrong please try again !)</script>");
            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
            rd.include(request, response);
                }
            }
            else{
                out.print("<script>alert('Something Wen't wrong please try again !)</script>");
            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
            rd.include(request, response);
            }
            cn.close();
        }
        catch(ClassNotFoundException | SQLException e){
            out.print("<script>alert('Something Wen't wrong please try again !)</script>");
            RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
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
