package com.example.ktracuoiky;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class Database extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "DB_SANPHAM;
    public static final String DATABASE_TABLE = "Sanpham";
    public static final String MA = "MA";
    public static final String TENSP ="TENSP";
    public static final String GIATIEN = "GIATIEN";
    public static final String KHUYENMAI = "KHUYENMAI";
    private Context context;

    public Database(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                TENSP + " TEXT, " +
                GIATIEN + " INTEGER, " +
                KHUYENMAI + " INTEGER)";


        sqLiteDatabase.execSQL(sqlQuery);

    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + DATABASE_TABLE);
        onCreate(sqLiteDatabase);

    }

    public void addKhachHang(Sanpham sp{
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, sp.getMa());
        values.put(TENSP, sp.getTenSP());
        db.insert(DATABASE_TABLE, null, values);
        db.close();
    }

    public void updateKH(HoaDon_NgoThiTrang ks){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();

        values.put(HOTEN, ks.getHoten());
        values.put(SOPHONG, ks.getSophong());
        values.put(DONGIA, ks.getDongia());
        values.put(SONGAY, ks.getSongayluutru());

        db.update(DATABASE_TABLE, values, MA + "=?" , new String[]{String.valueOf(ks.getMa())});

    }

    public void DeleteAll(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM " + DATABASE_TABLE);
    }

    public void deleteByID(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM HoaDon_2804 WHERE MA = " + id);
    }


    public ArrayList<HoaDon_NgoThiTrang> getAll(){
        ArrayList<HoaDon_NgoThiTrang> list = new ArrayList<HoaDon_NgoThiTrang>();
        String selectQuery = "SELECT MA, HOTEN, SOPHONG, DONGIA, SONGAY, DONGIA*SONGAY AS TONGTIEN FROM " + DATABASE_TABLE + " ORDER BY TONGTIEN DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if (cursor.moveToFirst())
            do{
                HoaDon_NgoThiTrang ks = new HoaDon_NgoThiTrang();
                ks.setMa(cursor.getInt(0));
                ks.setHoten(cursor.getString(1));
                ks.setSophong(cursor.getInt(2));
                ks.setDongia(cursor.getInt(3));
                ks.setSongayluutru(cursor.getInt(4));

                list.add(ks);
            } while (cursor.moveToNext());
        cursor.close();
        db.close();
        return list;
    }
}
