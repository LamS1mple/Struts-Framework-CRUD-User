package com.mkyong.common.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import antlr.collections.List;
import com.mkyong.common.form.UserForm;
import com.mysql.cj.xdevapi.PreparableStatement;

public class UserDAO {

	private Connection connection;
	
	public UserDAO() {

		connection = ConnectDB.connect();
		// TODO Auto-generated constructor stub
	}
	
	public java.util.List<UserForm> getAll(){
		java.util.List<UserForm> list = new ArrayList<UserForm>();
		System.out.println("1111111111111111111111111111111111111111111111111111");
		String query = "Select * from user";
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				UserForm userForm = new UserForm();
				userForm.setId(resultSet.getInt(1));
				userForm.setName(resultSet.getString(2));
				userForm.setPhoneNumber(resultSet.getString(3));
				userForm.setBirday(resultSet.getString(4));
				
				list.add(userForm);
				
			}
			return list;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
//		ResultSet resultSet = connection.
		
		
	}

	public void deleteUser(int id) {
		
		String query = "delete from user where id = ? ";
		try {
			PreparedStatement  preparableStatement = connection.prepareStatement(query);
			preparableStatement.setInt(1, id);
			int d = preparableStatement.executeUpdate();
			System.out.println("Xoa dong " + d );
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}

	public void addAndEditUser(UserForm userForm) {
		// TODO Auto-generated method stub
		String query ;
		System.out.println(userForm);
		try {
			PreparedStatement preparedStatement ;
			if (userForm.getId() == 0) {
				query = "insert into user (name, phone_number, birthday) values(?,?,?)";
				preparedStatement = connection.prepareStatement(query);

				
			}else {
				query = "update user set name=?, phone_number=?, birthday=? where id = ?";
				preparedStatement  = connection.prepareStatement(query);
				preparedStatement.setInt(4, userForm.getId());
			}

			preparedStatement.setString(1, userForm.getName());
			preparedStatement.setString(2, userForm.getPhoneNumber());
			preparedStatement.setString(3, userForm.getBirday());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public UserForm getUser(int id) {
		String query = "Select * from user where id = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				UserForm userForm = new UserForm();
				userForm.setId(resultSet.getInt(1));
				userForm.setName(resultSet.getString(2));
				userForm.setPhoneNumber(resultSet.getString(3));
				userForm.setBirday(resultSet.getString(4));
				
				return userForm;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
}
