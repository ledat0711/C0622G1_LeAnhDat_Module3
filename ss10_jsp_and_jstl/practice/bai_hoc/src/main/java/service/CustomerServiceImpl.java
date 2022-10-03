package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {
    private static Map<Integer, Customer> integerCustomerMap;

    static {
        integerCustomerMap = new HashMap<>();
        integerCustomerMap.put(1, new Customer(1, "Nguyen A", "nguyena123@gmail.com", "Da Nang"));
        integerCustomerMap.put(2, new Customer(2, "Tran Vinh", "tranvinh998@gmail.com", "Quang Nam"));
        integerCustomerMap.put(3, new Customer(3, "Le Minh", "leminh665@gmail.com", "Quang Ngai"));
        integerCustomerMap.put(4, new Customer(4, "Bui Tam", "buitam224@gmail.com", "Khanh Hoa"));
        integerCustomerMap.put(5, new Customer(5, "Trang Hoang", "tranghoang775@gmail.com", "Binh Dinh"));
    }

    @Override
    public List<Customer> findAll(){
        return new ArrayList<>(integerCustomerMap.values());
    }

    @Override
    public void save(Customer customer) {
        integerCustomerMap.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return integerCustomerMap.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        integerCustomerMap.put(id,customer);
    }
}
