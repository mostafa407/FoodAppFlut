import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

class MyLocalController extends GetxController{
   SharedPreferences?sharedpref;
   Rx<Locale> initLang=Locale("en").obs;
   RxBool isLoading = false.obs;


   @override
  void onInit(){
    super.onInit();
    initializeSharedPrefs();
  }
  Future<void> initializeSharedPrefs() async {
    sharedpref = await SharedPreferences.getInstance();
    String? langCode = sharedpref?.getString("lang") ?? "en";
    initLang.value = Locale(langCode); // Update the state after initialization
  }
  void changeLang(String codeLang){
    Locale locale=Locale(codeLang);
    sharedpref!.setString("lang",codeLang);
    initLang.value=locale;
    Get.updateLocale(locale);
  }
}