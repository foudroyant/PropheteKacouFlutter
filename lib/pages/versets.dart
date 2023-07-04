import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pkp_app/db/db.dart';

class Versets extends StatefulWidget {
  final Map chapitre;
  const Versets({Key? key, required Map this.chapitre}) : super(key: key);

  @override
  State<Versets> createState() => _VersetsState();
}

class _VersetsState extends State<Versets> {

  List versets=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get("verset").then((value) {
      List tmp=value;
      setState(() {
        versets=tmp.where((element) => element["num_pred"]==widget.chapitre["numero"]).toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.chapitre["chapitre"]} : ${widget.chapitre["titre"]}"),
      ),
      body: Column(children: [
        Container(child: Card(child: ListTile(
           title: widget.chapitre["similar_sermon"]==null? Text("Pas de sermons similairs") : Text("Sermon(s) similair(s) : ${widget.chapitre["similar_sermon"]}"),
          subtitle: Text("${widget.chapitre["sous_titre"]}"),
        ),),),
        Expanded(child: ListView.builder(itemCount: versets.length, itemBuilder: (context, index) {
          final verset=versets[index];
          return Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text("${verset["numero"]}/ ${verset["contenu"]}"),);
        },))
      ],),
    );
  }
}
