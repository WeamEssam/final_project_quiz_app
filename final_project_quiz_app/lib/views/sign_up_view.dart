import 'package:flutter/material.dart';

import '../data.dart';
import '../models/user_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String gender = 'Female';
  String status = 'Single';
  double age = 18;
  bool receiveNotifications = false;
  bool agreeToTerms = false;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  Gender? _selectedGender = Gender.male;

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
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF8E84FF),
        automaticallyImplyLeading: false,
      ),
      body: Expanded(
        child: Container(
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const Center(
                  child: Text(
                    'WellnessCheck',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
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
                TextFormField(
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
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Gender: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.male,
                          groupValue: _selectedGender,
                          activeColor:
                              const Color(0xFF8E84FF), // لون المؤشر للأزرار
                          onChanged: (Gender? value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                        const Text(
                          'Male',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF8E84FF),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.female,
                          groupValue: _selectedGender,
                          activeColor: const Color(0xFF8E84FF),
                          onChanged: (Gender? value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                        const Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF8E84FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: status,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Single',
                      child: Text(
                        'Single',
                        style: TextStyle(
                          color: Color(0xFF8E84FF),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Married',
                      child: Text(
                        'Married',
                        style: TextStyle(
                          color: Color(0xFF8E84FF),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Divorced',
                      child: Text(
                        'Divorced',
                        style: TextStyle(
                          color: Color(0xFF8E84FF),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      status = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Text(
                      'Age: ${age.toInt()}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Slider(
                        value: age,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: const Color(0xFF8E84FF),
                        label: age.toInt().toString(),
                        onChanged: (value) {
                          setState(() {
                            age = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                SwitchListTile(
                  title: const Text(
                    'Receive Notifications',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: receiveNotifications,
                  activeColor: const Color(0xFF8E84FF),
                  onChanged: (value) {
                    setState(() {
                      receiveNotifications = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text(
                    'I agree to the Terms and Conditions',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  value: agreeToTerms,
                  activeColor: const Color(0xFF8E84FF),
                  onChanged: (value) {
                    setState(() {
                      agreeToTerms = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
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
                    users.add(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'User added successfully',
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF8E84FF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female }
