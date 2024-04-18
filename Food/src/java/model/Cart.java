/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TT
 */
public class Cart {

    private List<Items> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Items> getItems() {
        return items;
    }

    public Items getItemsById(int id) {
        for (Items item : items) {
            if (id == item.getProducts().getId()) {
                return item;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemsById(id).getQuantity();
    }

    public void addItem(Items i) {
        if (getItemsById(i.getProducts().getId()) != null) {
            Items oldItems = getItemsById(i.getProducts().getId());
            oldItems.setQuantity(oldItems.getQuantity() + i.getQuantity());
        } else {
            items.add(i);
        }
    }

    public double getTotalMoney() {
        double total = 0;
        for (Items item : items) {
            total += (item.getQuantity() * item.getPrice());
        }
        return total;
    }


    public Products getProductsById(int id, List<Products> list) {
        for (Products products : list) {
            if (products.getId() == id) {
                return products;
            }
        }
        return null;
    }

    public Cart(String txt, List<Products> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String string : s) {
                    String[] n = string.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quatity = Integer.parseInt(n[1]);
                    Products p = getProductsById(id, list);
                    Items i = new Items(p, quatity, p.getPrice());
                    addItem(i);
                }
            }
        } catch (Exception e) {
        }

    }
}
