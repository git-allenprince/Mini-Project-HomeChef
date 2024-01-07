import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homechef_v3/blocs/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({Key? key}) : super(key: key);
  static const String routeName = '/editbasket';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => EditBasketScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Basket'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pushNamed('/editbasket');
        //       },
        //       icon: Icon(Icons.edit))
        // ],
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
                    Navigator.pop(context);
                  },
                  child: Text('Done',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white)))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Cutlery'),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(top: 10, bottom: 10),
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(5)),
            //   child: Row(
            //     children: [
            //       Expanded(child: Text('Do you need Cutlery')),
            //       BlocBuilder<BasketBloc, BasketState>(
            //         builder: (context, state) {
            //           if (state is BasketLoading) {
            //             return Center(
            //               child: CircularProgressIndicator(),
            //             );
            //           } else if (state is BasketLoaded) {
            //             return Expanded(
            //               child: SwitchListTile(
            //                 dense: true,
            //                 value: state.basket.cutlery,
            //                 onChanged: (bool? newValue) {
            //                   context.read<BasketBloc>().add(ToggleSwitch());
            //                 },
            //               ),
            //             );
            //           } else
            //             return Text('something is wrong');
            //         },
            //       )
            //     ],
            //   ),
            // ),
            Text(
              'Item',
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontFamily: 'Cabin',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                if (state is BasketLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is BasketLoaded) {
                  return state.basket.items.length == 0
                      ? Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Basket is empty.')],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
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
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                        '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}'),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveAllItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.remove_circle)),
                                  IconButton(
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(AddItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.add_circle))
                                ],
                              ),
                            );
                          });
                } else
                  return Text('There is something wrong :(');
              },
            ),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(top: 5),
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(5)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SizedBox(height: 20),
            //           Text('Delivery in 20 min'),
            //           TextButton(onPressed: () {}, child: Text('Change')),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(top: 5),
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(5)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           SizedBox(height: 20),
            //           Text('Do you have a voucher?'),
            //           TextButton(onPressed: () {}, child: Text('Apply')),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.only(top: 5),
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(5)),
            //   child: BlocBuilder<BasketBloc, BasketState>(
            //     builder: (context, state) {
            //       if (state is BasketLoading) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (state is BasketLoaded) {
            //         return Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text('Subtotal'),
            //                 Text('Rs.${state.basket.subtotal}'),
            //               ],
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text('Delivery Fee'),
            //                 Text('Rs.70'),
            //               ],
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text('Total'),
            //                 Text('Rs.${state.basket.totalString}'),
            //               ],
            //             ),
            //           ],
            //         );
            //       } else {
            //         return Text('Something went wrong');
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
