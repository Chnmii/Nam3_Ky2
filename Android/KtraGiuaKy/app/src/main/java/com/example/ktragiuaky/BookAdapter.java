package com.example.ktragiuaky;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class BookAdapter extends BaseAdapter {

    private Context context;
    private int layout;
    private List<Books> booksArrayList;

    public BookAdapter(MainActivity mainActivity, int item_layout, ArrayList<Books> booksArrayList) {
        this.booksArrayList = booksArrayList;
    }

    @Override
    public int getCount() {
        return booksArrayList.size();
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
        TextView textViewTieude;
        TextView textViewTacgia;
        TextView textViewSotrang;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder holder;
        if(view == null){
            view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_layout, viewGroup, false);

            holder = new ViewHolder();
            // ánh xạ view

            holder.textViewTieude = (TextView) view.findViewById(R.id.textViewTieude);
            holder.textViewTacgia = (TextView) view.findViewById(R.id.textViewTacgia);
            holder.textViewSotrang = (TextView) view.findViewById(R.id.textViewSotrang);
            view.setTag(holder);

        }
        else {
            holder = (ViewHolder) view.getTag();
        }

        // gán giá trị
        Books books = booksArrayList.get(i);
        holder.textViewTieude.setText(books.getTen());
        holder.textViewTacgia.setText(books.getTacgia());
        holder.textViewSotrang.setText(String.valueOf(books.getSotrang()));

        return view;
    }
}
