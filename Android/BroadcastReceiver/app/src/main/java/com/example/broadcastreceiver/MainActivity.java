package com.example.broadcastreceiver;

import androidx.appcompat.app.AppCompatActivity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button buttonLogin;

    BroadcastReceiver wifiReceive = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            ConnectivityManager connectivityManager = (ConnectivityManager)
                    context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if(connectivityManager.getActiveNetworkInfo() != null){
                Toast.makeText(MainActivity.this, "Turn on Wifi", Toast.LENGTH_SHORT).show();
                buttonLogin.setEnabled(true);
            }
            else{
                Toast.makeText(MainActivity.this, "Turn off Wifi", Toast.LENGTH_SHORT).show();
                buttonLogin.setEnabled(false);
            }
        }
    };

    @Override
    protected void onResume() {
        super.onResume();
        IntentFilter filter = new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION);
        registerReceiver(wifiReceive, filter);
    }

    @Override
    protected void onPause() {
        super.onPause();
        if(wifiReceive != null){
            unregisterReceiver(wifiReceive);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        buttonLogin = (Button) findViewById(R.id.buttonLogin);

    }
}