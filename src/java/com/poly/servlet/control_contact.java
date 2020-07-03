/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.servlet;

import com.poly.DAO.contactDAO;
import com.poly.model.contact;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author root
 */
public class control_contact extends HttpServlet {

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
        try {
            if (request.getParameter("btlogin").equals("login")) {
                String username = request.getParameter("txtusername");
                String password = request.getParameter("txtpassword");
                contactDAO contact = new contactDAO();
                System.out.println(username);
                System.out.println(password);
                boolean result = contact.checklogin(username, password);
                String url = "login.jsp";
                if (result) {
                    
                    HttpSession session = request.getSession(true);
                    session.setAttribute("USER", username);
                    url = "index.jsp";
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (request.getParameter("btlogin").equals("tryAgain")) {
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            } else if (request.getParameter("btlogin").equals("register")) {
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
        }
        //User + product
        try {
            String user = request.getParameter("txtuser");
            String password = request.getParameter("txtpass");
            String vaitro = request.getParameter("radio");
            String action = request.getParameter("action");
            String id = request.getParameter("id");
            

            if (action.equals("Search")) {
                contactDAO contact = new contactDAO();
                List<contact> list = contact.findContact(user);
                request.getSession().setAttribute("ListUsers", list);
                response.sendRedirect("indexadmin.jsp");

            } else if (action.equals("delete")) {
                contactDAO ct = new contactDAO();
                int id1 = Integer.parseInt(id);
                System.out.println("ID xoa: " + id1);
                ct.deletecontact(id1);
                loadlist(request, response);

            } else if (action.equals("Add")) {
                contactDAO contactDao = new contactDAO();
                contact ct = new contact();
                ct.setUsername(user);
                ct.setPassword(password);
                ct.setVaitro(vaitro);
                contactDao.insertContact(ct);
                loadlist(request, response);

            } else if (action.equals("Edit")) {
                contactDAO contactDao = new contactDAO();
                contact ct = new contact();
                ct.setUsername(user);
                ct.setPassword(password);
                ct.setVaitro(vaitro);
                ct.setId(Integer.parseInt(id));
                contactDao.update(ct);
                loadlist(request, response);
            }
          
        } catch (Exception e) {
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

    private void loadlist(HttpServletRequest request, HttpServletResponse response) throws IOException {
        contactDAO contact = new contactDAO();
        List<contact> list = contact.fillAll();
        request.getSession().setAttribute("ListUsers", list);
        response.sendRedirect("indexadmin.jsp");
    }
}
