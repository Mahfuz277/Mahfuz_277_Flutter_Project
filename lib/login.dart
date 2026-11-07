
import 'package:flutter/material.dart';
import 'widgets/input_field.dart';
import 'registration.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F2FA),

      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        backgroundColor: const Color(0xff6842C2),
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lock_open_rounded,
                    size: 65,
                    color: Color(0xff6842C2),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6842C2),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Enter your details to continue",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  InputField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email Address",
                    hintText: "example@gmail.com",
                    suffixIcon: const Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }

                      if (!RegExp(
                        r'^[\w.-]+@([\w-]+\.)+[\w-]{2,}$',
                      ).hasMatch(value)) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  InputField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: const Icon(Icons.lock_outline),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return "Password must be at least 6 characters";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xff6842C2),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Login Successful");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6842C2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Sign In"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: Color(0xff6842C2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
