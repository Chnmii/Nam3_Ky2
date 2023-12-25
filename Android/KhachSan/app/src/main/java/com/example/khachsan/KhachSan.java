package com.example.khachsan;

public class KhachSan implements Comparable<KhachSan>{
    private int Ma;
    private String Hoten;
    private int Sophong;
    private int Dongia;
    private int Songay;

    public KhachSan(int ma, String hoten, int sophong, int dongia, int songay) {
        Ma = ma;
        Hoten = hoten;
        Sophong = sophong;
        Dongia = dongia;
        Songay = songay;
    }

    public KhachSan(){}
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

    public int getSongay() {
        return Songay;
    }

    public void setSongay(int songay) {
        Songay = songay;
    }

    public int getTongTien(){
        return Dongia * Songay;
    }


    @Override
    public int compareTo(KhachSan khachSan) {
        return this.getSophong();
    }
}
