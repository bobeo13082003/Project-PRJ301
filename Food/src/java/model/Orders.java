/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TT
 */
public class Orders {
    private int id;
    private double totalmoney;
    private String date;
    private int customerid;

    public Orders() {
    }

    public Orders(int id, double totalmoney, String date, int customerid) {
        this.id = id;
        this.totalmoney = totalmoney;
        this.date = date;
        this.customerid = customerid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }
    
    
}
