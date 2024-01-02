import 'package:flutter/material.dart';
import 'package:homechef_v3/models/models.dart';
import 'widgets.dart';

class HomemakerInformation extends StatelessWidget {
  final Homemaker homemaker;

  const HomemakerInformation({Key? key, required this.homemaker})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            homemaker.name,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 10,
          ),
          HomemakerTags(homemaker: homemaker),
          SizedBox(
            height: 5,
          ),
          Text(
            '${homemaker.distance}km away - \₹${homemaker.deliveryFee} delivery fee',
            style: Theme.of(context)
                .textTheme
                .bodyText1,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Homemaker Information',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith( color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do incididunt ut labore et dolore magna aliqua.',
            style: Theme.of(context)
                .textTheme
                .bodyText1,
          )
        ],
      ),
    );
  }
}
