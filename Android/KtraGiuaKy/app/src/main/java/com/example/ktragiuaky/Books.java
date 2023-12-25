package com.example.ktragiuaky;

public class Books {
    private String ten;
    private String tacgia;
    private int sotrang;

    public Books(String ten, String tacgia, int sotrang) {
        this.ten = ten;
        this.tacgia = tacgia;
        this.sotrang = sotrang;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTacgia() {
        return tacgia;
    }

    public void setTacgia(String tacgia) {
        this.tacgia = tacgia;
    }

    public int getSotrang() {
        return sotrang;
    }

    public void setSotrang(int sotrang) {
        this.sotrang = sotrang;
    }
}
