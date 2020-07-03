/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author root
 */
public class connectdatabase {
    protected Connection con;

    public connectdatabase() {
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName=QLuser";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, "sa", "123456");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
