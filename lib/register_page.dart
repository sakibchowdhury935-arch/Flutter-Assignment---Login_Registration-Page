import 'package:login_reg/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Color? get bgColor => null;

  Color? get cardColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(
        title: Text("Register Page"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Container(
          width: 380,
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
          ),

          child: Form(
            key: formKey,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),

                Text(
                  "Register Form",
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ),

                SizedBox(height: 30),

                TextFormField(
                  controller: nameController,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    }

                    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return "Name must contain only letters";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your email";
                    }

                    if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value)) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: passwordController,

                  obscureText: true,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    }

                    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$')
                        .hasMatch(value)) {
                      return "Minimum 8 characters with a number";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: confirmPasswordController,

                  obscureText: true,

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm your password";
                    }

                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,

                        MaterialPageRoute(
                          builder: (context) => LoginPage(
                            registeredEmail: emailController.text.trim(),

                            registeredPassword: passwordController.text,
                          ),
                        ),
                      );
                    }
                  },

                  child: Text("Register"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),

                SizedBox(height: 15),

                // LOGIN NAVIGATION
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
