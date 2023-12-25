package com.hanu.android_basic.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.hanu.android_basic.R;
import com.hanu.android_basic.model.ReceiptHotel;

import java.util.List;

public class ReceiptHotelAdapter extends BaseAdapter {
    public ILongClickItem listener;
    private List<ReceiptHotel> receiptHotelList;
    private Context context;
    public ReceiptHotelAdapter(Context context, List<ReceiptHotel> listReceiptHotel) {
        this.context = context;
        this.receiptHotelList = listReceiptHotel;
    }

    public void setData(List<ReceiptHotel> receiptHotelList) {
        this.receiptHotelList = receiptHotelList;
    }

    @Override
    public int getCount() {
        return receiptHotelList.size();
    }

    @Override
    public Object getItem(int i) {
        return receiptHotelList.get(i);
    }

    @Override
    public long getItemId(int i) {
        return i;
    }

    public interface ILongClickItem {
        void onClick(ReceiptHotel receiptHotel);
    }

    @Override
    public View getView(int i, View convertView, ViewGroup viewGroup) {
        TextView tvName, tvNumberRoom, tvPrice;
        if (convertView == null) {
            LayoutInflater inflater =  LayoutInflater.from(context);
            convertView = inflater.inflate(R.layout.item_receipt_hotel, viewGroup, false);
            tvName = convertView.findViewById(R.id.tv_name);
            tvNumberRoom = convertView.findViewById(R.id.tv_number_room);
            tvPrice = convertView.findViewById(R.id.tv_price);

            ReceiptHotel receiptHotel = receiptHotelList.get(i);
            tvName.setText(receiptHotel.getName());
            tvNumberRoom.setText(String.valueOf(receiptHotel.getNumberRoom()));
            tvPrice.setText(String.valueOf(receiptHotel.getPrice()));
            convertView.setOnLongClickListener(v -> {
                listener.onClick(receiptHotel);
                return true;
            });
        } else {
            convertView.getTag();
        }
        return convertView;
    }
}
