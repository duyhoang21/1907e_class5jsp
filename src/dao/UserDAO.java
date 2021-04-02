package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.User;

public class UserDAO {
	private String jdbcURL = "jdbc:sqlserver://localhost;databaseName=crudServlet";
    private String jdbcUsername = "sa";
    private String jdbcPassword = "12345678";
    
    private static final String SELECT_ALL_USERS = "SELECT * FROM Users";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM Users WHERE id = ?";
    private static final String INSERT_NEW_USER = "INSERT INTO Users(name,email,country) VALUES(?,?,?)";
    private static final String UPDATE_USER = "UPDATE Users SET name = ?, email = ?, country = ? WHERE id = ?";
    private static final String DELETE_USER = "DELETE FROM Users WHERE id = ?";
    
    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        return connection;
    }
    
    protected void closeConnection(Connection connection) throws SQLException {
        if(connection != null)
            connection.close();
    }
    
    public void insertUser(User user) throws ClassNotFoundException, SQLException {
        Connection connection = getConnection();
        PreparedStatement pstmt = connection.prepareCall(INSERT_NEW_USER);
        
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getEmail());
        pstmt.setString(3, user.getCountry());
        
        pstmt.executeUpdate();
        pstmt.close();
        closeConnection(connection);
    }
}
