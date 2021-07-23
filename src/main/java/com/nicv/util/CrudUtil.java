package com.nicv.util;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CrudUtil {

	
	public static PreparedStatement getPreparedStatement(String sql, Object... param) throws  Exception {
        Connection connection = DBConnection.getDBInstance().getConnection();
        PreparedStatement pstm = connection.prepareStatement(sql);

        for (int i = 0; i < param.length; i++) {
            pstm.setObject(i + 1, param[i]);

        }
        return pstm;
    }

    public static boolean executeUpdate(String sql, Object... para) throws  Exception {
        return getPreparedStatement(sql, para).executeUpdate() > 0;
    }

    public static ResultSet executeQuery(String sql, Object... para) throws  Exception {
        return getPreparedStatement(sql, para).executeQuery();
    }
	
}
