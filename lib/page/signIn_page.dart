import 'package:asaph_church/provider/google_signIn.dart';
import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color.fromARGB(255, 0, 157, 255),
                Color.fromARGB(255, 0, 63, 157),
              ]),
              image: DecorationImage(
                  image: AssetImage('assets/image/asaph_01.jpeg'),
                  fit: BoxFit.fitHeight,
                  opacity: 0.2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/image/logo2.png',
                    width: 80,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ))
                ],
              ),
              Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  'Bienvenue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w800),
                ),
                const Text(
                  'dans le monde future',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),

                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    print('tap tap');
                    final provider = Provider.of<GoogleSignInProvider>(context,
                            listen: false);
                        provider.login();
                  },
                  child: Container(
                   
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.white)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Image(image: AssetImage('assets/image/google.png'), width: 50,),
                         Text('Continuer avec Gmail', style: TextStyle(color: Colors.white, fontSize: 20),),
                        
                      ],
                    ),
                  ),
                ),

                   
              ]),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
