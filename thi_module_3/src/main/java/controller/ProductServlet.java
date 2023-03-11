package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServletProduct", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateProduct(request, response);
                break;
            case "update":
//                showUpdateCustomer(request, response);
                break;
            case "delete":
//                deleteCustomer(request, response);
                break;
            case "search":
//                searchCustomer(request,response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/product/createProduct.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
//                updateCustomer(request, response);
                break;
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String productName = request.getParameter("productName");
        Float price = Float.parseFloat(request.getParameter("price"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String category = request.getParameter("category");
        Product product = new Product(productName, price, quantity, color, category);

        productService.insertProduct(product);
        response.sendRedirect("/product");
//        try {
//
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.selectAllProduct();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("product/listProduct.jsp").forward(request, response);
    }
}
