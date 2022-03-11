import 'package:flutter/material.dart';
import 'package:voca_app/pages/hoem_page/home_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.green)));
}
