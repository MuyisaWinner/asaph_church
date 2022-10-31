import 'package:asaph_church/provider/google_signIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User profile'),),
      body :Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user!.photoURL!),),
            

            Text('name'),
            Text(user!.displayName!),
            Text('email'),
            Text(user!.email!),

            OutlinedButton(onPressed: (){
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logOut();

            }, child: Text('Desconect')),

            
          ],
        ),
      ),
    );
  }
}