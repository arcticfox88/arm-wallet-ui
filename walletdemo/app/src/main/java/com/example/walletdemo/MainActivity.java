package com.example.walletdemo;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.viewpager2.adapter.FragmentStateAdapter;
import androidx.viewpager2.widget.ViewPager2;

import android.content.Intent;
import android.os.Bundle;

import com.google.android.material.tabs.TabLayout;
import com.google.android.material.tabs.TabLayoutMediator;

import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterFragment;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;

public class MainActivity extends FragmentActivity {
    private static final String ENGINE_TAG = "my_engine_id";

    private FlutterFragment flutterFragment;
    private List<Fragment> fragmentList;
    private final String[] menus = {"首页", "钱包"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        loadFlutterEngine();
        setContentView(R.layout.activity_main);
        ViewPager2 vpMain = findViewById(R.id.vpMain);
        TabLayout tlMain = findViewById(R.id.tlMain);

        // Create and attach a FlutterFragment if one does not exist.
        if (flutterFragment == null) {
            flutterFragment = FlutterFragment.withCachedEngine(ENGINE_TAG).build();
        }

        fragmentList = new ArrayList<>();
        fragmentList.add(new HomeFragment());
        fragmentList.add(flutterFragment);

        FragmentStateAdapter adapter = new FragmentStateAdapter(MainActivity.this) {
            @NonNull
            @Override
            public Fragment createFragment(int position) {
                return fragmentList.get(position);
            }

            @Override
            public int getItemCount() {
                return fragmentList.size();
            }
        };

        vpMain.setAdapter(adapter);
        new TabLayoutMediator(tlMain, vpMain, false, false,
                (tab, position) -> tab.setText(menus[position])).attach();
    }

    void loadFlutterEngine() {
        FlutterEngine flutterEngine = new FlutterEngine(this);
        flutterEngine.getDartExecutor().executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault());
        FlutterEngineCache.getInstance().put(ENGINE_TAG, flutterEngine);
    }

    @Override
    public void onPostResume() {
        super.onPostResume();
        flutterFragment.onPostResume();
    }

    @Override
    protected void onNewIntent(@NonNull Intent intent) {
        super.onNewIntent(intent);
        flutterFragment.onNewIntent(intent);
    }

    @Override
    public void onBackPressed() {
        flutterFragment.onBackPressed();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        flutterFragment.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }

    @Override
    public void onUserLeaveHint() {
        flutterFragment.onUserLeaveHint();
    }

    @Override
    public void onTrimMemory(int level) {
        super.onTrimMemory(level);
        flutterFragment.onTrimMemory(level);
    }
}
