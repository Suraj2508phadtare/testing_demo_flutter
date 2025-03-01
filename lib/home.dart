import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Storage"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 70),
            ),
            SizedBox(height: 15,),
          editingTextUi(userNameController,"Enter Username", false),
          SizedBox(height: 10,),
          editingTextUi(passWordController, "Enter Password", true),

          SizedBox(height: 20,),

          ElevatedButton(
            onPressed: () {}, 
            child: Text("SIGN UP"),
         
          )
          ],
        ),
      ),
    );
  }

  editingTextUi(TextEditingController controller, String hintText, bool isTextTrue){
    return TextField(
            controller: controller,
            obscureText: isTextTrue,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: hintText
            ),
            );
  }
}