package com.example.testde3;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class Database extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "HAIDANG_DB";
    public static final String DATABASE_TABLE = "HOADON_HAIDANG";
    public static final String MA = "MA";
    public static final String HOTEN = "HOTEN";
    public static final String SOPHONG = "SOPHONG";
    public static final String DONGIA = "DONGIA";
    public static final String SONGAYLUUTRU = "SONGAYLUUTRU";

    private Context context;

    public Database(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                HOTEN + " TEXT, " +
                SOPHONG + " INTEGER, " +
                DONGIA + " INTEGER, " +
                SONGAYLUUTRU + " INTEGER)";

        db.execSQL(sqlQuery);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + DATABASE_TABLE);
        onCreate(db);
    }

    public void DeleteAll(){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM " + DATABASE_TABLE);
    }

    public void AddHoaDon(HoaDon_HaiDang hd){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, hd.getMa());
        values.put(HOTEN, hd.getHoten());
        values.put(SOPHONG, hd.getSophong());
        values.put(DONGIA, hd.getDongia());
        values.put(SONGAYLUUTRU, hd.getSongayluutru());

        db.insert(DATABASE_TABLE, null, values);

        db.close();
    }

    public void deleteByID(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM " + DATABASE_TABLE + " WHERE MA = " + id);
    }

    public ArrayList<HoaDon_HaiDang> getAll(){
        ArrayList<HoaDon_HaiDang> list = new ArrayList<HoaDon_HaiDang>();
        String selectQuery = "SELECT MA, HOTEN, SOPHONG, DONGIA, SONGAYLUUTRU, (DONGIA * SONGAYLUUTRU) AS TONGTIEN FROM " + DATABASE_TABLE + " ORDER BY TONGTIEN DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()){
            do{
                HoaDon_HaiDang hd = new HoaDon_HaiDang();
                hd.setMa(cursor.getInt(0));
                hd.setHoten(cursor.getString(1));
                hd.setSophong(cursor.getInt(2));
                hd.setDongia(cursor.getInt(3));
                hd.setSongayluutru(cursor.getInt(4));

                list.add(hd);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }


}
