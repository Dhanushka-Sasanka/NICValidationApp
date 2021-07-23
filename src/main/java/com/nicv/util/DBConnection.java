package com.nicv.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {
	
	 private static DBConnection dBConnection;
	    private Connection connection;

	    private  DBConnection() {
	        try {
				
	            Class.forName("com.mysql.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "1234");
	            
	        } catch (SQLException ex) {
	            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
	        } catch (ClassNotFoundException ex) {
	            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }

	    public static DBConnection getDBInstance() {
	        if (dBConnection == null) {
	            dBConnection = new DBConnection();
	        }
	        return dBConnection;
	    }

	    public Connection getConnection() {
	        return connection;
	    }

}