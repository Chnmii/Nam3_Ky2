package com.example.sqlite;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.database.Cursor;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    EditText editTextId, editTextHoten, editTextNamsinh;
    Button buttonInsert, buttonUpdate, buttonDelete, buttonLoadAll, buttonSearch;
    TextView textViewData;
    ListView listViewDanhSach;
    MyDBHelper dbHelper = new MyDBHelper(this);

    @Override
    protected void onStart() {
        super.onStart();
        dbHelper.openDB();

    }

    @Override
    protected void onStop() {
        super.onStop();
        dbHelper.closeDB();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Init();
        dbHelper = new MyDBHelper(MainActivity.this);
        buttonInsert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                long resultAdd = dbHelper.Insert(editTextHoten.getText().toString(),
                        Integer.parseInt(editTextNamsinh.getText().toString()));
                if(resultAdd == -1){
                    Toast.makeText(MainActivity.this, "Error", Toast.LENGTH_SHORT).show();
                }
                else{
                    Toast.makeText(MainActivity.this, "Inserted", Toast.LENGTH_SHORT).show();
                }
            }
        });
        buttonUpdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                long resultUpdate = dbHelper.Update(Integer.parseInt(editTextId.getText().toString()),
                        editTextHoten.getText().toString(),
                        Integer.parseInt(editTextNamsinh.getText().toString()));
                if(resultUpdate == -1){
                    Toast.makeText(MainActivity.this, "Error", Toast.LENGTH_SHORT).show();
                }
                else{
                    Toast.makeText(MainActivity.this, "Updated", Toast.LENGTH_SHORT).show();
                }
            }
        });
        buttonDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                long resultDelete = dbHelper.Delete(Integer.parseInt(editTextId.getText().toString()));
                if(resultDelete == 0){
                    Toast.makeText(MainActivity.this, "Error", Toast.LENGTH_SHORT).show();
                }
                else{
                    Toast.makeText(MainActivity.this, "Deleted", Toast.LENGTH_SHORT).show();
                }
            }
        });
        buttonLoadAll.setOnClickListener(new View.OnClickListener() {
            @SuppressLint("Range")
            @Override
            public void onClick(View view) {
                StringBuffer buffer = new StringBuffer();
                Cursor cursor = dbHelper.DisplayAll();
                for (cursor.moveToFirst(); cursor.isAfterLast(); cursor.moveToNext()){
                    buffer.append(cursor.getString((cursor.getColumnIndex(MyDBHelper.getID()))));
                    buffer.append("-");
                    buffer.append(cursor.getString(cursor.getColumnIndex(MyDBHelper.getNAME())));
                    buffer.append("-");
                    buffer.append(cursor.getString(cursor.getColumnIndex(MyDBHelper.getYEAROB())));
                    buffer.append("\n");
                }
                textViewData.setText(buffer);
            }

        });

        buttonSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });

    }

    private void Init() {
        editTextId = (EditText) findViewById(R.id.editTextID);
        editTextHoten = (EditText) findViewById(R.id.editTextHoten);
        editTextNamsinh = (EditText) findViewById(R.id.editTextNamsinh);
        buttonInsert = (Button) findViewById(R.id.buttonInsert);
        buttonDelete = (Button) findViewById(R.id.buttonDelete);
        buttonUpdate = (Button) findViewById(R.id.buttonUpdate);
        buttonLoadAll = (Button) findViewById(R.id.buttonLoadAll);
        buttonSearch = (Button) findViewById(R.id.buttonSearch);
        textViewData = (TextView) findViewById(R.id.textViewData);
        listViewDanhSach = (ListView) findViewById(R.id.listViewDanhSach);
    }
}