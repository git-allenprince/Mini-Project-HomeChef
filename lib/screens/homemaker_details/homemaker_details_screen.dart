import 'package:flutter/material.dart';
import 'package:homechef_v3/models/homemaker_model.dart';

import '../../widgets/homemaker_information.dart';
import 'package:flutter/widgets.dart';

class HomemakerDetailsScreen extends StatelessWidget {
  const HomemakerDetailsScreen({Key? key, required this.homemaker})
      : super(key: key);
  static const String routeName = '/homemaker-details';

  static Route route({required Homemaker homemaker}) {
    return MaterialPageRoute(
        builder: (_) => HomemakerDetailsScreen(homemaker: homemaker),
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
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 50)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/basket');
                    },
                    child: Text('Basket',
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
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 50)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(homemaker.imageUrl))),
              ),
              HomemakerInformation(homemaker: homemaker),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: homemaker.tags.length,
                  itemBuilder: (context, index) {
                    return _buildMenuItems(homemaker, context, index);
                  })
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
              .headline2!
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
                            style: Theme.of(context).textTheme.headline3),
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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Theme.of(context).primaryColor,
                                ))
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
