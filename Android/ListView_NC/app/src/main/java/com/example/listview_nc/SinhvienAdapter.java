package com.example.listview_nc;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

public class SinhvienAdapter extends ArrayAdapter<SinhVien> {


    public SinhvienAdapter(@NonNull Context context, int resource, @NonNull List<SinhVien> objects) {
        super(context, resource, objects);
    }

    public SinhvienAdapter(@NonNull Context context, int resource, int textViewResourceId) {
        super(context, resource, textViewResourceId);
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        View v = convertView;
        if(v==null){
            LayoutInflater vi;
            vi = LayoutInflater.from(getContext());
            v = vi.inflate(R.layout.activity_list_item, null);
        }
        SinhVien sv = getItem(position);
        if (sv != null){
            // anh xa 2 textView
            TextView textViewHoten = (TextView) v.findViewById(R.id.textViewHoten);
            TextView textViewNamsinh = (TextView) v.findViewById(R.id.textViewNamsinh);
            // gan gia tri
            textViewHoten.setText(sv.Hoten);
            textViewNamsinh.setText(String.valueOf(sv.Namsinh));
        }
        return v;
        //return super.getView(position, convertView, parent);
    }
}
