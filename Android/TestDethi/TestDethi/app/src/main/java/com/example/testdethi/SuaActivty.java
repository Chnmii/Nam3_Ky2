package com.example.testdethi;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Button;

public class SuaActivty extends AppCompatActivity {
    Database database = new Database(this);
    private TextView txtSoxe, txtQuangduong, txtDongia, txtKhuyenmai;
    private Button btnUpdate, btnBack;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sua_activty);
        getSupportActionBar().hide();
        InitWidget();
        Intent it = getIntent();
        int ma = it.getIntExtra("ID", 0);
        String Soxe = it.getStringExtra("SOXE");
        double Quangduong = it.getDoubleExtra("QUANGDUONG", 0);
        int Dongia = it.getIntExtra("DONGIA", 0);
        int Khuyenmai = it.getIntExtra("KHUYENMAI", 0);
        txtSoxe.setText(Soxe + "");
        txtQuangduong.setText(Quangduong + "");
        txtDongia.setText(Dongia + "");
        txtKhuyenmai.setText(Khuyenmai + "");
        btnUpdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Taxi taxi = new Taxi(ma, txtSoxe.getText().toString(), Double.parseDouble(txtQuangduong.getText().toString()), Integer.parseInt(txtDongia.getText().toString()), Integer.parseInt(txtKhuyenmai.getText().toString()));
                database.updateTaxi(taxi);
                Intent intent = new Intent(SuaActivty.this, MainActivity.class);
                startActivity(intent);
//                Intent intent = new Intent();
//                Bundle bundle = new Bundle();
//                bundle.putSerializable("editItem", taxi);
//                intent.putExtras(bundle);
//                setResult(RESULT_OK, intent);
//                finish();
            }
        });

        btnBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(SuaActivty.this, MainActivity.class);
                startActivity(intent);
            }
        });
    }

    void InitWidget(){
        txtSoxe = (EditText) findViewById(R.id.editSoxe);
        txtQuangduong = (EditText) findViewById(R.id.editQuangduong);
        txtDongia = (EditText) findViewById(R.id.editDonGia);
        txtKhuyenmai = (EditText) findViewById(R.id.editKhuyenmai);
        btnUpdate = (Button)findViewById(R.id.btnUpdate);
        btnBack = (Button) findViewById(R.id.btnBack);
    }
}