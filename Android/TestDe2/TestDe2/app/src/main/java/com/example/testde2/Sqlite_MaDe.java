package com.example.testde2;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.google.android.material.tabs.TabLayout;

import java.util.ArrayList;

public class Sqlite_MaDe extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "DB_HOADON";
    public static final String DATABASE_TABLE = "HOADON_3009";
    public static final String MA = "MA";
    public static final String HOTEN = "HOTEN";
    public static final String PHONG = "PHONG";
    public static final String DONGIA = "DONGIA";
    public static final String SONGAYLUUTRU = "SONGAYLUUTRU";

    private Context context;

    public Sqlite_MaDe(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                HOTEN + " TEXT, " +
                PHONG + " INTEGER, " +
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

    public void addTaxi(HoaDon_3009 hoaDon_3009){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, hoaDon_3009.getMa());
        values.put(HOTEN, hoaDon_3009.getHoten());
        values.put(PHONG, hoaDon_3009.getPhong());
        values.put(DONGIA, hoaDon_3009.getDongia());
        values.put(SONGAYLUUTRU, hoaDon_3009.getSongayluutru());

        db.insert(DATABASE_TABLE, null, values);

        db.close();
    }

    public ArrayList<HoaDon_3009> getAll(){
        ArrayList<HoaDon_3009> list = new ArrayList<HoaDon_3009>();
        String selectQuery = "SELECT * FROM " + DATABASE_TABLE + " ORDER BY PHONG DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()){
            do{
                HoaDon_3009 hoaDon_3009 = new HoaDon_3009();
                hoaDon_3009.setMa(cursor.getInt(0));
                hoaDon_3009.setHoten(cursor.getString(1));
                hoaDon_3009.setPhong(cursor.getInt(2));
                hoaDon_3009.setDongia(cursor.getInt(3));
                hoaDon_3009.setSongayluutru(cursor.getInt(4));

                list.add(hoaDon_3009);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }

    public ArrayList<HoaDon_3009> getAllBySearch(String s){
        ArrayList<HoaDon_3009> list = new ArrayList<HoaDon_3009>();
        int money = Integer.parseInt(s);
        String sql = "Select * from "+ DATABASE_TABLE +" Where DONGIA * SONGAYLUUTRU > " + money + " Order By PHONG DESC";

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(sql, null);

        if(cursor.moveToFirst()){
            do{
                HoaDon_3009 hoaDon_3009 = new HoaDon_3009();
                hoaDon_3009.setMa(cursor.getInt(0));
                hoaDon_3009.setHoten(cursor.getString(1));
                hoaDon_3009.setPhong(cursor.getInt(2));
                hoaDon_3009.setDongia(cursor.getInt(3));
                hoaDon_3009.setSongayluutru(cursor.getInt(4));

                list.add(hoaDon_3009);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }
}
