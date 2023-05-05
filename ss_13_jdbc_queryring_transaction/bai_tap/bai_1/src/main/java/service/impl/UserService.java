package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();


    @Override
    public boolean saveUser(User user) {
        return iUserRepository.saveUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> getAllUsers() {
        List<User> userList = iUserRepository.getAllUser();
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public boolean editUser(User user) {
        return iUserRepository.updateUser(user);
    }

    @Override
    public List<User> search(String name) {
        List<User> userList = iUserRepository.searchUser(name);
        return userList;
    }

    @Override
    public List<User> sortUser() {
        List<User> userList = iUserRepository.sortUser();
        return userList;
    }

    @Override
    public boolean addUser(User user) {
        return iUserRepository.addUserTransaction(user);
    }
}
