package com.example.listview_nc;

public class SinhVien {
    public String Hoten;
    public Integer Namsinh;

    public String getHoten() {
        return Hoten;
    }

    public void setHoten(String hoten) {
        Hoten = hoten;
    }

    public Integer getNamsinh() {
        return Namsinh;
    }

    public void setNamsinh(Integer namsinh) {
        Namsinh = namsinh;
    }

    public SinhVien(String hoten, Integer namsinh){
        Hoten = hoten;
        Namsinh = namsinh;
    }

}
