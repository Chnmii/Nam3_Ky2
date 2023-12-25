package com.example.hoadontaxi;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class SQLiteDB_2804 extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "DB_TAXI1";
    public static final String DATABASE_TABLE = "Taxi_De1";
    public static final String MA = "MA";
    public static final String SOXE = "SOXE";
    public static final String QUANGDUONG = "QUANGDUONG";
    public static final String DONGIA = "DONGIA";
    public static final String KHUYENMAI = "KHUYENMAI";

    private Context context;

    public SQLiteDB_2804(Context context){
        super(context, DATABASE_NAME, null, 1);
        this.context = context;
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sqlQuery = "CREATE TABLE " + DATABASE_TABLE + " (" +
                MA + " INTEGER PRIMARY KEY, " +
                SOXE + " TEXT, " +
                QUANGDUONG + " DOUBLE, " +
                DONGIA + " INTEGER, " +
                KHUYENMAI + " INTEGER)";

        sqLiteDatabase.execSQL(sqlQuery);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + DATABASE_TABLE);
        onCreate(sqLiteDatabase);
    }

    public void addTaxi(Taxi taxi){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(MA, taxi.getMa());
        values.put(SOXE, taxi.getSoxe());
        values.put(QUANGDUONG, taxi.getQuangDuong());
        values.put(DONGIA, taxi.getDonGia());
        values.put(KHUYENMAI, taxi.getKhuyenMai());

        db.insert(DATABASE_TABLE, null, values);
        db.close();
    }

    public void updateTaxi(Taxi taxi){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(SOXE, taxi.getSoxe());
        values.put(QUANGDUONG, taxi.getQuangDuong());
        values.put(DONGIA, taxi.getDonGia());
        values.put(KHUYENMAI, taxi.getKhuyenMai());

        db.update(DATABASE_TABLE, values, MA + "=?", new String[]{String.valueOf(taxi.getMa())});
    }

    public void deleteByID(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        db.execSQL("DELETE FROM Taxi_De1 WHERE MA = " + id);

    }

    public ArrayList<Taxi> getAll(){
        ArrayList<Taxi> list = new ArrayList<Taxi>();
        String selectQuery = "SELECT * FROM " + DATABASE_TABLE;
        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if(cursor.moveToFirst()) {
            do {
                Taxi taxi = new Taxi();
                taxi.setMa(cursor.getInt(0));
                taxi.setSoxe(cursor.getString(1));
                taxi.setQuangDuong(cursor.getDouble(2));
                taxi.setDonGia(cursor.getInt(3));
                taxi.setKhuyenMai(cursor.getInt(4));
                list.add(taxi);
            } while ((cursor.moveToNext()));
        }
        cursor.close();
        db.close();
        return list;
    }
}
