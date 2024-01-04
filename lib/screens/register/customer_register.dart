import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key,required this.showCustomerLoginScreen}) : super(key: key);
  final VoidCallback showCustomerLoginScreen;
  static const String routeName = '/customerregister';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CustomerRegisterScreen(showCustomerLoginScreen: () {  },),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _CustomerRegisterScreenState createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _ageController=TextEditingController();
  final TextEditingController _locationController=TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future signup() async{
    if(passwordConfirmed()){
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      //add user
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _locationController.text.trim(),
        int.parse(_ageController.text.trim()),
        _emailController.text.trim()
      );
    }
  }

  Future<void> addUserDetails(String firstName, String lastName, String location, int age, String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'first name': firstName,
        'last name': lastName,
        'location': location,
        'age': age,
        'email': email,
      });
      print('Data added to Firestore successfully');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }
  bool passwordConfirmed(){
    if(_passwordController.text.trim()==_confirmPasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello There!',
                  style: GoogleFonts.bebasNeue(fontSize: 54),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Register below',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                //first name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'First name',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Last name',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Location',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Age',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Confirm Password',
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

              //login button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signup,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: Colors.white,
                            ),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

              //not a member,register

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showCustomerLoginScreen,
                      child: Text(
                        ' Login now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//return PopScope(
//     canPop: false,
//     child: Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.deepPurple,
//         // title: Text(
//         //   'Create\nAccount',
//         //   style: TextStyle(
//         //     color: Colors.white,
//         //     fontFamily: 'Signika',
//         //     fontSize: 20,
//         //     fontWeight: FontWeight.bold,
//         //   ),
//         // ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.deepPurple,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Container(
//             child: Column(
//               children: [
//                 SizedBox(height: 50),
//                 Text('Create\nAccount',
//                     // textAlign: TextAlign.start,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Signika',
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 TextField(
//                   style: TextStyle(color: Colors.white),
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     prefixIcon: Icon(Icons.email, color: Colors.white),
//                     labelStyle: TextStyle(color: Colors.white),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   style: TextStyle(color: Colors.white),
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     prefixIcon: Icon(Icons.lock, color: Colors.white),
//                     labelStyle: TextStyle(color: Colors.white),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   style: TextStyle(color: Colors.white),
//                   controller: _passwordConfirmController,
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     prefixIcon: Icon(Icons.lock, color: Colors.white),
//                     labelStyle: TextStyle(color: Colors.white),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 60),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Register'),
//                 ),
//                 SizedBox(height: 30),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate back to the login page
//                     Navigator.pushNamed(context, '/customerlogin');
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 55),
//                       Text(
//                         'Already a member?',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(width: 4),
//                       const Text(
//                         'Login',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
