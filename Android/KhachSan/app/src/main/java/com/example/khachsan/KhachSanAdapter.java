package com.example.khachsan;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class KhachSanAdapter extends BaseAdapter {
    Activity activity;
    private ArrayList<KhachSan> arrayList;
    LayoutInflater inflater;

    public KhachSanAdapter(Activity activity, ArrayList<KhachSan> arrayList) {
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
        return position;
    }

    @Override
    public View getView(int position, View view, ViewGroup parent) {
        View v = view;
        if(v == null){
            v = inflater.inflate(R.layout.item_khachhang, null);
            TextView tvHoten = v.findViewById(R.id.tvHoten);
            tvHoten.setText("" + arrayList.get(position).getHoten());
            TextView tvPhong = v.findViewById(R.id.tvSophong);
            tvPhong.setText("Phong: "+arrayList.get(position).getSophong());
            TextView tvGiatien = v.findViewById(R.id.tvGia);
            tvGiatien.setText("" + arrayList.get(position).getTongTien());
        }
        return v;
    }
}
