import 'package:flutter/material.dart';
import 'package:homechef_v3/models/daysoftheweek.dart';
import 'package:homechef_v3/models/homemaker_model.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key, required this.homemaker})
      : super(key: key);
  static const String routeName = '/subscription';

  static Route route({required Homemaker homemaker}) {
    return MaterialPageRoute(
        builder: (_) => SubscriptionScreen(homemaker: homemaker),
        settings: RouteSettings(name: routeName));
  }

  final Homemaker homemaker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Plan'),
      ),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Subscription Request Sent. You will recieve an email.'),
                      ),
                    );
                  },
                  child: Text('Subscribe',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white)))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              for (Day day in Day.days)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/subhomedetails',
                              arguments: homemaker);
                        },
                        child: Container(
                          width: 200,
                          child: Center(child: Text('${day.day}')),
                        )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
