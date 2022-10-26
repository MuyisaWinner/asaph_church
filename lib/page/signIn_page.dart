import 'package:asaph_church/provider/google_signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child:Column(children: [
          Text('Hey Welcome back to Our app'),
          Text('SignIn With you Gmail Account'),
    
          OutlinedButton(onPressed: (){
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.login();
          }, child: Text('Create account'))
        ]),
      ),
    );
  }
}