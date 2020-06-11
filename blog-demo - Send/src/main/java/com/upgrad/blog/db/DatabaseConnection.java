package com.upgrad.blog.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * TODO 6.2: Implement the DatabaseConnection class using the Singleton Pattern (Hint. Should have the 
 * private no-arg constructor).
 * TODO 6.3: The getInstance() method should create a connection object which is
 * connected with the local database and return this connection object.
 * TODO 6.4: You should handle the ClassNotFoundException and SQLException individually,
 * and not using the Exception class.
 */
public class DatabaseConnection {

    private static Connection connect;
    private static DatabaseConnection instance;


    private DatabaseConnection(){

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql:// localhost:3306/ruchit","root","root");
        }
        catch(SQLException e)
        {
            System.out.println(e.getStackTrace());
        }

        catch(ClassNotFoundException e)
        {
            System.out.println(e.getStackTrace());
        }
    }

    public static DatabaseConnection getConnection(){
        if(instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    public static void main(String[] args) throws SQLException,ClassNotFoundException {
        try {
        	DatabaseConnection.getConnection();
        	System.out.println("Connected");
        } catch (Exception e) {
        	System.out.println("Not Connected");
        }
    }
}
