package com.example.listview;

import static com.example.listview.R.id.spinnerMonhoc;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.Toast;

import java.util.ArrayList;
public class MainActivity extends AppCompatActivity {
    ListView listViewMonhoc;
    Spinner spinnerMonhoc;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        listViewMonhoc = (ListView) findViewById(R.id.listViewMonhoc);
        ArrayList<String> arrayListMonhoc = new ArrayList<String>();
        arrayListMonhoc.add("Java");
        arrayListMonhoc.add("Android");
        arrayListMonhoc.add("Database");
        arrayListMonhoc.add("Website");
        arrayListMonhoc.add("Computer");
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(MainActivity.this,
                android.R.layout.simple_list_item_1, arrayListMonhoc);
        listViewMonhoc.setAdapter(adapter);

        // su kien click
        listViewMonhoc.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                // i: tra ve vi tri click tren listView
                Toast.makeText(MainActivity.this,
                        arrayListMonhoc.get(i), Toast.LENGTH_SHORT).show();
            }
        });

        // su kien long click
        listViewMonhoc.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(MainActivity.this,
                        "Long click: " + i, Toast.LENGTH_SHORT).show();
                return false;
            }
        });

        spinnerMonhoc = (Spinner) findViewById(R.id.spinnerMonhoc);
        ArrayAdapter<String> adapter1 = new ArrayAdapter<String>(MainActivity.this,
                android.R.layout.simple_spinner_item, arrayListMonhoc);
        spinnerMonhoc.setAdapter(adapter1);
    }
}