import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const String routeName = '/forgot-pw-screen';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => ForgotPasswordPage(),
        settings: RouteSettings(name: routeName));
  }

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController=TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Reset link sent successfully!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Cabin'),),
        );
      });
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Cabin'),),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text('Reset your password',style: TextStyle(fontSize: 24,fontFamily: 'Cabin',fontWeight: FontWeight.w300,color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email to reset your password',
              textAlign: TextAlign.start,
            style: TextStyle(fontSize: 24,fontFamily: 'Cabin',fontWeight: FontWeight.w300),),
          ),
          SizedBox(height: 10,),
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
          SizedBox(height: 10,),

          MaterialButton(onPressed: passwordReset,
          child: Text(
            'Reset Password',
              style: TextStyle(fontSize: 20,fontFamily: 'Cabin',color: Colors.white)
          ),
          color: Colors.deepPurple,)
        ],
      ),
    );
  }
}
