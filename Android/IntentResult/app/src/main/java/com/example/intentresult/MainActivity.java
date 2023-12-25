package com.example.intentresult;

import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    EditText editTextSoA, editTextSoB;
    Button buttonSend;
    TextView textViewKq;
/*    private ActivityResultLauncher<Intent> mActivityResultLauncher =
            registerForActivityResult(new ActivityResultContracts.StartActivityForResult(),
                    new ActivityResultCallback<ActivityResult>() {
                        @Override
                        public void onActivityResult(ActivityResult result) {
                            if(result.getResultCode()==33){
                                Intent intent = result.getData();
                                int t = intent.getIntExtra("tong ", -1);
                            }
                        }
                    });*/
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Init();
        buttonSend.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                xuly();
            }
        });
    }
    private void xuly() {
        Intent intent = new Intent(MainActivity.this, MainActivity2.class);
        intent.putExtra("a", Integer.parseInt(editTextSoA.getText().toString()));
        intent.putExtra("b", Integer.parseInt(editTextSoB.getText().toString()));
        // nhan ket qua tra ve
        startActivityForResult(intent, 99);
        //mActivityResultLauncher.launch(intent);

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == 99 && resultCode == 33){
            int t = data.getIntExtra("Tong", 1);
            textViewKq.setText("Tong  = " + t);
        }
    }

    private void Init() {
        editTextSoA = (EditText) findViewById(R.id.editTextSoA);
        editTextSoB = (EditText) findViewById(R.id.editTextSoB);
        buttonSend = (Button) findViewById(R.id.buttonSend);
        textViewKq = (TextView) findViewById(R.id.textViewKq);
    }
}