/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author TT
 */
public class Accounts {
    private int id;
    private String username, password, firstname, lastname, phone, address;
    private boolean role;

    public Accounts() {
    }

    public Accounts(int id, String username, String password, String firstname, String lastname, String phone, String address, boolean role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }
    public Accounts(int id, String password, String firstname, String lastname, String phone, String address) {
        this.id = id;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.address = address;
    }
    public Accounts(String username, String password, String firstname, String lastname, String phone, String address, boolean role) {
        this.username = username;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.address = address;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    
    
}
