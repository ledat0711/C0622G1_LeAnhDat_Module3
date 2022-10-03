package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {

    // Tra ve danh sach tat ca cac khach hang
    List<Customer> findAll();

    //save: New mot khach hang (them moi)
    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);
}
