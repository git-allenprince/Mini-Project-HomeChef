import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homechef_v3/blocs/subscription/subscription_bloc.dart';
import 'package:homechef_v3/models/homemaker_model.dart';

class SubscribeHomemakerScreen extends StatelessWidget {
  const SubscribeHomemakerScreen({Key? key, required this.homemaker})
      : super(key: key);
  static const String routeName = '/subhomedetails';

  static Route route({required Homemaker homemaker}) {
    return MaterialPageRoute(
        builder: (_) => SubscribeHomemakerScreen(homemaker: homemaker),
        settings: RouteSettings(name: routeName));
  }

  final Homemaker homemaker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        backgroundColor: Theme.of(context).backgroundColor,
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
                      Navigator.pushNamed(context, '/subscribecart');
                    },
                    child: Text('Your Subscriptions',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Colors.white)))
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homemaker.tags.length,
                  itemBuilder: (context, index) {
                    return _buildMenuItems(homemaker, context, index);
                  }),
            ],
          ),
        ));
  }
}

Widget _buildMenuItems(Homemaker homemaker, BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          homemaker.tags[index],
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      Column(
        children: homemaker.menuItems
            .where((menuItems) => menuItems.category == homemaker.tags[index])
            .map((menuItems) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(menuItems.name,
                            style: Theme.of(context).textTheme.displaySmall),
                        subtitle: Text(
                          menuItems.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\₹${menuItems.price}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            BlocBuilder<SubscriptionBloc, SubscriptionState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      context.read<SubscriptionBloc>()
                                        ..add(AddSubItem(menuItems));
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Theme.of(context).primaryColor,
                                    ));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    )
                  ],
                ))
            .toList(),
      )
    ],
  );
}
