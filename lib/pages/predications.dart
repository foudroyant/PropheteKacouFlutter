import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_app/db/db.dart';
import 'package:pkp_app/pages/versets.dart';

class Predications extends StatefulWidget {
  const Predications({Key? key}) : super(key: key);

  @override
  State<Predications> createState() => _PredicationsState();
}

class _PredicationsState extends State<Predications> {

  List predications=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get("predication").then((value) {
      setState(() {
        predications=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prédications")),
      body: ListView.builder(
        itemCount: predications.length,
        itemBuilder: (context, index) {
          final chapitre=predications[index];
          return Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2), child: Card(
            child: ListTile(
              title: Text("${chapitre["chapitre"]} : ${chapitre["titre"]}"),
              subtitle: Text("${chapitre["sous_titre"]}"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>Versets(chapitre: chapitre,))));
              },
            ),
          ),);
        },
      ),
    );
  }
}
