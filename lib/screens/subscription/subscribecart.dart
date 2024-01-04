import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homechef_v3/blocs/subscription/subscription_bloc.dart';

class SubscribeCartScreen extends StatelessWidget {
  static const String routeName = '/subscribecart';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SubscribeCartScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SubscribeCart')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
            child: Column(
          children: [
            Text('Item',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontFamily: 'Cabin',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            BlocBuilder<SubscriptionBloc, SubscriptionState>(
              builder: (context, state) {
                if (state is SubscriptionLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SubscriptionLoaded) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.subscription
                          .itemQuantity(state.subscription.items)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Text(
                                  '${state.subscription.itemQuantity(state.subscription.items).entries.elementAt(index).value}x'),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                    '${state.subscription.itemQuantity(state.subscription.items).keys.elementAt(index).name}'),
                              ),
                              Text(
                                  'Rs.${state.subscription.itemQuantity(state.subscription.items).keys.elementAt(index).price}'),
                            ],
                          ),
                        );
                      });
                } else
                  return Text('There is something wrong :(');
              },
            )
          ],
        )),
      ),
    );
  }
}
