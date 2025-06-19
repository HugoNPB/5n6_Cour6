import 'package:flutter/material.dart';
import 'package:nom_web_service/http/lib_http.dart';
import 'package:nom_web_service/http/transfer.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var continentController = TextEditingController();
  var familleController = TextEditingController();

  List<Animal> animals = [];

  Future<void> chercherAnimaux(String continent, String famille) async {
    animals = await getAnimals(continent, famille);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Accueil'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Continent'),
                  controller: continentController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'Famille'),
                  controller: familleController,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    chercherAnimaux(
                      continentController.text,
                      familleController.text,
                    );
                  },
                  child: Text('Rechercher les animaux'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: animals.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('${animals[index].nom}\n ${animals[index].espece}'),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
