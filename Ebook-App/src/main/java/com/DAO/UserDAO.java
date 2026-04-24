package com.DAO;
import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us);
	
	public User login(String email, String password);
	
	public boolean updateProfile(String name, String email, String phno, String password);
	
	public boolean checkUser(String email);

}
