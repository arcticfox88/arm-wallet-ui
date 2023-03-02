package io.amax.amax_plugin;

import android.util.Log;
import android.util.SparseArray;

import androidx.annotation.NonNull;

import java.util.concurrent.atomic.AtomicInteger;

import io.armoniax.client.AmaxClient;

public class AmaxPluginApiImpl implements AmaxPluginAPIHelper.AmaxPluginAPI {
    private static final AtomicInteger atomicId = new AtomicInteger(0);
    private final SparseArray<AmaxClient> mClients = new SparseArray<>();

    @NonNull
    @Override
    public Long createClient(@NonNull AmaxPluginAPIHelper.ClientOption option) {
        Integer id = atomicId.incrementAndGet();
        return id.longValue();
    }

    @Override
    public void releaseClient(@NonNull Long clientId) {
        if(clientId != null){
            mClients.remove(clientId.intValue());
        }
    }

    @Override
    public void transfer(@NonNull Long clientId, @NonNull String from, @NonNull String to, @NonNull String quantity, @NonNull String memo) {
        Log.d("AmaxPlugin","transfer -> "+Thread.currentThread().getName());
    }

    @Override
    public void buyRam(@NonNull Long clientId, @NonNull String payer, @NonNull String receiver, @NonNull Long bytes) {
        Log.d("AmaxPlugin","buyRam -> "+Thread.currentThread().getName());
    }

    @Override
    public void stakeCpuAndNet(@NonNull Long clientId, @NonNull String from, @NonNull String receiver, @NonNull String cpuQuantity, @NonNull String netQuantity, @NonNull Boolean transfer) {
        Log.d("AmaxPlugin","stakeCpuAndNet -> "+Thread.currentThread().getName());
    }

    @Override
    public void sendTransaction(@NonNull AmaxPluginAPIHelper.Trx trx) {

    }
}
