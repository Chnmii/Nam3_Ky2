package com.example.hoadontaxi;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SearchView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;
import java.util.Collections;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView ltvMain;
    FloatingActionButton btnAdd;
    TaxiAdapter adapter;
    ArrayList<Taxi> arrayList;

    SQLiteDB_2804 database = new SQLiteDB_2804(this);
    int vitri = -1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        Inits();
        database.addTaxi(new Taxi(1, "18F1-365.01", 12.5, 8800,5));
        database.addTaxi(new Taxi(2, "29D2-283.34", 14.5, 11000,5));
        database.addTaxi(new Taxi(3, "29M3-648.87", 12.5, 9000,5));
        database.addTaxi(new Taxi(4, "29Y4-374.42", 12.5, 4500,5));
        database.addTaxi(new Taxi(5, "02", 12.5, 8800,5));
        database.addTaxi(new Taxi(6, "30K1-374.34", 12.5, 6400,5));

        arrayList = database.getAll();
        Collections.sort(arrayList);
        adapter = new TaxiAdapter(this, arrayList);
        ltvMain.setAdapter(adapter);

        ltvMain.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                vitri = i;
                registerForContextMenu(ltvMain);

                return false;
            }
        });
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item){
        if (item.getItemId() == R.id.itemSua){
            int ma = arrayList.get(vitri).getMa();
            String Soxe = arrayList.get(vitri).getSoxe();
            double Quangduong = arrayList.get(vitri).getQuangDuong();
            int dongia = arrayList.get(vitri).getDonGia();
            int khuyenmai = arrayList.get(vitri).getKhuyenMai();
            Intent it = new Intent(this, SuaActivity.class);
            it.putExtra("ID", ma);
            it.putExtra("SOXE", Soxe);
            it.putExtra("QUANGDUONG", Quangduong);
            it.putExtra("DONGIA", dongia);
            it.putExtra("KHUYENMAI", khuyenmai);
            startActivity(it);
        }
        return super.onContextItemSelected(item);
    }

    @Override
    public  void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo contextMenuInfo){
        super.onCreateContextMenu(menu, v, contextMenuInfo);
        getMenuInflater().inflate(R.menu.menu, menu);
    }

    private void Inits() {
        editSearch = (SearchView) findViewById(R.id.editSearch);
        ltvMain = (ListView) findViewById(R.id.ltvMain);
        btnAdd = (FloatingActionButton) findViewById(R.id.btnAdd);
    }
}