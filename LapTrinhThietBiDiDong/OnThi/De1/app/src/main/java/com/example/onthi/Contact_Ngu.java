package com.example.onthi;

import java.io.Serializable;

public class Contact_Ngu implements Serializable {
    private int ID;
    private String Name;
    private String Phone;

    public Contact_Ngu() {
    }

    public Contact_Ngu(int ID, String name, String phone) {
        this.ID = ID;
        Name = name;
        Phone = phone;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }
}
