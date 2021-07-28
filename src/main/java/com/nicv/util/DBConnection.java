package com.nicv.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

	private static DBConnection dBConnection;
	private Connection connection;

	private static final String P_WORD = "user_nic_mng";
	private static final String USER = "user_nic_mng";
	private static final String SERVER = "www.db4free.net";
	private static final String PORT = "3306";
	private static final String DATABASE = "user_nic_mng_db";
	private static final String OPTIONS = "?characterEncoding=utf8";

	private DBConnection() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
//	            for localhost database
//	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_db", "root", "1234");

			connection = DriverManager.getConnection("jdbc:mysql://"+SERVER+":" + PORT + "/" + DATABASE + OPTIONS, USER, P_WORD);

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
