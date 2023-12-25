package com.example.listview_nc;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ListView listViewSinhvien;
    ArrayList<SinhVien> arrayListSV;
    Button buttonAdd;
    EditText editTextHoten, editTextNamsinh;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        listViewSinhvien = (ListView) findViewById(R.id.listViewSinhvien);

        arrayListSV = new ArrayList<SinhVien>();
        arrayListSV.add(new SinhVien("Nguyen Van A", 1990));
        arrayListSV.add(new SinhVien("Nguyen Van B", 1991));
        arrayListSV.add(new SinhVien("Nguyen Van C", 1992));
        arrayListSV.add(new SinhVien("Nguyen Van D", 1991));
        arrayListSV.add(new SinhVien("Nguyen Van E", 1992));

        SinhvienAdapter adapter = new SinhvienAdapter(MainActivity.this,
                R.layout.activity_list_item, arrayListSV);
        listViewSinhvien.setAdapter(adapter);
        listViewSinhvien.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(MainActivity.this, arrayListSV.get(i).Hoten + "" +
                        arrayListSV.get(i).Namsinh.toString(), Toast.LENGTH_SHORT);
            }
        });
        buttonAdd.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                if (!editTextHoten.getText().toString().equals("") &&
                ! editTextNamsinh.getText().toString().equals("")){
                    String ht = editTextHoten.getText().toString();
                    String ns = editTextNamsinh.getText().toString();
                    arrayListSV.add(new SinhVien(ht, Integer.parseInt(ns)));
                }
            }
        }) ;


    }

    private void initWidgets(){
        buttonAdd = (Button) findViewById(R.id.buttonAdd);
        editTextHoten = (EditText) findViewById(R.id.editTextHoten);
        editTextNamsinh = (EditText) findViewById(R.id.editTextNamsinh);
    }
}