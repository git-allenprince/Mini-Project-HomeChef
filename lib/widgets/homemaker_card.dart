import 'package:flutter/material.dart';
import 'package:homechef_v3/models/models.dart';
import 'widgets.dart';
import 'package:homechef_v3/widgets/category_box.dart';
import 'package:homechef_v3/widgets/food_search_box.dart';
import 'package:homechef_v3/widgets/promo_box.dart';


class HomemakerCard extends StatelessWidget {
  final Homemaker homemaker;

  const HomemakerCard({Key? key, required this.homemaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.pushNamed(context, '/homemaker-details',arguments: homemaker);
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: NetworkImage(homemaker.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(5)),

                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${homemaker.deliveryTime} min',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(homemaker.name,style: Theme.of(context).textTheme.headline5,),
                  SizedBox(height: 5,),
                  HomemakerTags(homemaker: homemaker),
                  SizedBox(height: 5,),
                  Text('${homemaker.distance}km - \₹${homemaker.deliveryFee} delivery fee',style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

