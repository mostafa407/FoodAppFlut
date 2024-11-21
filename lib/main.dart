import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:instaapp/app_route.dart';
import 'package:instaapp/controller/postController.dart';
import 'package:instaapp/local/local.dart';
import 'package:instaapp/controller/local_controller.dart';
// import 'package:flutter_complete_guide/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBRJff8mGOthlE_vxC4ZZNAqyUBbCRd4BQ",
            appId: "1:797402420163:android:c45466fe50e17b28d56376",
            messagingSenderId: "",
            projectId: "flutter-45563",
          storageBucket: "flutter-45563.appspot.com"

        ));
    runApp(MyApp(
      appRoute: AppRoute(),
    ));
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

class MyApp extends StatefulWidget {
  final AppRoute appRoute;

  MyApp({super.key, required this.appRoute});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  bool isDarkMode = false;
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Toggle between light and dark mode
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(PostController());
    MyLocalController controller = Get.put(MyLocalController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            color: Color(0xffEFEFEF),
            actionsIconTheme: IconThemeData(
              color: Colors.black

            ),
              //backgroundColor: Color(0xffA6A6AA),
             foregroundColor: Colors.white,
              titleTextStyle: TextStyle(
              color: Colors.black
            )
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        darkTheme: ThemeData(
          textTheme: TextTheme(
          ),
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        locale: controller.initLang.value,
        translations: MyLocal(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => widget.appRoute.generateRoute(
          settings,
          isDarkMode: isDarkMode,
          toggleTheme: toggleTheme,
        ),
      ),
    );
  }
}
