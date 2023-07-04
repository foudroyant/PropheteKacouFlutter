import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_app/db/db.dart';
import 'package:pkp_app/pages/chants.dart';

class Cantiques extends StatefulWidget {
  const Cantiques({Key? key}) : super(key: key);

  @override
  State<Cantiques> createState() => _CantiquesState();
}

class _CantiquesState extends State<Cantiques> {

  List chantres=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get("chantre").then((value) {
      //print(value);
      setState(() {
        chantres=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cantiques"),
      ),
      body: ListView.builder(
        itemCount: chantres.length,
        itemBuilder: (context, index) {
          final chantre=chantres[index];
          return Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2), child: Card(
            child: ListTile(
              title: Text("${chantre["nom"]}"),
              //subtitle: Text("${chapitre["sous_titre"]}"),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context)=>Chants(chantre: chantre))));
              },
            ),
          ),);
        },
      ),
    );
  }
}
