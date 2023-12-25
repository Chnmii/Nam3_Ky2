package com.example.onthi;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class addItem extends AppCompatActivity {

    TextView txtID, txtName, txtPhone;
    Button btnThem, btnThoat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_item);

        txtID = findViewById(R.id.txtID);
        txtName = findViewById(R.id.txtName);
        txtPhone = findViewById(R.id.txtPhone);
        btnThem = findViewById(R.id.btnThem);
        btnThoat = findViewById(R.id.btnThoat);

        btnThem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String check = Validate(txtID.getText().toString(), txtName.getText().toString(), txtPhone.getText().toString());
                if(check == ""){
                    Intent intent = new Intent();
                    Bundle bundle = new Bundle();

                    Contact_Ngu item = new Contact_Ngu(Integer.parseInt(txtID.getText().toString()), txtName.getText().toString(),
                            txtPhone.getText().toString());
                    bundle.putSerializable("addItem", item);
                    intent.putExtras(bundle);
                    setResult(250, intent);
                    finish();
                }
                else{
                    Toast.makeText(addItem.this, check, Toast.LENGTH_LONG).show();
                }
            }
        });

        btnThoat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(addItem.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    private String Validate(String id, String name, String phone){
        if(id.equals("")){
            return "ID không được để trống";
        }
        if(name.equals("")){
            return "Name không được để trống";
        }
        if(phone.equals("")){
            return "Phone không được để trống";
        }
        if(phone.length() != 10){
            return "Phone phải gồm 10 số";
        }
        return "";
    }
}