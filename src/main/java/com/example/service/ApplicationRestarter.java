package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import com.example.BasicApplication;

@Component
public class ApplicationRestarter {

    private final ApplicationContext applicationContext;

    @Autowired
    public ApplicationRestarter(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    public void restart() {
        // Menutup aplikasi
      // SpringApplication.exit(applicationContext, () -> 0);

        // Memulai kembali aplikasi
        Thread thread = new Thread(() -> {
            try {
                Thread.sleep(1000); // Tunggu 1 detik sebelum memulai kembali
                SpringApplication.run(BasicApplication.class);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        thread.setDaemon(false);
        thread.start();
    }
}