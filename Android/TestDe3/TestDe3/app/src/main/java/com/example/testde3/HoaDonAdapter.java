package com.example.testde3;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class HoaDonAdapter extends BaseAdapter {
    Activity activity;

    private ArrayList<HoaDon_HaiDang> arrayList;

    LayoutInflater inflater;

    public HoaDonAdapter(Activity activity, ArrayList<HoaDon_HaiDang> arrayList) {
        this.activity = activity;
        this.arrayList = arrayList;
        this.inflater = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }


    @Override
    public int getCount() {
        return arrayList.size();
    }

    @Override
    public Object getItem(int position) {
        return arrayList.get(position);
    }

    @Override
    public long getItemId(int position) {
        return arrayList.get(position).getMa();
    }


    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View v = convertView;
        if(v == null){
            v = inflater.inflate(R.layout.item_listview, null);
            TextView tvHoten = v.findViewById(R.id.tvHoten);
            TextView tvPhong = v.findViewById(R.id.tvPhong);
            TextView tvGiatien = v.findViewById(R.id.tvGiaTien);
            tvHoten.setText("Họ tên: " + arrayList.get(position).getHoten());
            tvPhong.setText("Phòng: " +arrayList.get(position).getSophong());
            tvGiatien.setText("" + arrayList.get(position).getGiatien());
        }
        return v;
    }
}
