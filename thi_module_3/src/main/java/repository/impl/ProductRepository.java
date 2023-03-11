package repository.impl;

import connection.DBConnect;
import model.Product;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String SELECT_ALL_PRODUCT = "  select * from product; ";
    private static final String DELETE_PRODUCT = " delete from product where id =? ";
    private static final String INSERT_INTO_PRODUCT = " INSERT INTO product (`name`,price,quantity,color,category) VALUES (?,?,?,?,?) ";
    private static final String UPDATE_PRODUCT = " update product set `name`=?,price=?,quantity=?,color=?,category=? ";
    private static final String SELECT_PRODUCT = " select * from product where id = ? ";
    private static final String SEARCH_PRODUCT = " select * from product where `name` like ?";

    @Override
    public List<Product> selectAllProduct() {
        Connection connection = DBConnect.getConnectDB(); //câu lệnh để kêt nối data
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Float price = resultSet.getFloat("price");
                Integer quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String category = resultSet.getString("category");
                Product product = new Product(id, name, price, quantity, color, category);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public Product selectProduct(int id) {
        return null;
    }

    @Override
    public void insertProduct(Product product) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_PRODUCT);
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setFloat(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getCategory());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public boolean deleteProduct(int id) {
        return false;
    }

    @Override
    public boolean updateProduct(Product product) {
        return false;
    }

    @Override
    public List<Product> searchByName(String keyName, String keyAddress) {
        return null;
    }
}
