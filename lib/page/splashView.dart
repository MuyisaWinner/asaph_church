import 'package:asaph_church/page/signIn_page.dart';
import 'package:asaph_church/provider/google_signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_profile.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> GoogleSignInProvider(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);
          if(provider.isSignIn){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
             return const UserProfile();

          }else if(snapshot.hasError){
            return Container(
              color: Colors.white,
              child: const Center(child: Text('Quelque chose a mal tourné\nVerifier votre reseau internet')),);
           
          } else{
            return const SignIn();
          }
          
        
      },),
    );
  }
}