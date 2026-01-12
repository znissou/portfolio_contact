import 'package:flutter/material.dart';
import 'package:portfolio_contact/constants.dart';

class Service {
  final int id;
  final String title, image;
  final Color color;

  const Service({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });
}

/// List of available services
const List<Service> services = [
  Service(
    id: 1,
    title: "Graphic Design",
    image: "assets/images/graphic.png",
    color: kService1Color,
  ),
  Service(
    id: 2,
    title: "Web Design",
    image: "assets/images/desktop.png",
    color: kService2Color,
  ),
  Service(
    id: 3,
    title: "UI Design",
    image: "assets/images/ui.png",
    color: kService3Color,
  ),
  Service(
    id: 4,
    title: "Interaction Design",
    image: "assets/images/Intreaction_design.png",
    color: kService4Color,
  ),
];
