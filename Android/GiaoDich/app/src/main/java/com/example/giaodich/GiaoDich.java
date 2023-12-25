package com.example.giaodich;

import java.util.Date;

public class GiaoDich {
    public int Ma;
    public String NoiDung;
    public String NgayThang;
    public int LoaiGD;
    public String Ten;
    public long SoTien;

    public GiaoDich(int ma, String noiDung, String ngayThang, int loaiGD, String ten, long soTien) {
        Ma = ma;
        NoiDung = noiDung;
        NgayThang = ngayThang;
        LoaiGD = loaiGD;
        Ten = ten;
        SoTien = soTien;
    }

    public GiaoDich() {
    }

    public int getMa() {
        return Ma;
    }

    public void setMa(int ma) {
        Ma = ma;
    }

    public String getNoiDung() {
        return NoiDung;
    }

    public void setNoiDung(String noiDung) {
        NoiDung = noiDung;
    }

    public String getNgayThang() {
        return NgayThang;
    }

    public void setNgayThang(String ngayThang) {
        NgayThang = ngayThang;
    }

    public int getLoaiGD() {
        return LoaiGD;
    }

    public void setLoaiGD(int loaiGD) {
        LoaiGD = loaiGD;
    }

    public String getTen() {
        return Ten;
    }

    public void setTen(String ten) {
        Ten = ten;
    }

    public long getSoTien() {
        return SoTien;
    }

    public void setSoTien(long soTien) {
        SoTien = soTien;
    }
}
