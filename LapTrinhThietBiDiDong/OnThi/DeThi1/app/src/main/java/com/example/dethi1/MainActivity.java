package com.example.dethi1;

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
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.Serializable;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    TextView editSearch;
    ListView listView;
    ArrayList<Taxi_Ma01> arrayList;
    Adapter_Ma01 adapter_ma01;
    int ID;
    AlertDialog.Builder checkItem;

    SqlitDB_3107 mysql = new SqlitDB_3107(this, "Taxi_Ma01", null, 1);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editSearch = findViewById(R.id.editSearch);
        listView = findViewById(R.id.listView);

//        mysql.addContact(new Taxi_Ma01("29D2-283.34", 14.3f, 100.100f, 2));
//        mysql.addContact(new Taxi_Ma01("29M3-857.65", 9.6f, 81.600f, 5));
//        mysql.addContact(new Taxi_Ma01("29T2-648.87", 6.5f, 58.500f, 2));
//        mysql.addContact(new Taxi_Ma01("29T4-746.75", 5f, 42.300f, 1));
//        mysql.addContact(new Taxi_Ma01("30K1-129.84", 5f, 42.300f, 1));
//        mysql.addContact(new Taxi_Ma01("30K1-129.84", 6f, 82.800f, 5));

        arrayList = mysql.getAllContact();

        adapter_ma01 = new Adapter_Ma01(this, arrayList);
        listView.setAdapter(adapter_ma01);

        for(Taxi_Ma01 x: arrayList){
            Toast.makeText(MainActivity.this, x.toString(), Toast.LENGTH_LONG).show();
        }

        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                ID = i;
                registerForContextMenu(view); // cái này để gọi ra menu
                return false;
            }
        });

    }
    @Override
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        getMenuInflater().inflate(R.menu.menu, menu);
    }

    @Override
    public boolean onContextItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()){
            case R.id.delete:{

                checkItem= new AlertDialog.Builder(this);
                checkItem.setMessage("Nguyễn Thị Ngũ wants to delete")
                        .setCancelable(false)
                        .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int id) {
                                mysql.deleteContact(arrayList.get(ID).getID());
                                arrayList.remove(arrayList.get(ID));
                                listView.setAdapter(adapter_ma01);
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
                Intent intent = new Intent(MainActivity.this, EditItem.class);
                Bundle bundle = new Bundle();

                Taxi_Ma01 x = new Taxi_Ma01(arrayList.get(ID).getSoXe(),arrayList.get(ID).getQuangDuong(),
                        arrayList.get(ID).getDonGia(), arrayList.get(ID).getKhyenMai());

                bundle.putSerializable("editID", x);
                intent.putExtras(bundle);
                startActivityForResult(intent, 150);
                break;
            }
        }
        return super.onContextItemSelected(item);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Bundle bundle = data.getExtras();
        Taxi_Ma01 item = (Taxi_Ma01) bundle.getSerializable("addItem");
// đang sai
        if(requestCode ==150 && resultCode == 250){
            // Phải thêm dòng này vì thằng item từ EditItem về chưa có id
            item.setID(arrayList.get(ID).getID());
            arrayList.set(ID, item);
            mysql.updateContact(arrayList.get(ID).getID(),item);

            listView.setAdapter(adapter_ma01);
            adapter_ma01.notifyDataSetChanged();
        }
    }

}