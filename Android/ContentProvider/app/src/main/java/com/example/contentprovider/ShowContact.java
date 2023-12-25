package com.example.contentprovider;

import androidx.appcompat.app.AppCompatActivity;

import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.provider.ContactsContract;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

public class ShowContact extends AppCompatActivity {

    ListView listViewContact;
    Button buttonBack;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_contact);
        Inits();
        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
        ShowContact1();
    }

    private void ShowContact1() {
        // lay danh ba
        Uri uri = Uri.parse("content://contacts/people");
        // arrayList
        ArrayList<String> list = new ArrayList<String>();
        Cursor c1 = getContentResolver().query(uri, null, null, null, null);
        c1.moveToFirst();
        while (!c1.isAfterLast()){
            String s = "";
            String idColumnName = ContactsContract.Contacts._ID;
            int idIndex = c1.getColumnIndex(idColumnName);
            s = c1.getString(idIndex) + "-";
            String nameColumnName = ContactsContract.Contacts.DISPLAY_NAME;
            int nameIndex = c1.getColumnIndex(nameColumnName);
            s = s + c1.getString(nameIndex);
            c1.moveToNext();
            // add vao ArrayList
            list.add(s);
        }
        c1.close();
        // add vao listView
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, list);
        listViewContact.setAdapter(adapter);
    }

    private void Inits() {
        listViewContact = (ListView) findViewById(R.id.listViewContact);
        buttonBack = (Button) findViewById(R.id.buttonBack);
    }
}