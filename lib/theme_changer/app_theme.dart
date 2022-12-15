import 'package:flutter/material.dart';
import 'package:flutter_project/util/const_value.dart';

class AppTheme{

  get darkTheme => ThemeData.dark().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56)
          )
      ),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding
          ),
          border:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none
          )
      )
  );

  get lightTheme => ThemeData(
      primarySwatch: Colors.blue,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56)
          )
      ),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding
          ),
          border:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none
          )
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.blue))
      )
  );

}