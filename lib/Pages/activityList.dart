import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter/Pages/activityDetail.dart';

class ActivityList extends StatefulWidget {

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {

  Future getLists() async {

    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection("activity").getDocuments();

    return qn.documents;
  }

  NavigateToDetail (DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text ("activity list"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getLists(),
          builder: (_, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
            child: Text("Loading..."),
          );
          }else{

            return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, index){
              return ListTile(
                title: Text(snapshot.data[index].data["Name"]),
                onTap: () => NavigateToDetail(snapshot.data[index]),
              );
            });
          }
          },),),
    );
  }
}
