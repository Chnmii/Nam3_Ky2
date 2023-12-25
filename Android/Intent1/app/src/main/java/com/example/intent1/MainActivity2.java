package com.example.intent1;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

public class MainActivity2 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
//        Bundle bundle = getIntent().getBundleExtra("MyBundle");
//        String ht = bundle.getString("HT");
//        int ns = bundle.getInt("NS");
//        String s = ht + String.valueOf(ns);
//        Toast.makeText(MainActivity2.this, s, Toast.LENGTH_SHORT).show();

        Intent intent = getIntent();
        String HT = intent.getStringExtra("Hoten");
        int NS = intent.getIntExtra("Ngaysinh", 0);
        Sinhvien sv = (Sinhvien) intent.getSerializableExtra("Sinh_vien");
        String s = HT + " " + NS + " " + sv;
        Toast.makeText(MainActivity2.this, s, Toast.LENGTH_SHORT).show();
    }
}