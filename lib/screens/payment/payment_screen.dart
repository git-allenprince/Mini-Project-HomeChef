import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = '/payment';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => PaymentScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Go Back',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white)))
            ],
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/confirm.png',
                filterQuality: FilterQuality.high,
                width: 200.0,
                height: 200.0,
                // fit: BoxFit.cover,
                // gaplessPlayback: true,
                // repeat: ImageRepeat.noRepeat,
                // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                //   if (frame == null) {
                //     // GIF has completed its animation
                //     // Navigate to the next page
                //     Future.delayed(Duration(seconds: 2), () {
                //       Navigator.pushNamed(context, '/');
                //     }
                //     );
                //   }
                //   return child;
                // },
              ),
              Text('PAYMENT SUCCESS!'),
              // SizedBox(
              //   height: 150,
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/');
              //     },
              //     child: Text('Go back'))
            ],
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page.'),
      ),
    );
  }
}
