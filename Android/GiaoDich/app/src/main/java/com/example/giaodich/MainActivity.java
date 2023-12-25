package com.example.giaodich;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    Adapter_GiaoDich adapter_giaoDich;
    ListView listView;
    ArrayList<GiaoDich>arrayList;
    TextView txtSoDu;
    int viTriDangChon=-1;
    Sqlite_GiaoDich sqlite_giaoDich=new Sqlite_GiaoDich(this);

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Init();

        listView=(ListView) findViewById(R.id.lsvHoaDon);
        sqlite_giaoDich.addSP(new GiaoDich(1,"Luong","10/2/2023",1,"Cong Trung",100000));
        sqlite_giaoDich.addSP(new GiaoDich(2,"Thuong","15/3/2023",0,"Duy Trung",500000));
        sqlite_giaoDich.addSP(new GiaoDich(3,"Tien nha","10/7/2020",1,"Thu Huyen",700000));
        sqlite_giaoDich.addSP(new GiaoDich(4,"An choi","8/2/2019",1,"Nam Anh",200000));
        arrayList=(ArrayList<GiaoDich>) sqlite_giaoDich.getAll();
        adapter_giaoDich=new Adapter_GiaoDich(MainActivity.this,R.layout.hoadon_listview,arrayList);
        listView.setAdapter(adapter_giaoDich);

        long sodu=0;

        for(int i=0;i<arrayList.size();i++){

            if(arrayList.get(i).getLoaiGD()==1){
                sodu+=arrayList.get(i).getSoTien();

            }
            else {
                sodu-=arrayList.get(i).getSoTien();
            }
        }
        txtSoDu.setText("So du : "+String.valueOf(sodu));
        Toast.makeText(MainActivity.this,"so du"+sodu,Toast.LENGTH_SHORT).show();

        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override

            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
                registerForContextMenu(listView);
                viTriDangChon=position;
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
        if (item.getItemId() == R.id.itemXoa) {


            sqlite_giaoDich.DeleteById(arrayList.get(viTriDangChon).getMa());//xoa

            arrayList=(ArrayList<GiaoDich>) sqlite_giaoDich.getAll();//lay lai toan bo danh sach
            adapter_giaoDich=new Adapter_GiaoDich(MainActivity.this,R.layout.hoadon_listview,arrayList);
            listView.setAdapter(adapter_giaoDich);


            return false;
        }
       /* if (item.getItemId() == R.id.itemSua) {


            int ma = arrayList.get(viTriDangChon).getMa();//list item title
            String hoten = arrayList.get(viTriDangChon).getHoTen();//list item title
            int sophong = arrayList.get(viTriDangChon).getSoPhong();//list item title
            int dongia = arrayList.get(viTriDangChon).getDonGia();//list item title
            int songay = arrayList.get(viTriDangChon).getSoNgay();//
            Intent it = new Intent(MainActivity.this, Sua.class);
            it.putExtra("ID", ma);
            it.putExtra("HoTen",hoten );
            it.putExtra("SoPhong", sophong);
            it.putExtra("DonGia", dongia);
            it.putExtra("SoNgay", songay);

            startActivity(it);
            // Toast.makeText(this,"edit",Toast.LENGTH_SHORT).show();

        }*/
        return super.onContextItemSelected(item);
    }

    private void Init() {
        txtSoDu=(TextView) findViewById(R.id.sodu);
    }
}