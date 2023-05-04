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
        List<User>userList=iUserRepository.getAllUser();
        for (int i = 0; i < userList.size(); i++) {
            if (id==userList.get(i).getId()){
                return userList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<User> getAllUsers() {
        List<User>userList =iUserRepository.getAllUser();
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        return  iUserRepository.deleteUser(id);
    }

    @Override
    public boolean editUser(User user) {
        return iUserRepository.updateUser(user);
    }
}
