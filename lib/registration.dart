
import 'package:flutter/material.dart';
import 'widgets/input_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successful!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        backgroundColor: const Color(0xff6842C2),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              const Icon(
                Icons.person_add_alt_1,
                size: 70,
                color: Color(0xff6842C2),
              ),

              const SizedBox(height: 20),

              const Text(
                "Create Your Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              InputField(
                controller: nameController,
                keyboardType: TextInputType.name,
                labelText: "Full Name",
                hintText: "Enter your name",
                suffixIcon: const Icon(Icons.person_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

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

              const SizedBox(height: 20),

              InputField(
                controller: confirmPasswordController,
                keyboardType: TextInputType.text,
                labelText: "Confirm Password",
                hintText: "Re-enter your password",
                suffixIcon: const Icon(Icons.lock_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password";
                  }

                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6842C2),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Register"),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
