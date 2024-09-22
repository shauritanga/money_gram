import 'package:flutter/material.dart';
import 'package:money_gram/constants/color.dart';
import 'package:money_gram/screens/home.dart';
import 'package:money_gram/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Money Gram",
              style: TextStyle(fontSize: 18),
            ),
            Divider(
              indent: 16.0,
              endIndent: 16.0,
            )
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: kToolbarHeight, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Email"),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MyAppColor.lightGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (newEmail) => email = newEmail!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }

                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const Text("Password"),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: MyAppColor.lightGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (newPassword) => password = newPassword!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }

                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 38),
              MaterialButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();

                    final Map<String, dynamic> credentials = {
                      "email": email,
                      "password": password
                    };

                    final response = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: MyAppColor.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        content: Text(
                          credentials.toString(),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: const Text("Ok"),
                          )
                        ],
                      ),
                    );

                    if (!response) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login faled"),
                        ),
                      );
                      return;
                    }
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const HomeScreen(),
                        ),
                        (ctx) => false);
                  }
                },
                height: 48,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: MyAppColor.primary,
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: MyAppColor.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 18,
                          color: MyAppColor.primary,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
