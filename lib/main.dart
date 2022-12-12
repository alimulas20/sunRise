import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunset_app/models/theme_model.dart';
import 'package:sunset_app/providers/main_view_model.dart';
import 'package:sunset_app/providers/signin_provider.dart';
import 'package:sunset_app/providers/theme_provider.dart';
import 'package:sunset_app/screens/login_signup_view.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, mode, child) => MultiProvider(
          providers: [

            ChangeNotifierProvider<SignInProvider>(
              create: (context) => SignInProvider(),
            ),
            ChangeNotifierProvider<MainViewProvider>(
              create: (context) => MainViewProvider(),
            ),

          ],
          child: MaterialApp(


            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeModel().lightMode,
            darkTheme: ThemeModel().darkMode,
            themeMode:
            mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
            home: const LoginSignupPage(),
          ),
        ),
      ),
    );
  }
}