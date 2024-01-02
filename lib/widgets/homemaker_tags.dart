import 'package:flutter/material.dart';
import 'package:homechef_v3/models/models.dart';
class HomemakerTags extends StatelessWidget {
  const HomemakerTags({
    super.key,
    required this.homemaker,
  });

  final Homemaker homemaker;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: homemaker.tags
            .map(
              (tag)=>homemaker.tags.indexOf(tag)==
              homemaker.tags.length-1
              ?Text(tag,style: Theme.of(context).textTheme.bodyMedium)
              :Text('$tag, '),
        )
            .toList());
  }
}