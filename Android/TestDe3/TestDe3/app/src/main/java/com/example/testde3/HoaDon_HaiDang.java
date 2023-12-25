package com.example.testde3;

import java.io.Serializable;

public class HoaDon_HaiDang implements Serializable {
    private int Ma;
    private String Hoten;
    private int Sophong;
    private int Dongia;
    private int Songayluutru;

    public HoaDon_HaiDang(int ma, String hoten, int sophong, int dongia, int songayluutru) {
        Ma = ma;
        Hoten = hoten;
        Sophong = sophong;
        Dongia = dongia;
        Songayluutru = songayluutru;
    }

    public HoaDon_HaiDang(){

    }

    public int getMa() {
        return Ma;
    }

    public void setMa(int ma) {
        Ma = ma;
    }

    public String getHoten() {
        return Hoten;
    }

    public void setHoten(String hoten) {
        Hoten = hoten;
    }

    public int getSophong() {
        return Sophong;
    }

    public void setSophong(int sophong) {
        Sophong = sophong;
    }

    public int getDongia() {
        return Dongia;
    }

    public void setDongia(int dongia) {
        Dongia = dongia;
    }

    public int getSongayluutru() {
        return Songayluutru;
    }

    public void setSongayluutru(int songayluutru) {
        Songayluutru = songayluutru;
    }

    public int getGiatien(){
        return Dongia * Songayluutru;
    }

}
