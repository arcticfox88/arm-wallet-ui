package com.example.walletdemo;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import androidx.fragment.app.Fragment;

import io.flutter.embedding.android.FlutterActivity;

public class HomeFragment extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View content = inflater.inflate(R.layout.fragment_home, container, false);
        Button btn = content.findViewById(R.id.btn);
        btn.setOnClickListener((l)->{
            startActivity(
                    FlutterActivity.createDefaultIntent(getActivity())
            );
        });
        return content;
    }
}
