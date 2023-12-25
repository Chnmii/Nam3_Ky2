package com.example.dethi1;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.io.Serializable;

public class EditItem extends AppCompatActivity {

    TextView txtSoXe, txtQuangDuong, txtDonGia, txtKhuyenMai;
    Button btnEdit, btnExit;
    Taxi_Ma01 x = new Taxi_Ma01();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_item);

        txtSoXe = findViewById(R.id.txt_soXe);
        txtDonGia = findViewById(R.id.txt_donGia);
        txtQuangDuong = findViewById(R.id.txt_quangDuong);
        txtKhuyenMai = findViewById(R.id.txt_khuyenMai);

        btnEdit = findViewById(R.id.btnEdit);
        btnExit = findViewById(R.id.btnExit);
        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();
        if(bundle != null){
            x = (Taxi_Ma01) bundle.getSerializable("editID");
            txtSoXe.setText(x.getSoXe());
            txtDonGia.setText(String.valueOf(x.getDonGia()));
            txtQuangDuong.setText(String.valueOf(x.getQuangDuong()));
            txtKhuyenMai.setText(String.valueOf(x.getKhyenMai()));

        }

        btnExit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EditItem.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        });

        btnEdit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String validate = isValidate(txtSoXe.getText().toString(), txtDonGia.getText().toString(),
                        txtQuangDuong.getText().toString(), txtKhuyenMai.getText().toString());
                if(validate.equals("")){
                    Intent intent = new Intent();
                    Bundle bundle = new Bundle();

                    Taxi_Ma01 item = new Taxi_Ma01(txtSoXe.getText().toString(),Float.parseFloat(txtQuangDuong.getText().toString()),
                            Float.parseFloat( txtDonGia.getText().toString()),Integer.parseInt(txtKhuyenMai.getText().toString()));
                    bundle.putSerializable("addItem", item);
                    intent.putExtras(bundle);
                    setResult(250, intent);
                    finish();
                }
                else {
                    Toast.makeText(EditItem.this, validate, Toast.LENGTH_LONG).show();
                }
            }
        });
    }

//    @Override
//    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
//        super.onActivityResult(requestCode, resultCode, data);
//        Bundle bundle = data.getExtras();
//
//    }

    private String isValidate(String soXe,String donGia,String quangDuong, String khuyenMai){
        if(soXe.equals("")) return "Số xe không được để trống";
        if(donGia.equals("")) return "Đơn giá không được để trống";
        if(quangDuong.equals("")) return  "Quãng đường không được để trống";
        if(khuyenMai.equals("")) return "Khuyến mãi không được để trống";
        return "";
    }
}