/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author TT
 */
public class Products {
    private int id;
    private String name;
    private String images;
    private String describe;
    private float price;
    Categories categories;

    public Products() {
    }

    public Products(int id, String name, String images, String describe, float price, Categories categories) {
        this.id = id;
        this.name = name;
        this.images = images;
        this.describe = describe;
        this.price = price;
        this.categories = categories;
    }
    public Products(String name, String images, String describe, float price, Categories categories) {
        this.name = name;
        this.images = images;
        this.describe = describe;
        this.price = price;
        this.categories = categories;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Categories getCategories() {
        return categories;
    }

    public void setCategories(Categories categories) {
        this.categories = categories;
    }
    

    
}
