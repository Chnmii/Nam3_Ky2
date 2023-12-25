package com.example.testde2;

import androidx.appcompat.app.AppCompatActivity;

import android.hardware.ConsumerIrManager;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView lsvHoadon;
    HoadonAdapter adapter;
    ArrayList<HoaDon_3009> arrayList;
    Sqlite_MaDe database = new Sqlite_MaDe(this);
    int viTriDangchon = -1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        InitWidget();
//        database.DeleteAll();
        database.addTaxi(new HoaDon_3009(1, "Lmao", 301, 1200000, 5));
        database.addTaxi(new HoaDon_3009(2, "Nguyen A", 401, 1250000, 4));
        database.addTaxi(new HoaDon_3009(3, "Ca Kho", 501, 1300000, 2));
        database.addTaxi(new HoaDon_3009(4, "Death Stranding", 302, 1100000, 1));

        arrayList = database.getAll();
        adapter = new HoadonAdapter(this, arrayList);
        lsvHoadon.setAdapter(adapter);

        editSearch.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String s) {
//                adapter.getFilter().filter(s);
                return false;
            }

            @Override
            public boolean onQueryTextChange(String s) {
//                adapter.getFilter().filter(s);
                arrayList = database.getAllBySearch(s);

                adapter = new HoadonAdapter(MainActivity.this, arrayList);
                lsvHoadon.setAdapter(adapter);
                return true;
            }
        });

        lsvHoadon.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                int count = 0;
                int money = arrayList.get(i).getTongtien();
                for (HoaDon_3009 x: arrayList ) {
                    if(x.getTongtien() > money){
                        count++;
                    }
                }
                Toast.makeText(MainActivity.this,"Nguyễn Hai Dang, Số lượng hóa đơn: " + count, Toast.LENGTH_LONG).show();
                return false;
            }
        });
    }

    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        lsvHoadon = (ListView) findViewById(R.id.lsvHoadon);
    }
}