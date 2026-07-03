import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> openWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    contactController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Login'),
        ),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 19, 18, 18),
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Register Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
                  child: const Text(
                    'sign up',
                    style: TextStyle(
                      color: Color.fromARGB(255, 90, 12, 236),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          TextField(
            controller: contactController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: '+256',
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              hintText: 'Enter your phone number',
              prefixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          const SizedBox(height: 40),

          TextField(
            controller: passwordController,
            //obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 66, 65, 65),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: implement login logic
              final contact = contactController.text;
              final password = passwordController.text;
              debugPrint('Login pressed: $contact / $password');
            },
            child: const Text('Login'),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  openWebsite('https://www.apple.com/');
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/images/apple-logo.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  openWebsite('https://www.google.com/');
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/images/google-icon.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  openWebsite('https://www.facebook.com/');
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/images/facebook_logo.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  openWebsite('https://www.X.com/');
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    'assets/images/twitter_x_logo.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
