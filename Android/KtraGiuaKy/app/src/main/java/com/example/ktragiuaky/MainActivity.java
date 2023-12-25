package com.example.ktragiuaky;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;

import com.google.android.material.floatingactionbutton.FloatingActionButton;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ListView listViewBook;
    BookAdapter adapter;
    ArrayList<Books> booksArrayList;

    FloatingActionButton buttonAdd;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Init();
        adapter = new BookAdapter(this, R.layout.item_layout, booksArrayList);

        listViewBook.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                booksArrayList.remove(i);
                adapter.notifyDataSetChanged();
                return false;
            }
        });

        /*listViewBook.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                if(booksArrayList.isEmpty()==false){
                    booksArrayList.remove(i);
                    adapter.notifyDataSetChanged();
                }
            }
        });*/

        buttonAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                listViewBook.setAdapter(adapter);
            }
        });


    }

    private void Init() {
        listViewBook = (ListView) findViewById(R.id.listViewBook);
        booksArrayList = new ArrayList<>();
        booksArrayList.add(new Books("Để gió cuốn đi", "Ái Vãn", 378));
        booksArrayList.add(new Books("Hà Nội lầm than", "Trọng Lãng", 425));
        booksArrayList.add(new Books("Phố vẫn gió", "Lê Minh Hà", 320));
        buttonAdd = (FloatingActionButton) findViewById(R.id.buttonAdd);

    }
}