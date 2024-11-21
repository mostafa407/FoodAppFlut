import 'package:get/get.dart';

class MyLocal implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys=> {
    "ar": {
      "1":"الايميل",
      "2":"الباسورد",
      "3":"نسجيل دخول",
      "4":"تم",
      "5":"تعديل البيانات",
      "6":"الغاء",
      "7":"انشاء حساب"
    },
    "en":{
      "1":"Email",
      "2":"password",
      "3":"Login",
      "4":"Done",
      "5":"Edit Profile",
      "6":"cancel"
      ,"7":"Create Account"
    }
  };

}