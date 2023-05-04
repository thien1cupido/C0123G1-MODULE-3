package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getAllUser();

    boolean saveUser(User user);

    boolean deleteUser(int id);

    boolean updateUser(User user);
}
