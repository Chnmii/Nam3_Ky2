package com.hanu.android_basic.model;

public class ReceiptHotel {
    private int id;
    private String name;
    private int numberRoom;
    private String price;
    private int date_time;

    public ReceiptHotel() {}

    public ReceiptHotel(int id, String name, int numberRoom, String price, int date_time) {
        this.id = id;
        this.name = name;
        this.numberRoom = numberRoom;
        this.price = price;
        this.date_time = date_time;
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

    public int getNumberRoom() {
        return numberRoom;
    }

    public void setNumberRoom(int numberRoom) {
        this.numberRoom = numberRoom;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getDate_time() {
        return date_time;
    }

    public void setDate_time(int date_time) {
        this.date_time = date_time;
    }
}
