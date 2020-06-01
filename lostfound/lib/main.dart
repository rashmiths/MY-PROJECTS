import 'package:flutter/material.dart';
import 'package:l_a_f/Authentication.dart';
import 'package:l_a_f/Mapping.dart';
import 'LoginRegister.dart';
import 'homepage.dart';

void main()
{
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"lost and found",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MappingPage(auth: Auth()),


    );
  }
}