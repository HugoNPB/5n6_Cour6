import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imagepath = "";

  Future<void> getImage() async {
    ImagePicker picker = ImagePicker();
    var pickerdImage = await picker.pickImage(source: ImageSource.gallery);
    imagepath = pickerdImage!.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Image Picker'),
      ),
      body: Center(child: buildContainer()),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Container buildContainer() {
    if (imagepath == "") {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(decoration: InputDecoration(hintText: 'Username')),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(hintText: 'Password')),

              // (imagepath == "")
              //     ? Text("Selectioner une image")
              //     : Image.file(File(imagepath)),
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(imagepath)),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(decoration: InputDecoration(hintText: 'Username')),
                    SizedBox(height: 20),
                    TextField(decoration: InputDecoration(hintText: 'Password')),

                    // (imagepath == "")
                    //     ? Text("Selectioner une image")
                    //     : Image.file(File(imagepath)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
