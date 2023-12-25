package com.example.test_listviewnc;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ListView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ListView listViewTraicay;
    ArrayList<TraiCay> traiCayArrayList;
    TraicayAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Init();
        adapter = new TraicayAdapter(this, R.layout.dong_trai_cay, traiCayArrayList);
        listViewTraicay.setAdapter(adapter);
    }

    private void Init() {
        listViewTraicay = (ListView) findViewById(R.id.listViewTraicay);
        traiCayArrayList = new ArrayList<>();
        traiCayArrayList.add(new TraiCay("Dau tay", "Dau tay Da Lat", R.drawable.dautay));
        traiCayArrayList.add(new TraiCay("Dua hau", "Dua hau mat lanh", R.drawable.duahau));
        traiCayArrayList.add(new TraiCay("Cam", "Cam mong nuoc", R.drawable.cam));
        traiCayArrayList.add(new TraiCay("Qua le", "Le cho mua he", R.drawable.quale));
    }
}