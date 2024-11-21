import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _mailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  String? _validateEmail(String? value){
    if(value == null||value.isEmpty){
      return
          'Please enter your email';
    }
    final emailPattern=r'^[^@]+@[^@]+\.[^@]+';
    final regex = RegExp(emailPattern);
    if(!regex.hasMatch(value)){
      return 'Enter a valid email address!';
    };


  }
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Login Page',
            style: TextStyle(fontSize: 30, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('images/logo_flut.png'),
              Text(
                "Welcome Back",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _mailcontroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
