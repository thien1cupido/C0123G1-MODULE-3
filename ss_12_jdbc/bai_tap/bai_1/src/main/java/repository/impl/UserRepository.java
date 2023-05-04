package repository.impl;

import connection.BaseRepository;
import model.User;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL ="select*from users;";
    @Override
    public List<User> getAllUser() {
        List<User> userList =new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id =resultSet.getInt("id");
                String name =resultSet.getString("name");
                String email =resultSet.getString("email");
                String country =resultSet.getString("country");
                userList.add(new User(id,name,email,country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }
}
