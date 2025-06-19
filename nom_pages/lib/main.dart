import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(color: Colors.blue, height: 100),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.red, height: 100),
                ),
              ],
            ),
            Expanded(child: Container(color: Colors.green)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(color: Colors.yellow),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.orange)),
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(child: Container(color: Colors.pink)),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Mon super tirroir bleu\nHugo Neves Paes Barreto\n2254858',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Row(
                children: [Icon(Icons.abc), SizedBox(width: 5), Text('Detail')],
              ),
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(title: 'Detail'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});

  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.orange,
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Revenir à l'acceuil"),
            ),
          ],
        ),
      ),
    );
  }
}
