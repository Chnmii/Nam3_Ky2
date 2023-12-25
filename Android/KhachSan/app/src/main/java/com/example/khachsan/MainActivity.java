package com.example.khachsan;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView lsvHoadon;
    KhachSanAdapter adapter;
    ArrayList<KhachSan> arrayList;
    SQLite_02 database = new SQLite_02(this);
    int viTriDangchon = -1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        InitWidget();
        //database.DeleteAll();
        database.addKhachHang(new KhachSan(1, "Ngô Thị Trang", 301, 1200000, 5));
        database.addKhachHang(new KhachSan(2, "Vũ Trường An", 405, 2500000, 8));
        database.addKhachHang(new KhachSan(3, "Lê Hải Hà", 501, 2300000, 6));
        database.addKhachHang(new KhachSan(4, "Hà Thị Thu", 415, 1250000, 10));
        database.addKhachHang(new KhachSan(5, "Mạc Văn Minh", 802, 1050000, 5));

        arrayList = database.getAll();
        adapter = new KhachSanAdapter(this, arrayList);
        lsvHoadon.setAdapter(adapter);



    }

    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        lsvHoadon = (ListView) findViewById(R.id.lsvHoadon);
    }
}