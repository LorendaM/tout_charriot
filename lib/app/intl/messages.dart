import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'en.dart';
import 'fr.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': enLangData, 'fr_FR': frLangData};
}
