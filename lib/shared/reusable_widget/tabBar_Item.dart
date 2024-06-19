import 'package:flutter/material.dart';
import 'package:news_app/model/sources_Response/Source.dart';

class TabBarItem extends StatelessWidget {
  TabBarItem({super.key, required this.source, required this.isSelected});
  Source source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        source.name??"",
        style: TextStyle(
            color: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
