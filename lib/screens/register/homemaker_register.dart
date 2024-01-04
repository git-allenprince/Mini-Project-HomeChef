import 'package:flutter/material.dart';

class HomemakerRegisterScreen extends StatefulWidget {
  const HomemakerRegisterScreen({Key? key}) : super(key: key);

  static const String routeName = '/homemakerregister';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomemakerRegisterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _HomemakerRegisterScreenState createState() =>
      _HomemakerRegisterScreenState();
}

class _HomemakerRegisterScreenState extends State<HomemakerRegisterScreen> {
  final _formfield = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final licenseController = TextEditingController();

  Future<void> _register() async {
    // Implement your registration logic here
    // For simplicity, this example only prints the email
    print("User registered: ${emailController.text}");
    Navigator.pushNamed(context, '/customerlogin');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.deepPurple,
            // title: Text(
            //   'Create\nAccount',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontFamily: 'Signika',
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text('Create\nAccount',
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Signika',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: licenseController,
                      decoration: InputDecoration(
                        labelText: 'FSSAI License',
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Register'),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        // Navigate back to the login page
                        Navigator.pushNamed(context, '/homemakerlogin');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 55),
                          Text(
                            'Already a member?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
