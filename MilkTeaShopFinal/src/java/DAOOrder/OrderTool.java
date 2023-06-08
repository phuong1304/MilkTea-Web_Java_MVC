/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOOrder;

import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import lib.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderTool {

    public static boolean createOrder(Order order) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int row = 0;
        String sql = "insert into tblOrder( aid, description, createDate, total)\n"
                + "values (?,?,?,?)";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, order.getAid()); // Set giá trị vào ? trong query
        st.setString(2, order.getDescription());
        st.setString(3, order.getCreateDate());
        st.setString(4, order.getTotal());
       

        try {
            row = st.executeUpdate();

        } catch (Exception e) {
            row = 0;
        } finally {
            cn.close();
        }
        return row > 0;

    }
    
    public static ArrayList<Order> getAllOrder() throws Exception {
        Connection cn = DBUtils.makeConnection();
        int row =0;

        ArrayList<Order> list = new ArrayList<>();

        String sql = "select id, aid, description, createDate, total, status\n"
                + "from tblOrder\n";
                
        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        

        try {
            ResultSet r = st.executeQuery(); //Chạy query và lưu kết quả vào r
            

            while (r.next()) {
                Order order = new Order(r.getString(1), r.getString(2), r.getString(3),
                        r.getString(4), r.getString(5),r.getString(6)); //nếu giá trị r =! tạo account mới lưu vào trong list
                list.add(order);
            }
        } catch (Exception e) {
            list = null;

        } finally {
            cn.close();
        }
        return list;

    }
    
    public static ArrayList<Order> getOrderByAId(String aid) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int row =0;

        ArrayList<Order> list = new ArrayList<>();

        String sql = "SELECT id,aid,description,createDate,total,status "
                + "FROM tblOrder "
                + "WHERE aid=?";

        try {
            PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
            st.setString(1, aid);
            ResultSet r = st.executeQuery(); //Chạy query và lưu kết quả vào r
            
            while (r.next()) {
                Order order = new Order(r.getString(1), r.getString(2), r.getString(3),
                        r.getString(4), r.getString(5),r.getString(6)); //nếu giá trị r =! tạo account mới lưu vào trong list
                list.add(order);
            }
        } catch (Exception e) {
            list = null;

        } finally {
            cn.close();
        }
        return list;
    }

}
