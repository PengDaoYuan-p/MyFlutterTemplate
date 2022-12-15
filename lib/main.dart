import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/view/forget_password_page.dart';
import 'package:flutter_project/view/login_page.dart';
import 'package:flutter_project/view/register_page.dart';
//For theme change
import 'package:provider/provider.dart';
import 'package:flutter_project/theme_changer/theme_notifier.dart';
import 'package:flutter_project/theme_changer/app_theme.dart';

import 'package:flutter_project/view/home.dart';

void main() {

  //----- limit app to only vertical -----
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
        create: (_) => ThemeNotifer(),
        child: Consumer<ThemeNotifer>(
          builder: (context, ThemeNotifer themeNotifier, child){
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.isDark
                ? AppTheme().darkTheme
                : AppTheme().lightTheme,
              home: const Home(),
              routes: <String, WidgetBuilder>{
                "LoginPage" : (context) => LoginPage(),
                "RegisterPage" : (context) => RegisterPage(),
                "ForgetPasswordPage":(context) => ForgetPasswordPage()
              },
            );
          },
        ),
    );
  }
}


