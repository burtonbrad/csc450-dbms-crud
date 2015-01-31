/**
 * 
 */
package edu.georgetown.cs450.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author xbb
 * 
 */
public class Database {

  private Connection conn = null;

  /**
   * @return the conn
   */
  public final Connection getConn() {
    return conn;
  }

  /**
   * @param conn the conn to set
   */
  public final void setConn(Connection conn) {
    this.conn = conn;
  }

  public Database() {}

  public Connection connect() {

    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (ClassNotFoundException ex) {
      System.exit(1);
    } catch (InstantiationException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IllegalAccessException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }


    String url = "jdbc:mysql://localhost:3306/csc450?user=root&password=root";



    try {

      conn = DriverManager.getConnection(url);

      System.out.println("Connected to database");


    } catch (Exception e) {

      e.printStackTrace();

    }

    return conn;


  }

  public void disconnect() {
    try {
      conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {};

  }
  

}
