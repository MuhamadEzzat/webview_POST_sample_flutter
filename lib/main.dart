import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => HomePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Scaffold build(BuildContext context)  {
    return Scaffold(
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse('https://jsonplaceholder.typicode.com/posts'),
            method: 'POST',
            body: Uint8List.fromList(utf8.encode(
                    " user_id=${Uri.encodeQueryComponent('1')},"
                    " body=${Uri.encodeQueryComponent('This page has a body that describes what it consists of')},"
                    " title=${Uri.encodeQueryComponent('The title of the page is the image of the paragraph for the first sight')}")
            ),
          ),
          onWebViewCreated: (controller){

          },
        )
    );
  }
}
