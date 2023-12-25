package com.example.intent1;

import androidx.annotation.NonNull;

import java.io.Serializable;

public class Sinhvien implements Serializable {

    public Sinhvien(int maSV, String quequan) {
        MaSV = maSV;
        Quequan = quequan;
    }

    public int getMaSV() {
        return MaSV;
    }

    public void setMaSV(int maSV) {
        MaSV = maSV;
    }

    public String getQuequan() {
        return Quequan;
    }

    public void setQuequan(String quequan) {
        Quequan = quequan;
    }

    int MaSV;
    String Quequan;

    @Override
    public String toString() {
        return "Sinhvien{" +
                "MaSV=" + MaSV +
                ", Quequan='" + Quequan + '\'' +
                '}';
    }
}
