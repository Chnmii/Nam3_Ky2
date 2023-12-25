package com.example.listview1;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.DialogInterface;
import android.graphics.Color;
import android.hardware.lights.LightState;
import android.os.Bundle;
import android.view.Menu;
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
   Button   buttonDelete,buttonLogin;
TextView textViewTest;
   int val;
    ArrayList<String> monhoc = new ArrayList<String>();
    ArrayAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        inits();
        monhoc.add("Java");
        monhoc.add("Android");
        monhoc.add("C#");
        monhoc.add("Network");
        adapter = new ArrayAdapter(MainActivity.this, android.R.layout.simple_list_item_1,monhoc);
        listView.setAdapter(adapter);
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Toast.makeText(MainActivity.this,monhoc.get(i),Toast.LENGTH_SHORT).show();
                val = i;
            }

        });

        buttonDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                xacnhanxoa();

            }
        });
        listView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
                xacnhanxoa();
                return false;
            }
        });
        buttonLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mydialog1();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_menu,menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
       if(item.getItemId()== R.id.mnuGreen)
       {
           textViewTest.setBackgroundColor(Color.GREEN);
       }
       else if(item.getItemId()==R.id.mnuRed)
       {
           textViewTest.setBackgroundColor(Color.RED);
       }
       else if(item.getItemId()==R.id.mnuYellow)
       {
           textViewTest.setBackgroundColor(Color.YELLOW);
       }
        return super.onOptionsItemSelected(item);
    }

    private void mydialog1()
    {
        // khai bao dialog
        Dialog dialog= new Dialog(this);
        dialog.setContentView(R.layout.mydialog);
        //anh xa
        EditText editTextUsername = (EditText) dialog.findViewById(R.id.editTextTextPersonName);
        EditText editTextPassword = (EditText) dialog.findViewById(R.id.editTextTextPassword);
        Button buttonOK = (Button) dialog.findViewById(R.id.buttonOK);
        Button buttonCancel = (Button) dialog.findViewById(R.id.buttonCancel);
        buttonCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                dialog.cancel();
            }
        });
        buttonOK.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String username = editTextUsername.getText().toString();
                String password = editTextPassword.getText().toString();
                if(username.equals("abdc") && password.equals("123"))
                {
                    Toast.makeText(MainActivity.this, "Correct", Toast.LENGTH_SHORT).show();
                }
                else {
                    Toast.makeText(MainActivity.this, "InCorrect", Toast.LENGTH_SHORT).show();
                }
            }
        });
        dialog.show();
    }
    private void xacnhanxoa()
    {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(this);
        alertDialog.setTitle("Thong bao");
        alertDialog.setIcon(R.mipmap.ic_launcher);
        alertDialog.setMessage("Co xoa khong?");
        alertDialog.setPositiveButton("Co", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                monhoc.remove(val);
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
    private void inits()
    {
        listView = (ListView)  findViewById(R.id.listView);
        buttonDelete = (Button) findViewById(R.id.buttonDelete);
        buttonLogin = (Button) findViewById(R.id.buttonLogin);
        textViewTest = (TextView) findViewById(R.id.textViewTest);
    }

}