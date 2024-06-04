import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/intl/messages.dart';
import 'app/modules/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        translations: Messages(), // your translations
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale('en', 'US'),
        themeMode: ThemeMode.system,
        title: 'Tout Chariot',
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
    );

  }
}
