package com.example.testdethi;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SearchView;

import java.io.Console;
import java.util.ArrayList;
import java.util.Collections;

public class MainActivity extends AppCompatActivity {
    SearchView editSearch;
    ListView lsvTaxi;
    TaxiAdapter taxiAdapter;
    ArrayList<Taxi> taxiArrayList;
    Database database = new Database(this);
    int viTriDangchon = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Ẩn ActionBar (thanh tiêu đề)
        getSupportActionBar().hide();
        InitWidget();
//        database.DeleteAll();
        database.addTaxi(new Taxi(1, "29D2-283.34", 12.5, 8800, 5));
        database.addTaxi(new Taxi(2, "30D2-123.34", 10.5, 8800, 0));
        database.addTaxi(new Taxi(3, "89B1-771.34", 9, 8800, 0));
        database.addTaxi(new Taxi(4, "34C2-123.45", 7.5, 8800, 0));
        database.addTaxi(new Taxi(5, "98D1-113.34", 15.6, 8800, 10));
        taxiArrayList = database.getAll();
        Collections.sort(taxiArrayList);
        taxiAdapter = new TaxiAdapter(this, taxiArrayList);
        lsvTaxi.setAdapter(taxiAdapter);
        lsvTaxi.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
                viTriDangchon = position;
                registerForContextMenu(lsvTaxi);
                return false;
            }
        });

        editSearch.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                taxiAdapter.getFilter().filter(query);
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                taxiArrayList = database.getAllBySearch(newText);
                taxiAdapter = new TaxiAdapter(MainActivity.this, taxiArrayList);
                lsvTaxi.setAdapter(taxiAdapter);
                return true;
            }
        });
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item){
        if(item.getItemId() == R.id.itemSua){
            int ma = taxiArrayList.get(viTriDangchon).getMa();
            System.out.println("Gui sang Edit co ma " + ma);
            String Soxe = taxiArrayList.get(viTriDangchon).getSoxe();
            double Quangduong = taxiArrayList.get(viTriDangchon).getQuangduong();
            int Dongia = taxiArrayList.get(viTriDangchon).getDongia();
            int Khuyenmai = taxiArrayList.get(viTriDangchon).getKhuyenmai();
            Intent it = new Intent(this, SuaActivty.class);
            it.putExtra("ID", ma);
            it.putExtra("SOXE", Soxe);
            it.putExtra("QUANGDUONG", Quangduong);
            it.putExtra("DONGIA", Dongia);
            it.putExtra("KHUYENMAI", Khuyenmai);

            startActivity(it);
//            startActivityForResult(it, 150);
        }

        return super.onContextItemSelected(item);
    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, v, menuInfo);
        getMenuInflater().inflate(R.menu.menu, menu);
    }

//    @Override
//    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
//        super.onActivityResult(requestCode, resultCode, data);
//        Bundle bundle = data.getExtras();
//        Taxi item = (Taxi) bundle.getSerializable("editItem");
//
//        if(resultCode == RESULT_OK){
//            taxiArrayList.set(viTriDangchon, item);
//            database.updateTaxi(item);
//            lsvTaxi.setAdapter(taxiAdapter);
//            taxiAdapter.notifyDataSetChanged();
//            System.out.println("Da in");
//        }
//    }

    void InitWidget(){
        editSearch = (SearchView) findViewById(R.id.editSearch);
        lsvTaxi = (ListView) findViewById(R.id.lsvTaxi);
    }
}