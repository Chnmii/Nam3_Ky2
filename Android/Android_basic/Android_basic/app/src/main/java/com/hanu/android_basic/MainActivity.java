package com.hanu.android_basic;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatEditText;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.ListView;
import android.widget.Toast;

import com.hanu.android_basic.adapter.ReceiptHotelAdapter;
import com.hanu.android_basic.db.AppDatabase;
import com.hanu.android_basic.model.ReceiptHotel;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements ReceiptHotelAdapter.ILongClickItem {

    ListView listView;
    AppCompatEditText editText;
    private ReceiptHotelAdapter adapter;
    private AppDatabase db;
    private ArrayList<ReceiptHotel> filteredReceiptList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        listView = findViewById(R.id.listview);
        editText = findViewById(R.id.edt_search);
        db = new AppDatabase(this);
        initData();
        adapter.listener = this::onClick;
    }

    private void initData() {
        for (ReceiptHotel receiptHotel : getListReceiptHotel()) {
            db.insertReceipt(receiptHotel);
        }
        adapter = new ReceiptHotelAdapter(this, db.getAllReceipt());
        listView.setAdapter(adapter);

        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                 filteredReceiptList.clear();
                 for (ReceiptHotel receiptHotel : db.getAllReceipt()) {
                     if (!charSequence.toString().equals("") && Integer.parseInt(receiptHotel.getPrice()) > Integer.parseInt(charSequence.toString())) {
                         filteredReceiptList.add(receiptHotel);
                     } else {
                         adapter.setData(db.getAllReceipt());
                         adapter.notifyDataSetChanged();
                     }
                 }
                 adapter.setData(filteredReceiptList);
                 adapter.notifyDataSetChanged();
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });
    }

    private List<ReceiptHotel> getListReceiptHotel() {
        ArrayList<ReceiptHotel> mListReceiptHotel = new ArrayList<>();
        mListReceiptHotel.add(new ReceiptHotel(0, "John", 302, "2000000", 2));
        mListReceiptHotel.add(new ReceiptHotel(1, "heeh", 350, "2500000", 2));
        mListReceiptHotel.add(new ReceiptHotel(2, "John", 670, "3000000", 2));
        mListReceiptHotel.add(new ReceiptHotel(3, "John", 201, "2000000", 2));
        mListReceiptHotel.add(new ReceiptHotel(4, "John", 167, "7000000", 2));
        mListReceiptHotel.add(new ReceiptHotel(5, "John", 124, "1000000", 2));
        return mListReceiptHotel;
    }

    @Override
    public void onClick(ReceiptHotel receiptHotel) {
        Toast.makeText(this, "Phạm Khánh Toàn: " + db.quantityReceipt(receiptHotel), Toast.LENGTH_LONG).show();
    }


}