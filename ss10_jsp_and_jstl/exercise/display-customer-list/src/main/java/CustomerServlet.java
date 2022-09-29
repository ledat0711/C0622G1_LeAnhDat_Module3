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
        customerList.add(new Customer("Nguyễn A", LocalDate.parse("1995-08-09"), "Quảng Nam", "pictures/human_2.jpg"));
        customerList.add(new Customer("Nguyễn B", LocalDate.parse("1999-07-05"), "Quảng Nam", "pictures/human_1.jpg"));
        customerList.add(new Customer("Nguyễn V", LocalDate.parse("1998-10-09"), "Quảng Nam", "pictures/human_3.jpg"));
        customerList.add(new Customer("Nguyễn C", LocalDate.parse("2000-12-01"), "Quảng Nam", "pictures/human_4.jpg"));
        customerList.add(new Customer("Nguyễn D", LocalDate.parse("1997-04-09"), "Quảng Nam", "pictures/human_5.jpg"));
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

