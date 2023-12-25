package com.example.ktra;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ListView;
import android.widget.SearchView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView lsvHoadon;
    FloatingActionButton btnAdd;
    SanphamAdapter hoaDonAdapter;
    ArrayList<Sanpham> arrayList;
    Database database = new Database(this);
    int viTriDangchon = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        InitWidget();

        database.DeleteAll();
        database.addKhachHang(new Sanpham(1, "Tủ lạnh", 14500000, 0));
        database.addKhachHang(new Sanpham(2, "Điện thoại", 8500000, 2));
        database.addKhachHang(new Sanpham(3, "Tivi", 10500000, 5));
        database.addKhachHang(new Sanpham(4, "Lò vi sóng", 4500000, 2));
        database.addKhachHang(new Sanpham(5, "Máy lạnh", 12000000, 1));


        arrayList = database.getAll();
        hoaDonAdapter = new SanphamAdapter(this, arrayList);
        lsvHoadon.setAdapter(hoaDonAdapter);

    }
    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        lsvHoadon = (ListView) findViewById(R.id.ltvMain);
        btnAdd = (FloatingActionButton) findViewById(R.id.btnAdd);
    }
}