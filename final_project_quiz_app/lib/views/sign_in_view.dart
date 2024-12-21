import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/views/home_view.dart';

import 'sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const String routeName = '/sign_in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isCheckedBox = false;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sign in',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF8E84FF),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //  width: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    Color(0xFF24243E),
                    Color(0xFF302B63),
                    Color(0xFF0F0C29),
                  ],
                  stops: [0.1, 0.5, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.asset(
                            'assets/images/photo.jpg',
                            height: 80,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'WellnessCheck',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32.0),
                        // Email TextField
                        TextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Password TextField
                        TextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text(
                              'Remember Me',
                              style: TextStyle(color: Colors.white),
                            ),
                            const Spacer(),
                            Checkbox(
                              value: isCheckedBox,
                              activeColor: const Color(0xFF8E84FF),
                              checkColor: Colors.white,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedBox = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF8E84FF),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: InkWell(
                              onTap: () {
                                final user = UserModel(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                if (user.email.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter email',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                if (user.password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter password',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                bool isEmailFound = false;
                                bool isCorrectPassword = false;
                                for (int i = 0; i < users.length; i++) {
                                  final userModel = users[i];
                                  if (userModel.email == user.email) {
                                    isEmailFound = true;
                                    if (userModel.password == user.password) {
                                      isCorrectPassword = true;
                                    }
                                    break;
                                  }
                                }
                                if (!isEmailFound) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Email not found',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                if (!isCorrectPassword) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Incorrect password',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Signed in successfully',
                                    ),
                                  ),
                                );
                                Navigator.pushNamed(
                                    context, HomeView.routeName);
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUpView();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(
                              color: Color(0xFF8E84FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
