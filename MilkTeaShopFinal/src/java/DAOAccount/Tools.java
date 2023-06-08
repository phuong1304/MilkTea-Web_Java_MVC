/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOAccount;

import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import lib.DBUtils;

/**
 *
 * @author Admin
 */
public class Tools {

    public static Account getAccount(String username, String password) throws Exception {
        Connection cn = DBUtils.makeConnection();
        Account a = null;

        String sql = "select id, username, password, fullname, phone, address, role, status\n"
                + "from tblAccount\n"
                + "where username = ? and password = ?";
        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, username); // Set giá trị vào ? trong query
        st.setString(2, password);

        try {
            ResultSet r = st.executeQuery(); //Chạy query và lưu kết quả vào r

            while (r.next()) {
                a = new Account(r.getString(1), r.getString(2), r.getString(3),
                        r.getString(4), r.getString(5), r.getString(6),
                        r.getString(7), r.getString(8)); //nếu giá trị r =! tạo account mới lưu vào trong list
            }
        } catch (Exception e) {

        } finally {
            cn.close();
        }
        return a;

    }

    public static boolean createUserAccount(Account a) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int row = 0;

        String sql = "insert into tblAccount( username, password, fullname, phone, address)\n"
                + "values (?,?,?,?,?)";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, a.getUsername()); // Set giá trị vào ? trong query
        st.setString(2, a.getPassword());
        st.setString(3, a.getFullname());
        st.setString(4, a.getPhone());
        st.setString(5, a.getAddress());

        try {
            row = st.executeUpdate();

        } catch (Exception e) {
            row = 0;
        } finally {
            cn.close();
        }
        return row > 0;

    }

    public static ArrayList<Account> getAllAccount(String search) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (search == null) {
            search = "";
        }

        ArrayList<Account> list = null;

        String sql = "select *\n"
                + "from tblAccount\n"
                + "where fullname like ?";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, "%" + search + "%"); // Set giá trị vào ? trong query

        try {
            ResultSet r = st.executeQuery(); //Chạy query và lưu kết quả vào r
            list = new ArrayList<>();

            while (r.next()) {
                Account a = new Account(r.getString(1), r.getString(2), r.getString(3),
                        r.getString(4), r.getString(5), r.getString(6),
                        r.getString(7), r.getString(8)); //nếu giá trị r =! tạo account mới lưu vào trong list
                list.add(a);
            }
        } catch (Exception e) {
            list = null;

        } finally {
            cn.close();
        }
        return list;

    }

    public static boolean updateAccount(String id, String role, String status) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int row = 0;

        String sql = "update tblAccount\n"
                + "set role = ?, status = ?\n"
                + "where id = ?";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, role);
        st.setString(2, status);
        st.setString(3, id);

        try {
            row = st.executeUpdate();

        } catch (Exception e) {
            row = 0;
        } finally {
            cn.close();
        }
        return row > 0;

    }
    
    public static boolean deleteAccount(String id) throws SQLException {
       boolean result = false;
       Connection cn = null;
       PreparedStatement ptm = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql ="Delete tblAccount WHERE id = ?";
                ptm = cn.prepareStatement(sql);
                ptm.setString(1, id);
                int count = ptm.executeUpdate();
                if(count > 0){
                    result = true;
                }              
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(ptm != null) ptm.close();
            if(cn != null) cn.close();
        }
       return result;
    }
     
}
