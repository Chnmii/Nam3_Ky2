package com.example.intent1;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Spinner;

public class MainActivity extends AppCompatActivity {

    Button buttonSend, buttonSendObject;
    EditText editTextHoten, editTextNgaysinh;
    RadioButton radioButtonNam, radioButtonNu;
    CheckBox checkBoxThethao, checkBoxDulich;
    Spinner spinnerQuoctich;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Init();
        buttonSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, MainActivity2.class);
                Bundle bundle = new Bundle();
                bundle.putString("HT", editTextHoten.getText().toString());
                bundle.putInt("NS", Integer.parseInt(editTextNgaysinh.getText().toString()));
                bundle.putString("QT", spinnerQuoctich.getSelectedItem().toString());
                if (radioButtonNam.isChecked()){
                    bundle.putString("GT", radioButtonNam.getText().toString());
                }
                if (radioButtonNu.isChecked()){
                    bundle.putString("GT", radioButtonNu.getText().toString());
                }
                String st = "" ;
                if(checkBoxThethao.isChecked()){
                    st = st + checkBoxThethao.getText().toString();
                }
                if(checkBoxDulich.isChecked()){
                    st = st + checkBoxDulich.getText().toString();
                }
                intent.putExtra("MyBundle", bundle);
                startActivity(intent);

            }
        });

        buttonSendObject.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, MainActivity2.class);
                String HT = editTextHoten.getText().toString();
                Integer NS = Integer.parseInt(editTextNgaysinh.getText().toString());
                intent.putExtra("HoTen", HT);
                intent.putExtra("Ngaysinh", NS);
                Sinhvien sv = new Sinhvien(1, "Hanoi");
                intent.putExtra("Sinhvien", sv);
                startActivity(intent);
            }
        });
    }

    private void Init(){
        buttonSend = (Button) findViewById(R.id.buttonSend);
        editTextHoten = (EditText) findViewById(R.id.editTextHoten);
        editTextNgaysinh = (EditText) findViewById(R.id.editTextNgaysinh);
        radioButtonNam = (RadioButton) findViewById(R.id.radioButtonNam);
        radioButtonNu = (RadioButton) findViewById(R.id.radioButtonNu);
    }

}