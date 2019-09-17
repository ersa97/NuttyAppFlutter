import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPage extends StatefulWidget {

  final DocumentSnapshot post;

  DetailPage({this.post});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      child: Card(
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 10.0, top: 35.0),
            child: Text(widget.post.data["Name"],
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold
            ),),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(widget.post.data["descriptions"]),
          ),
        ),
      ),

    );
  }
}
