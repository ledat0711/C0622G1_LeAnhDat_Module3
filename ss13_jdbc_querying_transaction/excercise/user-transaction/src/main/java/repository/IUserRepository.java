package repository;

import model.User;

import java.util.List;

public interface IUserRepository {

    List<User> selectAllUsers();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> findByCountry(String country);

    List<User> sortUserByName();

    User getUserById(int id);

    void insertUserStore(User user);

    void addUserTransaction(User user, int[] permissions);

    void insertUpdateWithoutTransaction();

    void insertUpdateUseTransaction();
}
