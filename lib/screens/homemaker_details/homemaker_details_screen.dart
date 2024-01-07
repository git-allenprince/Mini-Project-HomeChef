import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homechef_v3/blocs/basket/basket_bloc.dart';
import 'package:homechef_v3/models/homemaker_model.dart';

import '../../widgets/homemaker_information.dart';

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
                        backgroundColor: Theme.of(context).primaryColor,
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
                  itemCount: homemaker.categories.length,
                  itemBuilder: (context, index) {
                    return _buildproduct(homemaker, context, index);
                  })
            ],
          ),
        ));
  }
}

Widget _buildproduct(Homemaker homemaker, BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          homemaker.categories[index].name,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      Column(
        children: homemaker.products
            .where((product) =>
                product.category == homemaker.categories[index].name)
            .map((product) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(product.name,
// <<<<<<< allen_new_final
//                             style: Theme.of(context).textTheme.headline3),
// =======
                            style: Theme.of(context).textTheme.displaySmall),
                        subtitle: Text(
                          product.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '\₹${product.price}',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
// <<<<<<< allen_new_final
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.add_circle,
//                                   color: Theme.of(context).primaryColor,
//                                 ))
// =======
                            BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      context.read<BasketBloc>()
                                        ..add(AddProduct(product));
                                    },
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Theme.of(context).primaryColor,
                                    ));
                              },
                            )
// >>>>>>> master
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
