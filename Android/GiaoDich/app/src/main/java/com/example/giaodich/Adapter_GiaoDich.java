package com.example.giaodich;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

public class Adapter_GiaoDich extends BaseAdapter {
    //copy 3 cai kia, doi ten
    private Context context;
    private int layout;
    public ArrayList<GiaoDich> arrayList;

    //copy cai nay
    public Adapter_GiaoDich(Context context, int layout, ArrayList<GiaoDich> arrayList) {
        this.context = context;
        this.layout = layout;
        this.arrayList = arrayList;
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
    public long getItemId(int position) {
        return position;
    }

    //copy doan nay
    @Override
    public View getView(int i, View view, ViewGroup parent) {
        String loai="";
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        view = inflater.inflate(R.layout.hoadon_listview, null);
        TextView tennguoi = (TextView) view.findViewById(R.id.tennguoi);
        TextView noidung = (TextView) view.findViewById(R.id.noidung);
        TextView tien = (TextView) view.findViewById(R.id.giatien);
        TextView ngaythang = (TextView) view.findViewById(R.id.ngay);

        GiaoDich hoaDon_ngaySinh = arrayList.get(i);
        if(hoaDon_ngaySinh.getLoaiGD()==1){
            loai="Tien den ";
        }
        else{
            loai="Tien di";
        }
        tennguoi.setText(loai+hoaDon_ngaySinh.getTen());
        tien.setText(String.valueOf(hoaDon_ngaySinh.getSoTien()));
        noidung.setText(hoaDon_ngaySinh.getNoiDung());
        ngaythang.setText(hoaDon_ngaySinh.getNgayThang());
       // sodu.setText(String.valueOf(hoaDon_ngaySinh.getDonGia() * (hoaDon_ngaySinh.getSoNgay())));

        return view;
    }
    //doan nay de tim kiem
    public void setFilteredList(ArrayList<GiaoDich>filteredList){
        this.arrayList=filteredList;
        notifyDataSetChanged();

    }


}
