package com.example.onthi;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

public class MainActivity extends AppCompatActivity {

    TextView txtSearch;
    Button btnADD;
    ArrayList<Contact_Ngu> arrayList;
    NguyenThiNgu_Adapter nguyenThiNgu_adapter;
    ListView listView;
    NguyenThiNgu_Sqlite mysql = new NguyenThiNgu_Sqlite(this, "Contact_Ngu", null, 2);

    AlertDialog.Builder checkItem;
    int ID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtSearch = findViewById(R.id.txtSearch);
        btnADD = findViewById(R.id.btnADD);
        listView = findViewById(R.id.listView);

//        mysql.addContact(new Contact_Ngu(1, "Nam", "0987983793"));
//        mysql.addContact(new Contact_Ngu(2, "Hữu Thắng", "0986774235"));
//        mysql.addContact(new Contact_Ngu(3, "Toan", "0949739503"));
//        mysql.addContact(new Contact_Ngu(4, "Nguyễn Thị Ngũ", "0362871301"));
//        mysql.addContact(new Contact_Ngu(5, "Hoàng Anh", "0987886445"));

        arrayList = mysql.getAllContact();

        nguyenThiNgu_adapter = new NguyenThiNgu_Adapter(this, arrayList);
        listView.setAdapter(nguyenThiNgu_adapter);

        btnADD.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, addItem.class);
                startActivityForResult(intent, 150);
            }
        });
        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                ID = i;
                registerForContextMenu(view); // cái này để gọi ra menu
                return true;
            }
        });
    }

    @Override // over lại hàm gọi menu
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        getMenuInflater().inflate(R.menu.menu, menu); // gọi
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item) { // xử lý khi click vào 1 item
        switch (item.getItemId()){
            case R.id.delete:{

                checkItem= new AlertDialog.Builder(this);
                checkItem.setMessage("Nguyễn Thị Ngũ wants to delete")
                        .setCancelable(false)
                        .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                mysql.deleteContact(arrayList.get(ID).getID());
                                arrayList.remove(arrayList.get(ID));
                                listView.setAdapter(nguyenThiNgu_adapter);
                            }

                        })
                        .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                dialog.cancel();
                            }
                        });
                AlertDialog alert = checkItem.create();
                alert.show();
                break;
            }
            case R.id.edit:{
                Toast.makeText(MainActivity.this, "Check", Toast.LENGTH_LONG).show();
                break;
            }
        }
            return super.onContextItemSelected(item);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Bundle bundle = data.getExtras();
        Contact_Ngu item = (Contact_Ngu) bundle.getSerializable("addItem");

        if(requestCode ==150 && resultCode == 250){
            mysql.addContact(item);
            arrayList.clear();
            arrayList = mysql.getAllContact();
            nguyenThiNgu_adapter = new NguyenThiNgu_Adapter(this, arrayList);
            listView.setAdapter(nguyenThiNgu_adapter);
            //nguyenThiNgu_adapter.notifyDataSetChanged();

        }
    }

}