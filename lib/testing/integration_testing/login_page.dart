import 'package:firebase_series/testing/integration_testing/dashboard_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();


  void LoginButtonClick(BuildContext context){
    if(userNameController.text == 'username' && passWordController.text == 'password'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoardScreen()));
    }else{
      // show password wroung dialog
      showDialog(
        
        context: context, builder: (context) => AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Alert',style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),),
            SizedBox(height: 10,),
            Text("Please Check Your Login Credentials"),
          ],
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Ok'),)
        ],),);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Developer", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
            SizedBox(height: 25,),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter User Name'
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller:  passWordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Password'
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
                LoginButtonClick(context);
            }, 
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40),
              backgroundColor: Colors.blue
            ),
            child: Text('Login',style: TextStyle(color: Colors.black, fontSize: 18),))
          ],
        ),
      ),
    );
  }
}