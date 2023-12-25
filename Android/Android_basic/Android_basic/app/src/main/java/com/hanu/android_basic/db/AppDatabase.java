package com.hanu.android_basic.db;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.hanu.android_basic.model.ReceiptHotel;

import java.util.ArrayList;
import java.util.Currency;
import java.util.List;

public class AppDatabase extends SQLiteOpenHelper {
    public final static String DATABASE_NAME = "hotel_receipt";
    public final static int DATABASE_VERSION = 1;
    public final static String ID = "id";
    public final static String NAME = "name";
    public final static String NUMBER_ROOM = "number_room";
    public final static String PRICE = "price";
    public final static String DATE_TIME = "date_time";
    public AppDatabase(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }


    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sqlQuery = "CREATE TABLE " + DATABASE_NAME + " (" + ID + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + NAME + " NVARCHAR(50),"
                + NUMBER_ROOM + " INTEGER,"
                + PRICE + " NVARCHAR(50),"
                + DATE_TIME + " INTEGER)";
        sqLiteDatabase.execSQL(sqlQuery);

    }

    public void insertReceipt(ReceiptHotel receiptHotel) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(ID, receiptHotel.getId());
        values.put(NAME, receiptHotel.getName());
        values.put(NUMBER_ROOM, receiptHotel.getNumberRoom());
        values.put(PRICE, receiptHotel.getPrice());
        values.put(DATE_TIME, receiptHotel.getDate_time());
        db.insert(DATABASE_NAME, null, values);
        db.close();
    }

    public List<ReceiptHotel> getAllReceipt() {
        List<ReceiptHotel> listReceipt = new ArrayList<>();
        String query = "SELECT * FROM " + DATABASE_NAME + " ORDER BY " + NUMBER_ROOM + " DESC";
        try (SQLiteDatabase db = this.getReadableDatabase()) {
            try (Cursor cursor = db.rawQuery(query, null)) {
                if (cursor.moveToFirst()) {
                    do {
                        ReceiptHotel receiptHotel = new ReceiptHotel();
                        receiptHotel.setId(cursor.getInt(0));
                        receiptHotel.setName(cursor.getString(1));
                        receiptHotel.setNumberRoom(cursor.getInt(2));
                        receiptHotel.setPrice(cursor.getString(3));
                        receiptHotel.setDate_time(cursor.getInt(4));
                        listReceipt.add(receiptHotel);
                    } while (cursor.moveToNext());
                }
            }
        }
        return listReceipt;
    }

    public int quantityReceipt(ReceiptHotel receiptHotel) {
        String query = "SELECT COUNT(" + ID + ") FROM " + DATABASE_NAME + " WHERE " + PRICE + " > ?";
        SQLiteDatabase db = this.getReadableDatabase();
        String[] selectionArgs = {String.valueOf(receiptHotel.getPrice())};
        Cursor cursor = db.rawQuery(query, selectionArgs);

        int count = 0;
        if (cursor.moveToFirst()) {
            count = cursor.getInt(0);
        }

        cursor.close();
        db.close();

        return count;
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
          sqLiteDatabase.execSQL("DROP TABLE IF EXISTS " + DATABASE_NAME);
    }
}
