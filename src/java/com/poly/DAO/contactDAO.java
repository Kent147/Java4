/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.DAO;

import com.poly.model.contact;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author root
 */
public class contactDAO extends connectdatabase {

    public List<contact> findContact(String user) {
        List<contact> list = new ArrayList<contact>();

        try {
            if (user.isEmpty()) {
                user = "zz";
            }

            String sql = "SELECT * FROM USERS where USERNAME like '%" + user + "%'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contact ct = new contact();
                ct.setUsername(rs.getString("username"));
                ct.setId(rs.getInt("id"));
                ct.setPassword(rs.getString("password"));
                ct.setRepassword(rs.getString("vaitro"));
                list.add(ct);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public contact findById(int id) {
        contact ct = null;
        try {
            PreparedStatement ps = con.prepareStatement("select * from USERS where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ct = new contact();

                ct.setUsername(rs.getString("username"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ct;
    }

    public List<contact> fillAll() {
        List<contact> list = new ArrayList<contact>();
        try {
            PreparedStatement ps = con.prepareStatement("select * from USERS");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contact ct = new contact();
                ct.setId(rs.getInt("id"));
                ct.setUsername(rs.getString("username"));
                list.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertContact(contact contact) {
        boolean result = false;
        try {
            PreparedStatement ps = con.prepareStatement("insert into users(username,password,vaitro) values(?,?,?)");
            ps.setString(1, contact.getUsername());
            ps.setString(2, contact.getPassword());
            ps.setString(3, contact.getVaitro());
            if (ps.executeUpdate() > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deletecontact(int id) {
        try {
            PreparedStatement ps = con.prepareStatement("delete USERS where id = ?");
            ps.setInt(1, id);
            if (ps.executeUpdate() > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update(contact ct) {
        boolean result = false;
        try {
            PreparedStatement ps = con.prepareStatement("update USERS set username=?, password= ?, vaitro=? where id=?");
            ps.setString(1, ct.getUsername());
            ps.setString(2, ct.getPassword());
            ps.setInt(4, ct.getId());
            ps.setString(3, ct.getVaitro());

            if (ps.executeUpdate() > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean checklogin(String username, String password) {
        boolean result = false;
        try {
            PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return true;
        } catch (Exception e) {
        }
        return result;
    }
    public  boolean checkuser(String username, String password){
        try {
            PreparedStatement ps = con.prepareStatement("select * from users where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                boolean role = rs.getBoolean("vaitro");
                return  role;
            }else{
                return false;
            }
        } catch (Exception e) {
        }
        return false;
    }
}
