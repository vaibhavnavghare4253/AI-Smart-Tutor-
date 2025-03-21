import 'package:flutter/material.dart';



class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Black curved top section
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(50),
                    // topRight: Radius.circular(50),
                    // bottomLeft: Radius.circular(50),
                    // bottomRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.center,
                child: const Column(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    SizedBox(height: 10),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Registration Form
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 20),


                child: Column(

                  children: [
                    _buildTextField("Name"),
                    const SizedBox(height: 15),
                    _buildTextField("Email"),
                    const SizedBox(height: 15),
                    _buildTextField("Password", obscureText: true),
                    const SizedBox(height: 15),
                    _buildTextField("Confirm Password", obscureText: true),
                    const SizedBox(height: 25),
                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Sign In Option
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Already have an account? Sign In.",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      ),
    );
  }
}
