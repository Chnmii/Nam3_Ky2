package com.example.intent;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class Screen2 extends AppCompatActivity {
    Button buttonBack;
    TextView textViewResult;
    String a,b;
    int sum;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_screen2);
        textViewResult = (TextView) findViewById(R.id.textViewResult);

        //lay intent
        Intent intent = getIntent();
        // lay du lieu tu intent

        a = intent.getStringExtra("Number1");
        b = intent.getStringExtra("Number2");
        sum = Integer.parseInt(a) + Integer.parseInt(b);
        textViewResult.setText("Result: "+String.valueOf(sum));

        buttonBack = (Button) findViewById(R.id.btnBack);
        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent1 = new Intent(Screen2.this, MainActivity.class);
                intent1.putExtra("N1",a);
                intent1.putExtra("N2",b);
                intent1.putExtra("KQ",String.valueOf(sum));
                startActivity(intent1);


            }
        });

    }
}
