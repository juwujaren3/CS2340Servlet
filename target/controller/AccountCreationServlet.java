package controller;

import model.AccountForm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AccountCreationServlet", urlPatterns = {"/createAccount"})
public class AccountCreationServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.sendRedirect("jsp/create_account.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        if (request.getParameter("submitButton") != null) {
            AccountForm accountForm = new AccountForm(request);
            if (accountForm.isAccountCreationSuccessful()) {
                response.sendRedirect("jsp/login.jsp");
            } else {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/jsp/create_account.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
