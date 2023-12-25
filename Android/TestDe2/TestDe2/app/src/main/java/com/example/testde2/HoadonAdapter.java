package com.example.testde2;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import java.util.ArrayList;

public class HoadonAdapter extends BaseAdapter {
    Activity activity;

    private ArrayList<HoaDon_3009> arrayList;

    private ArrayList<HoaDon_3009> newarrayList;

    LayoutInflater inflater;

    public HoadonAdapter(Activity activity, ArrayList<HoaDon_3009> arrayList) {
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
            TextView tvHoten = v.findViewById(R.id.tvHoten);
            tvHoten.setText(arrayList.get(position).getHoten());
            TextView tvPhong = v.findViewById(R.id.tvPhong);
            tvPhong.setText("Phong: "+arrayList.get(position).getPhong());
            TextView tvGiatien = v.findViewById(R.id.tvGiaTien);
            tvGiatien.setText("" + arrayList.get(position).getTongtien());
        }
        return v;
    }

//    @Override
//    public Filter getFilter() {
//        return new Filter() {
//            @Override
//            protected FilterResults performFiltering(CharSequence charSequence) {
//                String search = charSequence.toString();
//                if(search.isEmpty()){
//                    newarrayList = arrayList;
//                }
//                else {
//                    int intSearch = Integer.parseInt(search);
//                    ArrayList<HoaDon_3009> list = new ArrayList<>();
//                    for (HoaDon_3009 x : arrayList){
//                        if(x.getTongtien() > intSearch){
//                            list.add(x);
//                        }
//                    }
//                    arrayList = list;
//                }
//                FilterResults filterResults = new FilterResults();
//                filterResults.values = arrayList;
//                filterResults.count = arrayList.size();
//                return filterResults;
//            }
//
//            @Override
//            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
//                arrayList = (ArrayList<HoaDon_3009>) filterResults.values;
//                notifyDataSetChanged();
//            }
//        };
//    }

}
