package com.example.dethi1;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class Adapter_Ma01 extends BaseAdapter {

    Activity activity;
    ArrayList<Taxi_Ma01> data;
    LayoutInflater inflater;

    public Adapter_Ma01(Activity activity, ArrayList<Taxi_Ma01> data) {
        this.activity = activity;
        this.data = data;
        this.inflater =(LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public int getCount() {
        return data.size();
    }

    @Override
    public Object getItem(int i) {
        return data.get(i);
    }

    @Override
    public long getItemId(int i) {
        return data.get(i).getID();
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        View v =view;
        if(v == null){
            v = inflater.inflate(R.layout.list_item, null);
            TextView txtSoXe =v.findViewById(R.id.txtSoXe);
            txtSoXe.setText(data.get(i).getSoXe());
            TextView txtDonGia = v.findViewById(R.id.txtDonGia);
            txtDonGia.setText(""+data.get(i).tongTien());
            TextView txtQuangDuong =v.findViewById(R.id.txtQuangDuong);
            txtQuangDuong.setText("Quãng đường: "+data.get(i).getQuangDuong() + " km");
        }
        return v;
    }
}
