package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {

    boolean saveUser(User user);

    User selectUser(int id);

    List<User> getAllUsers();

    boolean deleteUser(int id);

    boolean editUser(User user);

    List<User> search(String name);

    List<User> sortUser();
}

