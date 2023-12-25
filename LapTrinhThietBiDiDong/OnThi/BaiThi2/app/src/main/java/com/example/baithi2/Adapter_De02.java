package com.example.baithi2;

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

public class Adapter_De02  extends BaseAdapter implements Filterable {

    Activity activity;
    ArrayList<HoaDon_3107> data;
    ArrayList<HoaDon_3107> dataOld;
    LayoutInflater inflater;

    public Adapter_De02(Activity activity, ArrayList<HoaDon_3107> data) {
        this.activity = activity;
        this.data = data;
        this.dataOld = data;
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
            TextView txtName =v.findViewById(R.id.txtName);
            txtName.setText(data.get(i).getName());
            TextView txtSoPhong = v.findViewById(R.id.txtSoPhong);
            txtSoPhong.setText("Phòng: "+data.get(i).getSoPhong());
            TextView txtTongTien =v.findViewById(R.id.txtTongTiem);
            txtTongTien.setText(""+data.get(i).tongTien());
        }
        return v;
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence charSequence) {
                String search = charSequence.toString();
                if(search.isEmpty()){
                    data = dataOld;
                }
                else {
                    int intSearch = Integer.parseInt(search);
                    ArrayList<HoaDon_3107> list = new ArrayList<>();
                    for (HoaDon_3107 x : dataOld){
                        if(x.tongTien() > intSearch){
                            list.add(x);
                        }
                    }
                    data = list;
                }
                FilterResults filterResults = new FilterResults();
                filterResults.values = data;
                filterResults.count = data.size();
                return filterResults;
            }

            @Override
            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
                data = (ArrayList<HoaDon_3107>) filterResults.values;
                notifyDataSetChanged();
            }
        };
    }
}
