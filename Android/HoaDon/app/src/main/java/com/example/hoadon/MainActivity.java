package com.example.hoadon;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.SearchView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView lsvHoadon;
    FloatingActionButton btnAdd;
    NgoThiTrang_Adapter hoaDonAdapter;
    ArrayList<HoaDon_NgoThiTrang> arrayList;
    NgoThiTrang_DB database = new NgoThiTrang_DB(this);
    int viTriDangchon = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        InitWidget();

        database.DeleteAll();
        database.addKhachHang(new HoaDon_NgoThiTrang(1, "Vũ Trường An", 401, 1200000, 2));
        database.addKhachHang(new HoaDon_NgoThiTrang(2, "Lê Hải Hà", 402, 1500000, 3));
        database.addKhachHang(new HoaDon_NgoThiTrang(3, "Hà Thị Thu", 403, 1200000, 4));
        database.addKhachHang(new HoaDon_NgoThiTrang(4, "Mạc Văn Minh", 401, 2100000, 1));
        database.addKhachHang(new HoaDon_NgoThiTrang(5, "Ngô Thị Trang", 410, 1500000, 5));

        arrayList = database.getAll();
        System.out.print("So luong:" + arrayList.size());
        hoaDonAdapter = new NgoThiTrang_Adapter(this, arrayList);
        lsvHoadon.setAdapter(hoaDonAdapter);

//        btnAdd.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent intent = new Intent(MainActivity.this, .class);
//                System.out.println("So luong co trong arraylist" + arrayList.size());
//                intent.putExtra("SL", arrayList.size());
//                startActivity(intent);
//            }
//        });
    }

    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        lsvHoadon = (ListView) findViewById(R.id.ltvMain);
        btnAdd = (FloatingActionButton) findViewById(R.id.btnAdd);
    }
}