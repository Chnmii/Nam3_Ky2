package com.example.ktracuoiky;

public class Sanpham implements Comparable<Sanpham>{
    private int Ma;
    private String TenSP;
    private int GiaTien;
    private int KhuyenMai;

    public Sanpham(int ma, String tenSP, int giaTien, int khuyenMai) {
        Ma = ma;
        TenSP = tenSP;
        GiaTien = giaTien;
        KhuyenMai = khuyenMai;
    }

    public int getMa() {
        return Ma;
    }

    public void setMa(int ma) {
        Ma = ma;
    }

    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String tenSP) {
        TenSP = tenSP;
    }

    public int getGiaTien() {
        return GiaTien;
    }

    public void setGiaTien(int giaTien) {
        GiaTien = giaTien;
    }

    public int getKhuyenMai() {
        return KhuyenMai;
    }

    public void setKhuyenMai(int khuyenMai) {
        KhuyenMai = khuyenMai;
    }

    @Override
    public int compareTo(Sanpham sanpham) {
        return 0;
    }
}
