package pre.vote.dao;

import java.util.List;
import java.util.Map;

import pre.vote.model.User;

public interface UserDao {
   public int saveUser(User user);
   public String login(User user);
   public List<User> showUserAll();
   public int remove(User user);
   public int userCount();
   public List<User> showUserAllPage(Map map);
   public int modify(User user);
   public User findUserById(int id);
   public List<User> search(User user);


}
