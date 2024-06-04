import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/intl/messages.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        translations: Messages(),
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
