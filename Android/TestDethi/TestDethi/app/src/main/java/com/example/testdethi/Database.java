package com.example.testdethi;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.widget.TableLayout;

import java.io.Flushable;
import java.util.ArrayList;
import java.util.List;

public class Database extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "DB_TAXISALARY";
    public static final String DATABASE_TABLE = "TAXI";
    public static final String MA = "MA";
    public static final String SOXE = "SOXE";
    public static final String QUANGDUONG = "QUANGDUONG";
    public static final String DONGIA = "DONGIA";
    public static final String KHUYENMAI = "KHUYENMAI";

    private Context context;

    public Database(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTERGER PRIMARY KEY, " +
                SOXE + " TEXT, " +
                QUANGDUONG + " DOUBLE, " +
                DONGIA + " INTERGER, " +
                KHUYENMAI + " INTERGER)";

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

    public void addTaxi(Taxi taxi){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, taxi.getMa());
        values.put(SOXE, taxi.getSoxe());
        values.put(QUANGDUONG, taxi.getQuangduong());
        values.put(DONGIA, taxi.getDongia());
        values.put(KHUYENMAI, taxi.getKhuyenmai());

        db.insert(DATABASE_TABLE, null, values);

        db.close();
    }

    public void updateTaxi(Taxi taxi){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(SOXE, taxi.getSoxe());
        values.put(QUANGDUONG, taxi.getQuangduong());
        values.put(DONGIA, taxi.getDongia());
        values.put(KHUYENMAI, taxi.getKhuyenmai());
        db.update(DATABASE_TABLE, values,MA + "=?", new String[]{String.valueOf(taxi.getMa())});
        System.out.println("ID la " + taxi.getMa());
        System.out.println("ID la " + taxi.getSoxe());
        System.out.println("ID la " + taxi.getQuangduong());
        System.out.println("ID la " + taxi.getDongia());
        System.out.println("ID la " + taxi.getKhuyenmai());
        db.close();
    }

    public void QueryData(String sql){
        SQLiteDatabase database = getWritableDatabase();
        database.execSQL(sql);
    }

    public void deleteByID(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM TAXI WHERE MA = " + id);
    }


    public ArrayList<Taxi> getAll(){
        ArrayList<Taxi> list = new ArrayList<Taxi>();
        String selectQuery = "SELECT * FROM " + DATABASE_TABLE;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()){
            do{
                Taxi taxi = new Taxi();
                taxi.setMa(cursor.getInt(0));
                taxi.setSoxe(cursor.getString(1));
                taxi.setQuangduong(cursor.getDouble(2));
                taxi.setDongia(cursor.getInt(3));
                taxi.setKhuyenmai(cursor.getInt(4));

                list.add(taxi);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }

    public ArrayList<Taxi> getAllBySearch(String s){
        if(s.equals("")){
            ArrayList<Taxi> list = getAll();
            return list;
        }
        int money = Integer.parseInt(s);
        ArrayList<Taxi> list = new ArrayList<Taxi>();

        String selectQuery = "SELECT * FROM " + DATABASE_TABLE + " Where DONGIA * QUANGDUONG * (100 - KHUYENMAI)/100 > " + money;

        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()){
            do{
                Taxi taxi = new Taxi();
                taxi.setMa(cursor.getInt(0));
                taxi.setSoxe(cursor.getString(1));
                taxi.setQuangduong(cursor.getDouble(2));
                taxi.setDongia(cursor.getInt(3));
                taxi.setKhuyenmai(cursor.getInt(4));

                list.add(taxi);
            } while (cursor.moveToNext());
        }
        cursor.close();
        db.close();
        return list;
    }
}
