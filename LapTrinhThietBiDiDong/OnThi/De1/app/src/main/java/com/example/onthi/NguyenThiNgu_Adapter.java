package com.example.onthi;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class NguyenThiNgu_Adapter extends BaseAdapter {

    Activity activity;
    ArrayList<Contact_Ngu> data;
    LayoutInflater inflater;

    public NguyenThiNgu_Adapter(Activity activity, ArrayList<Contact_Ngu> data) {
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
            TextView txt_ID =v.findViewById(R.id.txt_ID);
            txt_ID.setText("" + data.get(i).getID());
            TextView txt_Name = v.findViewById(R.id.txt_Name);
            txt_Name.setText(data.get(i).getName());
            TextView txt_Phone =v.findViewById(R.id.txt_Phone);
            txt_Phone.setText(data.get(i).getPhone());
        }
        return v;
    }
}
