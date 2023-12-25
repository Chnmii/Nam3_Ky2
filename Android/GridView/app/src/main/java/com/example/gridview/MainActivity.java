package com.example.gridview;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.GridView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    GridView gridView;
    ArrayList<HinhAnh> arrayListImage;
    HinhAnhAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        gridView = (GridView) findViewById(R.id.gridView);
        arrayListImage = new ArrayList<>();
        arrayListImage.add(new HinhAnh("Hinh so 1", R.drawable.iu));

        adapter = new HinhAnhAdapter(MainActivity.this,
                R.layout.itemhinhanh, arrayListImage);
        gridView.setAdapter(adapter);

        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(MainActivity.this,
                        arrayListImage.get(i).getTen(), Toast.LENGTH_SHORT).show();
            }
        });
        // tao du lieu
        /*final String[] kytu = new String[]{
                "A", "B", "C", "D", "E", "F", "G",
                "H", "I", "K", "L", "M", "N", "O",
                "P", "Q", "R", "S", "T", "U", "V",
                "X", "Y",
        };
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
                MainActivity.this, android.R.layout.simple_list_item_1, kytu);
        gridView.setAdapter(adapter);
        gridView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(MainActivity.this, kytu[i], Toast.LENGTH_SHORT).show();
            }
        });*/

    }
}