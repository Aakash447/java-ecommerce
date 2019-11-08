package accounts;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connect_db {   
	
	static String DBURL="jdbc:mysql://localhost:3306/ecom?serverTimezone=UTC";
	static String DBusername="root";
	static String DBpassword ="";

    static Connection con=null;
    public static Connection getConnection()
    {
        if (con != null){ 
     
        	return con;
        	}
        // get db, user, pass from settings file
        
        return getConnection(DBURL, DBusername, DBpassword);
    }

    private static Connection getConnection(String db_name,String user_name,String password)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection(DBURL,DBusername,DBpassword);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

        return con;        
    }
}