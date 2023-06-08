/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOProduct;

import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import lib.DBUtils;

public class ToolProduct {

    public static ArrayList<Product> getAllProduct(String search) throws Exception {
        Connection cn = DBUtils.makeConnection();
        if (search == null) {
            search = "";
        }

        ArrayList<Product> list = null;

        String sql = "select id, pname, price,imagePath, status\n"
                + "from tblProduct\n"
                + "where pname like ?";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, "%" + search + "%"); // Set giá trị vào ? trong query

        try {
            ResultSet r = st.executeQuery(); //Chạy query và lưu kết quả vào r
            list = new ArrayList<>();

            while (r.next()) {
                Product a = new Product(r.getString(1), r.getString(2), r.getString(3),
                        r.getString(4), r.getString(5)); //nếu giá trị r =! tạo account mới lưu vào trong list
                list.add(a);
            }
        } catch (Exception e) {
            list = null;

        } finally {
            cn.close();
        }
        return list;

    }

    public static ArrayList<Product> getAllProduct() throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Product> list = new ArrayList<>();
        if (cn != null) {

            String sql = "select id, pname, price, imagePath, status\n"
                    + "from tblProduct\n";

            PreparedStatement st = cn.prepareStatement(sql);

            try {
                ResultSet r = st.executeQuery();
                list = new ArrayList<>();
                while (r != null && r.next()) {
                    Product a = new Product(r.getString(1), r.getString(2),
                            r.getString(3), r.getString(4), r.getString(5));

                    list.add(a);

                }
            } catch (Exception e) {
                list = new ArrayList<>();
            } finally {
                cn.close();
            }
        }

        return list;
    }

    public static Product showProduct(String id) throws Exception {
        Connection cn = DBUtils.makeConnection();
        Product p = null;

        String sql = "select id, pname, price, imagePath, status\n"
                + "from tblProduct\n"
                + "where id= ?";

        PreparedStatement st = cn.prepareStatement(sql);
        st.setString(1, id);

        try {
            ResultSet r = st.executeQuery();

            while (r != null && r.next()) {
                p = new Product(r.getString(1), r.getString(2),
                        r.getString(3), r.getString(4), r.getString(5));

            }
        } catch (Exception e) {
            p = null;
        } finally {
            cn.close();

        }

        return p;
    }

    public static boolean addProduct(Product p) throws Exception {
        Connection cn = DBUtils.makeConnection();

        String sql = "insert into tblProduct(pname, price, imagePath)\n"
                + "values (?,?,?)";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, p.getPname()); // Set giá trị vào ? trong query
        st.setString(2, p.getPrice());
        st.setString(3, p.getImagePath());
        int row = 0;

        try {

            row = st.executeUpdate();

        } catch (Exception e) {
            row = 0;
        } finally {
            cn.close();
        }

        return row > 0;

    }

    public static boolean updateProduct( String status, String id) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int row = 0;

        String sql = "update tblProduct\n"
                + " set status = ? \n"
                + "where id = ?";

        PreparedStatement st = cn.prepareStatement(sql); // Lưu 1 query để chuẩn bị
        st.setString(1, status);
        
        st.setString(2, id);
        

        try {
            row = st.executeUpdate();

        } catch (Exception e) {
            row = 0;
        } finally {
            cn.close();
        }
        return row > 0;

    }
    
     public static boolean deleteProduct(String id) throws SQLException {
       boolean result = false;
       Connection cn = null;
       PreparedStatement ptm = null;
        try {
            cn = DBUtils.makeConnection();
            if(cn != null){
                String sql ="Delete tblProduct WHERE id = ?";
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
