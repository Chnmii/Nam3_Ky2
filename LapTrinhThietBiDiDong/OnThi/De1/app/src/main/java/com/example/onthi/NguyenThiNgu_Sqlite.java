package com.example.onthi;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class NguyenThiNgu_Sqlite extends SQLiteOpenHelper{
    // tên bảng
    public  static final String TableName = "Contact_Ngu";
    // Tên các cột trong bảng
    public static final String Id = "Id";
    public static final String Name = "Name";
    public static final String Phone = "Phone";
    public NguyenThiNgu_Sqlite(Context context, String name, SQLiteDatabase.CursorFactory factory, int version){
        super(context, name, factory, version);
    }
    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        //Tạo câu SQL để tạo bảng
        String sqlCreate = "Create table if not exists " + TableName + "("
                +Id +" Integer Primary key, "
                +Name +" Text,"
                +Phone +" Text)";
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
    public void addContact(Contact_Ngu item){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues value = new ContentValues();
        value.put(Id, item.getID());
        value.put(Name, item.getName());
        value.put(Phone, item.getPhone());
        db.insert(TableName, null, value);
        db.close();
    }
    public void updateContact(int id, Contact_Ngu item){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues value = new ContentValues();
        value.put(Id, item.getID());
        value.put(Name, item.getName());
        value.put(Phone, item.getPhone());
        db.update(TableName, value,Id +"=?",new String[]{String.valueOf(id)});
        db.close();
    }
    public void deleteContact(int id){
        SQLiteDatabase db = this.getWritableDatabase();
        String sql = "Delete From "+TableName+" Where ID = "+id;
        db.execSQL(sql);
        db.close();
    }
    public ArrayList<Contact_Ngu> getAllContact(){
        ArrayList<Contact_Ngu> list = new ArrayList<>();
        // câu truy vấn
        String sql = "Select * from "+TableName + " Order By Name ASC";
        //Lấy đối tượng csdl sqlite
        SQLiteDatabase db = this.getReadableDatabase();
        //Chạy câu truy vấn trả về dạng Cursor
        Cursor cursor = db.rawQuery(sql, null);
        // Tạo ArrayList<Contact> để trả về
        if(cursor != null){
            while (cursor.moveToNext()){
                Contact_Ngu item = new Contact_Ngu(cursor.getInt(0), cursor.getString(1),
                        cursor.getString(2));
                list.add(item);
            }
        }
        return list;
    }
}
