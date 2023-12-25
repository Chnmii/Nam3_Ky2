package com.example.dethi1;

import java.io.Serializable;

public class Taxi_Ma01 implements Serializable {
    private int ID;
    private String soXe;
    private float quangDuong;
    private float donGia;
    private int khyenMai;

    public Taxi_Ma01() {
    }

    public Taxi_Ma01(String soXe, float quangDuong, float donGia, int khyenMai) {
        this.soXe = soXe;
        this.quangDuong = quangDuong;
        this.donGia = donGia;
        this.khyenMai = khyenMai;
    }

    public Taxi_Ma01(int ID, String soXe, float quangDuong, float donGia, int khyenMai) {
        this.ID = ID;
        this.soXe = soXe;
        this.quangDuong = quangDuong;
        this.donGia = donGia;
        this.khyenMai = khyenMai;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getSoXe() {
        return soXe;
    }

    public void setSoXe(String soXe) {
        this.soXe = soXe;
    }

    public float getQuangDuong() {
        return quangDuong;
    }

    public void setQuangDuong(float quangDuong) {
        this.quangDuong = quangDuong;
    }

    public float getDonGia() {
        return donGia;
    }

    public void setDonGia(float donGia) {
        this.donGia = donGia;
    }

    public int getKhyenMai() {
        return khyenMai;
    }

    public void setKhyenMai(int khyenMai) {
        this.khyenMai = khyenMai;
    }

    public float tongTien(){
        float rate = (float) (this.donGia * this.quangDuong * ((100-this.khyenMai)*1.0/100));
        return Math.round(rate * 1000f) / 1000f;
    }

    @Override
    public String toString() {
        return "Taxi_Ma01{" +
                "ID=" + ID +
                ", soXe='" + soXe + '\'' +
                ", quangDuong=" + quangDuong +
                ", donGia=" + donGia +
                ", khyenMai=" + khyenMai +
                '}';
    }
}
