import 'package:firebase_series/testing/unit_test/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../unit_test/user_model.dart';

class UserPage extends StatefulWidget {
  Future<List<User>> repository;
  UserPage({super.key, required this.repository});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
 // final Repository repository = Repository(http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FutureBuilder(
            future: widget.repository,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name, style: TextStyle(fontSize: 16),),
                        subtitle: Text(snapshot.data![index].email,style: TextStyle(fontSize: 14),),
                      );
                    });
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                alignment: Alignment.center,
                child: Text(snapshot.error.toString()),
              );
            }),
      ),
    );
  }
}
