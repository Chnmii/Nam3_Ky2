package com.example.testdethi;


import android.app.Activity;
import android.content.Context;
import android.hardware.ConsumerIrManager;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import org.w3c.dom.Text;

import java.util.ArrayList;
import android.view.LayoutInflater;

public class TaxiAdapter extends BaseAdapter implements Filterable {
    Activity activity;

    private ArrayList<Taxi> arrayList;

    private ArrayList<Taxi> arrayListNew;

    LayoutInflater inflater;

    public TaxiAdapter(Activity activity, ArrayList<Taxi> arrayList) {
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
            v = inflater.inflate(R.layout.item_listview, null);
            TextView tvSoxe = v.findViewById(R.id.tvSoxe);
            tvSoxe.setText(arrayList.get(position).getSoxe());
            TextView tvQuangduong = v.findViewById(R.id.tvQuangduong);
            tvQuangduong.setText("Quang duong: "+arrayList.get(position).getQuangduong());
            TextView tvGiatien = v.findViewById(R.id.tvGiaTien);
            tvGiatien.setText("" + arrayList.get(position).Giatien());
        }
        return v;
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                String search = constraint.toString();
                if(search.isEmpty()){
                    arrayListNew = arrayList;
                }
                else{
                    int intSearch = Integer.parseInt(search);
                    ArrayList<Taxi> list = new ArrayList<Taxi>();
                    for(Taxi x : arrayList){
                        if(x.Giatien() > intSearch){
                            list.add(x);
                        }
                    }
                    arrayListNew = list;
                }
                FilterResults filterResults = new FilterResults();
                filterResults.values = arrayListNew;
                filterResults.count = arrayListNew.size();
                return filterResults;
            }

            @Override
            protected void publishResults(CharSequence constraint, FilterResults results) {
                arrayListNew = (ArrayList<Taxi>) results.values;
                notifyDataSetChanged();
            }
        };
    }

}
