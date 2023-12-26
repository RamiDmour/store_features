package com.example.example

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("ru_ru") // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("387b5517-f6f5-4692-9ab8-b28a723d8ae3") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}