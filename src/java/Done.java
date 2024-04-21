/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
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
public class Done extends HttpServlet {

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
        /*
        HttpSession hs = request.getSession(true);
            hs.setAttribute("bc", bc);
            hs.setAttribute("bt", bt);
            hs.setAttribute("dc", dc);
            hs.setAttribute("seattt", seattt);
        */
        try{
            HttpSession session = request.getSession(false);
    String user_email = (String) session.getAttribute("user_email");
    String user_name = (String) session.getAttribute("user_name");
    String bc = (String) session.getAttribute("bc");
    String bt = (String) session.getAttribute("bt");
    String dc = (String) session.getAttribute("dc");
    String seattt = (String) session.getAttribute("seattt");
    
    String sub = "Quick Seats :  Happy Journey";
   
    // Proper concatenation of email into the URL
    String msg = "Dear "+user_name+" Thank you for booking tickets on quik seats . Your boarding details are Boarding City : "+bc+", Boarding Time : "+bt+". Seats Alloted : "+seattt+". For any Queries feel free to contact your Driver  "+dc;
    Mailer.send(user_email, sub, msg);
    RequestDispatcher rd = request.getRequestDispatcher("userhome.jsp");
    rd.forward(request, response);
    }
    catch(Exception e){
            out.print("<script>alert('Something Wen't Wrong! Please Try Again')</script>");
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
