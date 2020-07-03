/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.DAO;

import com.poly.model.product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author root
 */
public class productDAO extends connectdatabase {
    
    public List<product> fillProduct() {
        List<product> list = new ArrayList<product>();
        try {
            PreparedStatement ps = con.prepareStatement("select * from PRODUCT");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product ct = new product();
                ct.setIdp(rs.getString("idp"));
                ct.setName(rs.getNString("name"));
                ct.setPrice(rs.getString("price"));
                ct.setImage(rs.getString("image"));
                list.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<product> findProduct(String product) {
        List<product> list = new ArrayList<product>();

        try {
            if (product.isEmpty()) {
                product = "zz";
            }

            String sql = "SELECT * FROM PRODUCT where NAME like '%" + product + "%'";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product ct = new product();
                ct.setIdp(rs.getString("id"));
                ct.setName(rs.getString("name"));
                ct.setPrice(rs.getString("price"));
                ct.setImage(rs.getString("image"));
                list.add(ct);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean insertProduct(product contact) {
        boolean result = false;
        try {
            PreparedStatement ps = con.prepareStatement("insert into product(id,name,price,image) values(?,?,?,?)");
            ps.setString(1, contact.getIdp());
            ps.setString(2, contact.getName());
            ps.setString(3, contact.getPrice());
            ps.setString(4, contact.getImage());
            if (ps.executeUpdate() > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deleteProduct(String id1) {
        try {
            PreparedStatement ps = con.prepareStatement("delete product where id = '%" + id1 + "%'");
            ps.setString(1, id1);
            if (ps.executeUpdate() > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateProduct(product ct) {
        boolean result = false;
        try {
            PreparedStatement ps = con.prepareStatement("update product set id=?, name=?, price=? image=? where id=?");
            ps.setString(1, ct.getIdp());
            ps.setString(2, ct.getName());
            ps.setString(3, ct.getPrice());
            ps.setString(4, ct.getImage());

            if (ps.executeUpdate() > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
