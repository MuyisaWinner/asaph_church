import 'package:asaph_church/services/authentification.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool fetching = false;

  void signIn() {
    setState(() {
      fetching = true;
      AuthServices().signInWithGoogle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/jeun01.png'),
                opacity: 0.3,
                fit: BoxFit.contain),
            gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
              Color(0xFF0021A4),
              Theme.of(context).primaryColor,
            ])),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: 150,
              child: Image.asset('assets/image/logo2.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Rejoignez la communauté des jeunes',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.ubuntu(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: Colors.white,
                      )),
                  Text('et partagez l\'expérience',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.ubuntu(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () => signIn(),
                        child: fetching
                            ? Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        color: Colors.black45,
                                        blurRadius: 10,
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/image/google.png'))),
                                    ),
                                    Text('Continuer avec Gmail',
                                        style: GoogleFonts.ubuntu(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Theme.of(context).primaryColor,
                                        )),
                                  ],
                                )),
                              ),
                      )),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
