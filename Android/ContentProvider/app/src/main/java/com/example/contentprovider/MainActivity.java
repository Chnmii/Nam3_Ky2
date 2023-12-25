package com.example.contentprovider;

import android.Manifest;
import android.content.Intent;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.content.pm.PackageManager;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.CallLog;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button buttonShowContact, buttonCalllog, buttonMessage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Inits();
        GetPermission();
        buttonShowContact.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, ShowContact.class);
                startActivity(intent);
            }
        });
        //buttonMessage.setOnClickListener();
        buttonCalllog.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String [] projection = new String[]{
                        CallLog.Calls.DATE,
                        CallLog.Calls.NUMBER,
                        CallLog.Calls.DURATION
                };
                Cursor c = getContentResolver().query(CallLog.Calls.CONTENT_URI, projection,
                        CallLog.Calls.DURATION+"<?", new String[]{"30"},
                        CallLog.Calls.DATE+" Asc");
                c.moveToFirst();
                String s = "";
                while (!c.isAfterLast()){
                    for (int i =0; i<c.getColumnCount(); i++){
                        s = s + c.getString(i) + "-";
                    }
                    s = s + "\n";
                    c.moveToNext();
                }
                c.close();
                Toast.makeText(MainActivity.this, s, Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void GetPermission() {
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.READ_CONTACTS) !=
                PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this,
                    new String[]{Manifest.permission.READ_CONTACTS}, 999);
        }
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.READ_SMS) !=
                PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this,
                    new String[]{Manifest.permission.READ_SMS}, 999);
        }
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.READ_CALL_LOG) !=
                PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this,
                    new String[]{Manifest.permission.READ_CALL_LOG}, 999);
        }
    }

    private void Inits() {
        buttonShowContact = (Button) findViewById(R.id.buttonShowContact);
        buttonCalllog = (Button) findViewById(R.id.buttonCallLog);
        buttonMessage = (Button) findViewById(R.id.buttonMessage);
    }
}