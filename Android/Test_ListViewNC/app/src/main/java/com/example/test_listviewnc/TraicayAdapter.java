package com.example.test_listviewnc;

import android.content.Context;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import org.xmlpull.v1.XmlPullParser;

import java.util.List;

public class TraicayAdapter extends BaseAdapter {
    private Context context;
    private int layout;
    private List<TraiCay> traiCayList;

    public TraicayAdapter(Context context, int layout, List<TraiCay> traiCayList) {
        this.context = context;
        this.layout = layout;
        this.traiCayList = traiCayList;
    }


    // số đối tượng hiện lên trên màn hình
    @Override
    public int getCount() {
        return traiCayList.size();
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    private class ViewHolder{
        ImageView imageViewHinh;
        TextView textViewTen;
        TextView textViewMota;

    }

    // trả về
    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder holder;
        if(view == null){
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate( layout, (ViewGroup) null);

            holder = new ViewHolder();
            // ánh xạ view
            holder.textViewTen = (TextView) view.findViewById(R.id.textViewTen);
            holder.imageViewHinh = (ImageView) view.findViewById(R.id.imageViewHinh);
            holder.textViewMota = (TextView) view.findViewById(R.id.textViewMota);
            view.setTag(holder);

        }
        else {
            holder = (ViewHolder) view.getTag();
        }

        // gán giá trị
        TraiCay traiCay = traiCayList.get(i);
        holder.textViewTen.setText(traiCay.getTen());
        holder.textViewMota.setText(traiCay.getMota());
        holder.imageViewHinh.setImageResource(traiCay.getHinh());

        return view;
    }

}
