import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/db.dart';

class Chants extends StatefulWidget {
  final Map chantre;
  const Chants({Key? key, required this.chantre}) : super(key: key);

  @override
  State<Chants> createState() => _ChantsState();
}

class _ChantsState extends State<Chants> {
  List chants=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get("cantique").then((value) {
      List temp=value;
      setState(() {
        chants=temp.where((element) => element["num_chantre"]==widget.chantre["numero"]).toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.chantre["nom"]}"),
      ),
      body: ListView.builder(itemCount: chants.length, itemBuilder: (context, index) {
        final chant=chants[index];
        return Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          child: Card(child: ListTile(
            leading: Icon(Icons.music_note),
            title: Text("${chant["titre"]}"),
            onTap: (){
              chant_select=chant;
              showFlexibleBottomSheet(
                minHeight: 0,
                initHeight: 0.8,
                maxHeight: 0.8,
                context: context,
                builder: _buildBottomSheet,
                isExpand: false,
              );
            },
          ),),);
      },)
    );
  }

  Widget _buildBottomSheet(
      BuildContext context,
      ScrollController scrollController,
      double bottomSheetOffset,
      ) {
    return Material(
      child: Container(
        child: ListView(
            controller: scrollController,
            shrinkWrap: true,
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.music_note),
                title: Text("${chant_select["titre"]}"),
                subtitle: chant_select["paroles"]==null? Text("Nous n'avons pas les paroles de ce chant") : Text("${chant_select["paroles"]}")
              ),
            )
          ],
        ),
      ),
    );
  }
}
