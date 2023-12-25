package com.example.hoadon;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class NgoThiTrang_DB extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "DB_TAXI";
    public static final String DATABASE_TABLE = "HoaDon_NgoThiTrang";
    public static final String MA = "MA";
    public static final String HOTEN = "HOTEN";
    public static final String SOPHONG = "SOPHONG";
    public static final String DONGIA = "DONGIA";
    public static final String SONGAY = "SONGAY";

    private Context context;

    public NgoThiTrang_DB(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                HOTEN + " TEXT, " +
                SOPHONG + " INTEGER, " +
                DONGIA + " INTEGER, " +
                SONGAY + " INTEGER)" ;

        sqLiteDatabase.execSQL(sqlQuery);

    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + DATABASE_TABLE);
        onCreate(sqLiteDatabase);

    }

    public void addKhachHang(HoaDon_NgoThiTrang ks){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, ks.getMa());
        values.put(HOTEN, ks.getHoten());
        values.put(SOPHONG, ks.getSophong());
        values.put(DONGIA, ks.getDongia());
        values.put(SONGAY, ks.getSongayluutru());

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
