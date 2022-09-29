import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")

public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Nguyễn A", LocalDate.parse("1994-11-07"), "Quảng Nam", "pictures/human_2.jpg"));
        customerList.add(new Customer("Nguyễn A", LocalDate.parse("1994-11-07"), "Quảng Nam", "pictures/human_1.jpg"));
        customerList.add(new Customer("Nguyễn A", LocalDate.parse("1994-11-07"), "Quảng Nam", "pictures/human_3.jpg"));
        customerList.add(new Customer("Nguyễn A", LocalDate.parse("1994-11-07"), "Quảng Nam", "pictures/human_4.jpg"));
        customerList.add(new Customer("Nguyễn A", LocalDate.parse("1994-11-07"), "Quảng Nam", "pictures/human_5.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        requestDispatcher.forward(request, response);
    }
}

