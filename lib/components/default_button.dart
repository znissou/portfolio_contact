import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 223, 239, 247)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Row(
          children: [
            Image.asset(
              imageSrc,
              height: 40,
              opacity: AlwaysStoppedAnimation(0.8),
            ),
            SizedBox(width: kDefaultPadding),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}
