import 'package:obichat/screens/auth/login_screen.dart';
import 'package:obichat/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/obi_chat_logo.png',
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to ObiChat',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 55,
              width: 150,
              child: Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(40),
                child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),),);},
                    splashColor: Colors.green.shade400,
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 17),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
