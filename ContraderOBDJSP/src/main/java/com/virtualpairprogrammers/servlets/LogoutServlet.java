package com.virtualpairprogrammers.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutServlet extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String scelta=request.getParameter("bott");

        switch (scelta)
        {
            case "Logout":
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("view","index.jsp");
                session.setAttribute("role",null);
                session.setAttribute("id",null);
                MainDispatcherServlet.getInstance(request).callView(request,response);
            }
            break;
        }
    }
}


