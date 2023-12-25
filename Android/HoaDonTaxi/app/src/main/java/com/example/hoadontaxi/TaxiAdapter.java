package com.example.hoadontaxi;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.ArrayList;

public class TaxiAdapter extends BaseAdapter {
    Activity activity;
    private ArrayList<Taxi> arrayList;

    LayoutInflater inflater;

    public TaxiAdapter(Activity activity, ArrayList<Taxi> arrayList){
        this.activity = activity;
        this.arrayList = arrayList;
        this.inflater = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }
    @Override
    public int getCount() {
        return arrayList.size();
    }

    @Override
    public Object getItem(int i) {
        return arrayList.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        View v = view;
        if (v == null) {
            v = inflater.inflate(R.layout.item_listview, null);
            TextView tvSoxe = v.findViewById(R.id.tvSoxe);
            tvSoxe.setText("" + arrayList.get(i).getSoxe());
            TextView tvQuangduong = v.findViewById(R.id.tvQuangduong);
            tvQuangduong.setText("Quãng đường: " + arrayList.get(i).getQuangDuong());
            TextView tvTien = v.findViewById(R.id.tvTongtien);
            tvTien.setText("" + arrayList.get(i).getTongTien());
        }
        return v;
    }
}
