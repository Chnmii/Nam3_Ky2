package com.example.testdethi;

import java.io.Serializable;

public class Taxi implements Comparable<Taxi>, Serializable {
    private int Ma;
    private String Soxe;
    private double Quangduong;
    private int dongia;
    private int khuyenmai;

    public Taxi(int ma, String soxe, double quangduong, int dongia, int khuyenmai) {
        Ma = ma;
        Soxe = soxe;
        Quangduong = quangduong;
        this.dongia = dongia;
        this.khuyenmai = khuyenmai;
    }

    public Taxi(){

    }

    public int getMa() {
        return Ma;
    }

    public void setMa(int ma) {
        Ma = ma;
    }

    public String getSoxe() {
        return Soxe;
    }

    public void setSoxe(String soxe) {
        Soxe = soxe;
    }

    public double getQuangduong() {
        return Quangduong;
    }

    public void setQuangduong(double quangduong) {
        Quangduong = quangduong;
    }

    public int getDongia() {
        return dongia;
    }

    public void setDongia(int dongia) {
        this.dongia = dongia;
    }

    public int getKhuyenmai() {
        return khuyenmai;
    }

    public void setKhuyenmai(int khuyenmai) {
        this.khuyenmai = khuyenmai;
    }

    public int Giatien(){
        return (int) (this.dongia * this.Quangduong * (100 - this.khuyenmai)/100);
    }

    @Override
    public int compareTo(Taxi other) {
        // So sánh theo mã số xe
        return this.Soxe.compareTo(other.getSoxe());
    }
}
