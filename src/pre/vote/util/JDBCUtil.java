package pre.vote.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {
	
	 public static final  String DIRVER="com.mysql.jdbc.Driver";
	  public static final String URL="jdbc:mysql://127.0.0.1:3306/user";
	  public static final String USER="root";
	  public static final String PASSWORD="123456";

	/**
	 */
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(DIRVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	/**
	 * @param con
	 * @param stmt
	 * @param rs
	 */
	
	public static void closeResource(Connection con, PreparedStatement psment,Statement stmt,
			ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if(psment!=null){
				psment.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null && !con.isClosed()) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeResource(Connection con,PreparedStatement psment, Statement stmt) {
		try {
			if(psment!=null){
				psment.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null && !con.isClosed()) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
