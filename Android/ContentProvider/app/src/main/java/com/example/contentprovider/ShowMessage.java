package com.example.contentprovider;

import androidx.appcompat.app.AppCompatActivity;

import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

public class ShowMessage extends AppCompatActivity {
    ListView listViewMessage;
    Button buttonBack1;
    ArrayList<String> messageList;
    ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_message);
        Inits();
        buttonBack1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });

        messageList = new ArrayList<>();
        adapter = new ArrayAdapter<>(ShowMessage.this, android.R.layout.simple_list_item_1, messageList);
        listViewMessage.setAdapter(adapter);
        readMessage();
    }

    private void readMessage() {
        Uri uri = Uri.parse("content://sms");
        Cursor cursor = getContentResolver().query(uri, null, null, null, null);
        messageList.clear();
        while(cursor.moveToNext()){
            int index_phoneNumber = cursor.getColumnIndex("address");
            int index_date = cursor.getColumnIndex("date");
            int index_body = cursor.getColumnIndex("body");
            String phoneNumber = cursor.getString(index_phoneNumber);
            String date_ = cursor.getString(index_date);
            String body_ = cursor.getString(index_body);
            messageList.add(phoneNumber + "\n" + date_ + "\n" + body_);
        }
        cursor.close();
        adapter.notifyDataSetChanged();
    }

    private void Inits() {
        listViewMessage = (ListView) findViewById(R.id.listViewMessage);
        buttonBack1 = (Button) findViewById(R.id.buttonBack);
    }
}