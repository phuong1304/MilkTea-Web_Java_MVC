/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;
import java.util.Set;


public class Cart { // chứa hashmap để chỉnh sửa số lượng của product khi thêm vào
    
    private HashMap<String, Integer> cart = new HashMap<String, Integer>();// Luu danh sach: String: luu Pro ID; integer: So luong produc

    public Cart() {
    }
    
    public int getSize(){
        return cart.size(); // in so luong
    }
    
    public boolean addItem(String id) {
        
//        if(cart.containsKey(p.getId())){ //Hashmap chua co cai gi ca
            cart.put(id,1); // Mac dinh them vao gio hang la 1 cai
                return true;
//        }
    }
    public Set<String> getItem(){
        return cart.keySet(); //
    }
    
    public boolean updateItem(String id,String quantity){
        cart.put(id,Integer.parseInt(quantity));
        return true;
    }
    
    public int deleteItem(String id){
        return cart.remove(id);
    }
    
    public int getQuantity(String id){
        return cart.get(id); //
    }
}
