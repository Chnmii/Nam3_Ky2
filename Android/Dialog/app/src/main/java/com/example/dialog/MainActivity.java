package com.example.dialog;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    ListView listView;
    Button buttonDelete, buttonLogin;
    TextView textViewTest;
    ArrayList<String> monhoc = new ArrayList<String>();
    int value;
    ArrayAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        inits();
        monhoc.add("Java");
        monhoc.add("Android");
        monhoc.add("Network");
        adapter = new ArrayAdapter(MainActivity.this, android.R.layout.simple_list_item_1, monhoc);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(MainActivity.this, monhoc.get(i), Toast.LENGTH_SHORT).show();
                value = i;
            }
        });
        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                xacnhanxoa();
                return false;
            }
        });
        buttonDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                xacnhanxoa();

            }
        });
        buttonLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mydialog1();
            }
        });
    }

    public onOptionsSelected
    public boolean onCreateOptionsMenu(Menu menu){
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    private void mydialog1() {
        Dialog dialog = new Dialog(this);
        // gan layout
        dialog.setContentView(R.layout.mydialog);
        // anh xa
        EditText editTextUsername = (EditText) dialog.findViewById(R.id.editTextUserName);
        EditText editTextPassword = (EditText) dialog.findViewById(R.id.editTextPassword);
        Button buttonOk = (Button) dialog.findViewById(R.id.buttonOk);
        Button buttonCancel = (Button) dialog.findViewById(R.id.buttonCancel);
        buttonCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dialog.cancel();
            }
        });
        buttonOk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String userName = editTextUsername.getText().toString();
                String password = editTextPassword.getText().toString();
                if (userName.equals("abcd") && password.equals("123")){
                    Toast.makeText(MainActivity.this, "Correct", Toast.LENGTH_SHORT).show();
                }
                else{
                    Toast.makeText(MainActivity.this, "InCorrect", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    private void xacnhanxoa() {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle("Thong bao");
        alertDialog.setIcon(R.mipmap.ic_launcher);
        alertDialog.setMessage("Co xoa khong?");
        alertDialog.setPositiveButton("Co", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                monhoc.remove(value);
                adapter.notifyDataSetChanged();
            }
        });
        alertDialog.setNegativeButton("Khong", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {

            }
        });
        alertDialog.show();
    }
    private void inits() {
        listView = (listView) findViewById(R.id.listView);
        buttonDelete = (Button) findViewById(R.id.buttonDelete);
        buttonLogin = (Button) findViewById(R.id.buttonLogin);
        textViewTest = (TextView) findViewById(R.id.textViewTest);
    }
}