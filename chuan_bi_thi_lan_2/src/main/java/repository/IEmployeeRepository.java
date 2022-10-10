package repository;

import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> showEmployeeList();
    void addEmployee(Employee employee);
    void deleteEmployee(int id);
    void editEmployee(Employee employee);
    Employee findById(int Id);
}
