package com.example.testde3;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.Button;
import android.widget.SearchView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView lsvHoadon;
    Button btnAdd;
    HoaDonAdapter hoaDonAdapter;
    ArrayList<HoaDon_HaiDang> arrayList;
    Database database = new Database(this);
    int viTriDangchon = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        InitWidget();

//        database.DeleteAll();
        database.AddHoaDon(new HoaDon_HaiDang(1, "Nguyen A", 401, 1200000, 2));
        database.AddHoaDon(new HoaDon_HaiDang(2, "Nguyen B", 402, 1500000, 3));
        database.AddHoaDon(new HoaDon_HaiDang(3, "Nguyen A", 403, 1200000, 4));
        database.AddHoaDon(new HoaDon_HaiDang(4, "Nguyen AC", 401, 2100000, 1));

        arrayList = database.getAll();
        hoaDonAdapter = new HoaDonAdapter(this, arrayList);
        lsvHoadon.setAdapter(hoaDonAdapter);

        btnAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, AddHoaDon.class);
                System.out.println("So luong co trong arraylist" + arrayList.size());
                intent.putExtra("SL", arrayList.size());
                startActivity(intent);
            }
        });
    }

    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        lsvHoadon = (ListView) findViewById(R.id.lsvHoadon);
        btnAdd = (Button) findViewById(R.id.btnAdd);
    }
}