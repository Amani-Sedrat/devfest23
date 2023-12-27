import 'package:flutter/material.dart';


class login extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Back',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
 }
}

class LoginPage extends StatefulWidget {
 @override
 _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Back'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle login here
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle forgot password here
              },
              child: Text('Forgot password?'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle sign up here
              },
              child: Text('Don\'t have an account? SignUp'),
            ),
          ],
        ),
      ),
    );
 }
}