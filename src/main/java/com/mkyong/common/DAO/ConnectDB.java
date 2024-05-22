package com.mkyong.common.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	
	 	

	    public static  Connection connect(){
	    	  String hostName = "localhost:3306";
		      String dbName = "monstar";
		      String username = "root";
		      String password = "lam2002";
		    
		      String connectionURL = "jdbc:mysql://" + hostName + "/"+dbName;
	        //Tạo đối tượng Connection
	        Connection conn = null;

	        try {
				Class.forName("com.mysql.jdbc.Driver");

	            conn = DriverManager.getConnection(connectionURL, username, password);
	            System.out.println("success");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return conn;
	    }
	    public static void main(String[] args) {
			ConnectDB.connect();
		}

}
