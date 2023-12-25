package com.example.buoi2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    EditText editTextHoten;
    RadioButton radioButtonNam, radioButtonNu;
    CheckBox checkBoxThethao, checkBoxDulich, checkBoxDocsach;
    Button buttonOk;
    TextView textViewKq;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        InitWidgets();
        buttonOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String s = "";
                s = s + editTextHoten.getText().toString();
                if (radioButtonNam.isChecked()){
                    s = s + " " + radioButtonNam.getText().toString();
                }
                if (radioButtonNu.isChecked()){
                    s = s + " " + radioButtonNu.getText().toString();
                }
                if (checkBoxThethao.isChecked()){
                    s = s + " " + checkBoxThethao.getText().toString();
                }
                if (checkBoxDulich.isChecked()){
                    s = s + " " + checkBoxDulich.getText().toString();
                }
                if (checkBoxDocsach.isChecked()){
                    s = s + " " + checkBoxDocsach.getText().toString();
                }
                textViewKq.setText(s);
                Toast.makeText(MainActivity.this, s,
                        Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void InitWidgets() {
        editTextHoten = (EditText) findViewById(R.id.editTextHoten);
        radioButtonNam = (RadioButton) findViewById(R.id.radioButtonNam);
        radioButtonNu = (RadioButton) findViewById(R.id.radioButtonNu);
        checkBoxThethao = (CheckBox) findViewById(R.id.checkBoxThethao);
        checkBoxDulich = (CheckBox) findViewById(R.id.checkBoxDulich);
        checkBoxDocsach = (CheckBox) findViewById(R.id.checkBoxDocsach);
        textViewKq = (TextView) findViewById(R.id.textViewKq);
        buttonOk = (Button) findViewById(R.id.buttonOk);
    }


}