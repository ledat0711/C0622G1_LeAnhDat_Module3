package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
List<Customer> selectAllCustomer();
Customer selectCustomer(int id);
void insertCustomer(Customer customer);
boolean deleteCustomer(int id);
boolean updateCustomer(Customer customer);
List<Customer> searchByName(String keyName, String keyAddress);

}
