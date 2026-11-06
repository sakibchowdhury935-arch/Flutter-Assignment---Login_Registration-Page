import 'package:login_reg/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String? registeredEmail;
  final String? registeredPassword;

  LoginPage({this.registeredEmail, this.registeredPassword});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Color? get bgColor => null;

  Color? get cardColor => null;

  @override
  void initState() {
    super.initState();

    emailController.text = widget.registeredEmail ?? "";
    passwordController.text = widget.registeredPassword ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      appBar: AppBar(title: Text("Login Page"), backgroundColor: Colors.blue),

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
                  "Login Form",
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ),

                SizedBox(height: 35),

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

                SizedBox(height: 15),

                // PASSWORD FIELD
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

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (emailController.text.trim() ==
                              widget.registeredEmail &&
                          passwordController.text ==
                              widget.registeredPassword &&
                          widget.registeredEmail != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login successful!")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid email or password")),
                        );
                      }
                    }
                  },

                  child: Text("Login"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                // REGISTER NAVIGATION
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },

                  child: Text(
                    "Don't have an account? Register",
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
