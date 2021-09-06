import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/selected.dart';
import 'package:flutter_app/pages/profile.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/selected': (context) => Selected(),
      '/profile':(context)=>Profile()
    }
));

