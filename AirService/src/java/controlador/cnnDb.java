/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jsalguero
 */
public class cnnDb {

    public static void main(String[] args) throws Exception {
        getCnn();
    }

    public static Connection getCnn() {
        try {
            String driver = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/airservice";
            String user = "root";
            String password = "081284";

            Class.forName(driver);
            Connection cnn = DriverManager.getConnection(url, user, password);
            System.out.println("Conectado a MySQL");
            return cnn;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
