import 'package:flutter/material.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  _LoginWithEmailScreenState createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _isLoginEnabled = false;
  bool _isError = false;

  void _validateInputs() {
    setState(() {
      _isLoginEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
      _isError = false; // Reset error when user types
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulating API call

    setState(() {
      _isLoading = false;
      if (_emailController.text == "sarah.jansen@gmail.com" &&
          _passwordController.text == "password123") {
        _isError = false;
        Navigator.pushNamed(context, '/home'); 
      } else {
        _isError = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            GestureDetector(
              onTap: () => Navigator.pop(context), 
              child: Icon(Icons.arrow_back, size: 24),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Log into account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Text("Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "example@example",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              ),
            ),
            SizedBox(height: 20),
            Text("Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Enter password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            if (_isError)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 16),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "Oops! Email or password incorrect. Try  again.",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _isLoginEnabled && !_isLoading ? _login : null,
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _isLoginEnabled ? (_isLoading ? Colors.purple[300] : Colors.purple) : Colors.purple[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                    : Text(
                        "Log in",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "Forgot password?",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
