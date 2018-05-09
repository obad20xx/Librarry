/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.sql.*;
import javax.swing.JOptionPane;

public class Connect {
    //String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
    public static Connection connect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");  
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","");
        return con;
        }
        catch(Exception e){
            JOptionPane.showConfirmDialog(null, e);
        }
        return null;
    }
    
}
