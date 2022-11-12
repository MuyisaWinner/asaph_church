
import 'package:asaph_church/services/authentification.dart';
import 'package:asaph_church/services/control.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(providers: [
      StreamProvider.value(
        initialData: null,
        value: AuthServices().user,
      ),
      
    ],
    child: const App() ,)
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch : Colors.blue,
        primaryColor: Colors.blue,
        
      ),
      home: const Control(),
    );
  }
}

