package com.example.intentresult;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity2 extends AppCompatActivity {

    TextView textViewNhan;
    Button buttonTinh;
    Intent intent;
    int a,b;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        Init();
        buttonTinh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                int c = a+b;
                intent.putExtra("Tong", c);
                // danh dau ket qua tra ve
                setResult(33, intent);
                // phai dong man hinh 2 bang lenh finish()
                finish();
            }
        });
    }

    private void Init() {
        textViewNhan = (TextView) findViewById(R.id.textViewNhan);
        buttonTinh = (Button) findViewById(R.id.buttonTinh);
        intent = getIntent();
        a = intent.getIntExtra("a", -1);
        b = intent.getIntExtra("b", -1);
        textViewNhan.setText("a= " + a + ", b= " + b);
    }

}