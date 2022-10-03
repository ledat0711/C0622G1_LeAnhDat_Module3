package controller;

import model.Customer;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService customerServive = new CustomerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                break;
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response){};
    private void updateCustomer(HttpServletRequest request, HttpServletResponse response){};
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response){};
}
