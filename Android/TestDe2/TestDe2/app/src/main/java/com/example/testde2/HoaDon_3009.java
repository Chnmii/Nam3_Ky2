package com.example.testde2;

import java.io.Serializable;

public class HoaDon_3009 implements Serializable {
    private int ma;
    private String hoten;
    private int phong;
    private int dongia;
    private int songayluutru;

    public HoaDon_3009(int ma, String hoten, int phong, int dongia, int songayluutru) {
        this.ma = ma;
        this.hoten = hoten;
        this.phong = phong;
        this.dongia = dongia;
        this.songayluutru = songayluutru;
    }

    public HoaDon_3009(){

    }

    public int getMa() {
        return ma;
    }

    public void setMa(int ma) {
        this.ma = ma;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public int getPhong() {
        return phong;
    }

    public void setPhong(int phong) {
        this.phong = phong;
    }

    public int getDongia() {
        return dongia;
    }

    public void setDongia(int dongia) {
        this.dongia = dongia;
    }

    public int getSongayluutru() {
        return songayluutru;
    }

    public void setSongayluutru(int songayluutru) {
        this.songayluutru = songayluutru;
    }

    public int getTongtien(){
        return dongia * songayluutru;
    }

}
