import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';

class MyWhiteboardApp extends StatefulWidget {
  const MyWhiteboardApp({super.key});

  @override
  _MyWhiteboardState createState() => _MyWhiteboardState();
}

class _MyWhiteboardState extends State<MyWhiteboardApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whiteboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Whiteboard (Free Hand Drawing)'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Column(
            children: [
              Expanded(
                child: WhiteBoard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}