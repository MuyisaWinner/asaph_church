import 'package:asaph_church/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/signIn.dart';

class Control extends StatelessWidget {
  const Control({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return _user == null ? const SignInView() : const HomeView();
  }
}