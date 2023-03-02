package io.amax.amax_plugin;

import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StandardMethodCodec;

/**
 * AmaxPlugin
 */
public class AmaxPlugin implements FlutterPlugin {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        AmaxPluginAPIHelper.AmaxPluginAPI.setup(binding.getBinaryMessenger(), new AmaxPluginApiImpl());
    }


    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        AmaxPluginAPIHelper.AmaxPluginAPI.setup(binding.getBinaryMessenger(), null);
    }
}