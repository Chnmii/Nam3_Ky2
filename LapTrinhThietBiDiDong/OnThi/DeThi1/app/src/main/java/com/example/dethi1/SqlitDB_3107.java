package com.example.dethi1;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class SqlitDB_3107 extends SQLiteOpenHelper {
    // tên bảng
    public  static final String TableName = "Taxi_Ma01";
    // Tên các cột trong bảng
    public static final String Id = "Id";
    public static final String soXe = "soXe";
    public static final String quangDuong = "quangDuong";
    public static final String donGia = "donGia";
    public static final String khuyenMai = "khuyenMai";
    public SqlitDB_3107(Context context, String name, SQLiteDatabase.CursorFactory factory, int version){
        super(context, name,factory, version);
    }
    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        //Tạo câu SQL để tạo bảng
        String sqlCreate = "Create table if not exists " + TableName + "("
                +Id +" INTEGER PRIMARY KEY AUTOINCREMENT, "
                +soXe +" Text,"
                +quangDuong +" Float,"
                +donGia +" Float,"
                +khuyenMai +" Integer)";
        // Chạy câu truy vấn sql để tạo bảng
        sqLiteDatabase.execSQL(sqlCreate);
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        // Xóa bảng tableContact đã có
        sqLiteDatabase.execSQL("Drop table if exists "+ TableName);
        // Tạo lại
        onCreate(sqLiteDatabase);
    }
    public void addContact(Taxi_Ma01 item){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues value = new ContentValues();
        value.put(soXe, item.getSoXe());
        value.put(quangDuong, item.getQuangDuong());
        value.put(donGia, item.getDonGia());
        value.put(khuyenMai, item.getKhyenMai());
        db.insert(TableName, null, value);
        db.close();
    }
    public void updateContact(int id, Taxi_Ma01 item){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues value = new ContentValues();
        value.put(Id, item.getID());
        value.put(soXe, item.getSoXe());
        value.put(quangDuong, item.getQuangDuong());
        value.put(donGia, item.getDonGia());
        value.put(khuyenMai, item.getKhyenMai());
        db.update(TableName, value,Id +"=?",new String[]{String.valueOf(id)});
        db.close();
    }
    public void deleteContact(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        String sql = "Delete From "+TableName+" Where ID = "+id;
        db.execSQL(sql);
        db.close();
    }
    public ArrayList<Taxi_Ma01> getAllContact(){
        ArrayList<Taxi_Ma01> list = new ArrayList<>();
        // câu truy vấn
        String sql = "Select * from "+TableName +" Order By soXe ASC";
        //Lấy đối tượng csdl sqlite
        SQLiteDatabase db = this.getReadableDatabase();
        //Chạy câu truy vấn trả về dạng Cursor
        Cursor cursor = db.rawQuery(sql, null);
        // Tạo ArrayList<Contact> để trả về
        if(cursor != null){
            while (cursor.moveToNext()){
                Taxi_Ma01 item = new Taxi_Ma01(cursor.getInt(0),cursor.getString(1),
                        cursor.getFloat(2), cursor.getFloat(3), cursor.getInt(4));
                list.add(item);
            }
        }
        return list;
    }
}

