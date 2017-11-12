package User;

import Validation.LogInValidation;
import Validation.ValidationException;

import java.util.Observable;
import java.util.Observer;

/**
 * Created by msebestean on 19.05.2017.
 */
public class UserService implements Observer {
    private UserRepository userRepository;
    private User user;

    public UserService() {
        userRepository = new UserRepository();
    }

    public UserService(String username, String password, String type) {
        userRepository = new UserRepository();
        this.user = new User(username, password, type);
    }

    public String logIn(String username, String password, String type){
        user = userRepository.viewUser(username);
        if (user != null && user.getPassword().equals(password)){
            return user.getType();
        } else if ({
            return null;
        }
    }

    public void addUser(){
        userRepository.createUser(user);
    }

    public void deleteUser(){
        userRepository.deleteUser(user);
    }
}
