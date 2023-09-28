import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apple Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppleLoginPage(),
    );
  }
}

class AppleLoginPage extends StatefulWidget {
  const AppleLoginPage({super.key});

  @override
  State<AppleLoginPage> createState() => _AppleLoginPageState();
}

class _AppleLoginPageState extends State<AppleLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apple Login Demo")),
      body: Center(
        child: Platform.isIOS
            ? SignInWithAppleButton(
                onPressed: () async {
                  final credential = await SignInWithApple.getAppleIDCredential(
                      scopes: [
                        AppleIDAuthorizationScopes.email,
                        AppleIDAuthorizationScopes.fullName
                      ]).then((value) {
                    debugPrint("Cred ${value.givenName}");
                  });
                  debugPrint(credential);
                },
              )
            : const Text("Android Device"),
      ),
    );
  }
}
