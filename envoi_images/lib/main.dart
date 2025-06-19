import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  List<String> imageNetworkPath = [];
  List<XFile> pickedImages = [];

  Future<void> getAndSendImage() async {
    ImagePicker picker = ImagePicker();
    final List<XFile> selectedFiles = await picker.pickMultiImage();
    if (selectedFiles.isNotEmpty) {
      for (var file in selectedFiles) {
        pickedImages.add(file);
      }
    }

    for (var fileImage in pickedImages) {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          fileImage.path,
          filename: fileImage.name,
        ),
      });

      Dio dio = Dio();
      var response = await dio.post(
        'http://10.0.2.2:8080/exos/file',
        data: formData,
      );
      String id = response.data as String;
      imageNetworkPath.add("http://10.0.2.2:8080/exos/file/$id");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Server Image Picker'),
      ),
      body: Center(
        child: buildListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getAndSendImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildListView() {
    if (imageNetworkPath.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: imageNetworkPath.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Image.network(imageNetworkPath[index],),
          );
        },
      );
    } else {
      return Text('Selectioner une image');
    }
  }
}
