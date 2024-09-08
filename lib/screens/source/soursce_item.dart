
import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponce.dart';

class SourceItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  SourceItem({super.key, required this.sources,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: isSelected? Colors.green:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.green,width: 3)
      ),
      child: Text(sources.name??"",style: TextStyle(
        color: isSelected? Colors.white:Colors.green,
        fontSize:20,
      )),
    );
  }
}
