package com.example.giaodich;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

public class Sqlite_GiaoDich extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "Sqlite_GiaoDich";
    private static final String TABLE_NAME = "GiaoDich";

    private static final String MA = "MA";
    private static final String NOIDUNG = "NOIDUNG";
    private static final String NGAYTHANG = "NGAYTHANG";
    private static final String LOAIGIAODICH = "LOAIGIAODICH";
    private static final String TENNGUOI = "TENNGUOI";
    private static final String SOTIEN = "SOTIEN";
    private Context context;


    public static String getLoaigiaodich(){return LOAIGIAODICH;}

    public Sqlite_GiaoDich(Context context) {
        super(context, DATABASE_NAME, null, 6);
        this.context = context;
    }

    public void xoaToanBo() {
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("delete from GiaoDich");
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sqlQuery = "CREATE TABLE " + TABLE_NAME + " (" +
                MA + " integer primary key AUTOINCREMENT NOT NULL, " +
                NOIDUNG + " TEXT NOT NULL, " +
                NGAYTHANG + " TEXT NOT NULL, " +
                LOAIGIAODICH + " interger NOT NULL, " +
                TENNGUOI+" TEXT NOT NULL, "+
                SOTIEN + " integer NOT NULL)";
        db.execSQL(sqlQuery);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    public void Update(GiaoDich giaoDich) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, giaoDich.getMa());
        values.put(NOIDUNG, giaoDich.getNoiDung());
        values.put(NGAYTHANG, giaoDich.getNgayThang());
        values.put(LOAIGIAODICH, giaoDich.getLoaiGD());
        values.put(TENNGUOI, giaoDich.getTen());
        values.put(SOTIEN, giaoDich.getSoTien());

        db.update(TABLE_NAME, values, "MA = ?", new String[]{String.valueOf(giaoDich.getMa())});

        db.close();
    }
    //Add new a student
    public void addSP(GiaoDich giaoDich) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, giaoDich.getMa());
        values.put(NOIDUNG, giaoDich.getNoiDung());
        values.put(NGAYTHANG, giaoDich.getNgayThang());
        values.put(LOAIGIAODICH, giaoDich.getLoaiGD());
        values.put(TENNGUOI, giaoDich.getTen());
        values.put(SOTIEN, giaoDich.getSoTien());
        db.insert(TABLE_NAME, null, values);
        db.close();
    }

    public void DeleteById(int id) {
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("delete from GiaoDich where MA = \""+id+"\"");
    }

    public List<GiaoDich> getAll() {
        List<GiaoDich> list = new ArrayList<GiaoDich>();
        String selectQuery = "SELECT  * FROM " + TABLE_NAME ;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if (cursor.moveToFirst()) {
            do {
                GiaoDich HoaDon_NgaySinh = new GiaoDich();
                HoaDon_NgaySinh.setMa(cursor.getInt(0));
                HoaDon_NgaySinh.setNoiDung(cursor.getString(1));
                HoaDon_NgaySinh.setNgayThang(cursor.getString(2));
                HoaDon_NgaySinh.setLoaiGD(cursor.getInt(3));
                HoaDon_NgaySinh.setTen(cursor.getString(4));
                HoaDon_NgaySinh.setSoTien(cursor.getInt(5));
                list.add(HoaDon_NgaySinh);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }
}
