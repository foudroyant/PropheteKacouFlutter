import 'package:flutter/material.dart';
import 'package:pkp_app/pages/cantiques.dart';
import 'package:pkp_app/pages/predications.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Prophete Kacou Philippe'),
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
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(child: Card(
            child: ListTile(
              leading: Icon(Icons.menu_book),
              title: Text("Le livre du prophète"),
              subtitle: Text("Découvrez le message du prophete Kacou Philippe"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>Predications())));
              },
            ),
          ),),
          Container(child: Card(
            child: ListTile(
              leading: Icon(Icons.library_music),
              title: Text("Cantiques"),
              subtitle: Text("Que tout ce qui respire loue l'Eternel!"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>Cantiques())));
              },
            ),
          ),)
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
