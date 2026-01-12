import 'package:flutter/material.dart';
import 'package:portfolio_contact/views/contact_section/contact_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
