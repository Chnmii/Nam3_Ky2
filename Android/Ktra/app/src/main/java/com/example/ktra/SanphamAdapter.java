package com.example.ktra;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class SanphamAdapter extends BaseAdapter {
    Activity activity;

    private ArrayList<Sanpham> arrayList;

    LayoutInflater inflater;

    public SanphamAdapter(Activity activity, ArrayList<Sanpham> arrayList) {
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
            TextView tvHoten = v.findViewById(R.id.tvTenSp);
            TextView tvPhong = v.findViewById(R.id.tvKhuyenmai);
            TextView tvGiatien = v.findViewById(R.id.tvGiaTien);
            tvHoten.setText("" + arrayList.get(position).getTenSP());

            tvPhong.setText("Giảm giá còn: " + arrayList.get(position).getGiaconlai());
            tvGiatien.setText("" + arrayList.get(position).getGiaTien());
        }
        return v;
    }
}
