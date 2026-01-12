import 'package:flutter/material.dart';

import '../../constants.dart';

/// A reusable section title widget with a colored accent bar
class SectionTitle extends StatelessWidget {
  /// Creates a section title widget
  const SectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  /// The main title text
  final String title;

  /// The subtitle text
  final String subTitle;

  /// The accent color for the vertical bar
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      constraints: const BoxConstraints(maxWidth: 1110),
      height: kSectionTitleHeight,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            padding: EdgeInsets.only(bottom: 72),
            width: kSectionTitleWidth,
            height: kSectionTitleHeight,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subTitle,
                style: kSectionTitleTextStyle,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
