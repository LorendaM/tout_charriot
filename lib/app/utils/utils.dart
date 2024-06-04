import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/services/service_impl/storage_service_impl.dart';

class AppUtils {
  static Size kSize(context) => MediaQuery.of(context).size;
  static Future<void> appStarter() async {
    await Hive.initFlutter();
    await Hive.openBox(StorageServicesImpl.userBoxName);
  }
}

kPushNamed({required String path, required BuildContext context, Map<String, dynamic>? arguments}) =>
  Navigator.pushNamed(context, path, arguments: arguments);
kPushRemplaceNamed({required String path, required BuildContext context}) =>
  Navigator.pushReplacementNamed(context, path);
kPopPage(context) => Navigator.pop(context);

launchTheUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception("Impossible de lancer l'url: $url");
  }
}

showLoading(context, [String msg = 'Veuillez patienter ...']) {
  FocusScope.of(context).requestFocus(FocusNode());
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 20.0),
        content: Row(
          mainAxisSize: MainAxisSize.min, 
          children: <Widget>[
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2)
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(msg,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12.0),
              textAlign: TextAlign.center
            )
          )
          ]
        )
      );
    }
  );
}

navPrevious(context, mounted) {
  if (mounted && Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}