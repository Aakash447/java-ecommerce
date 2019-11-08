package accounts;

import java.sql.*;  

public class LoginDAO {  
	static Connection con=null;
public static boolean validate(String email,String password) throws SQLException{  
boolean status=false;  
try{  

con=Connect_db.getConnection();

 
PreparedStatement ps=con.prepareStatement(  
"select * from register where email=? and password=?");  
ps.setString(1,email);  
ps.setString(2,password);  
      
ResultSet rs=ps.executeQuery();  
status=rs.next();  


}catch(Exception e){System.out.println(e);} 

   

return status; 


}  


}  