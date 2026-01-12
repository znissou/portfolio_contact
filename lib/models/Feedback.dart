import 'package:flutter/material.dart';
import 'package:portfolio_contact/constants.dart';

class Feedback {
  final String name, review, userPic;
  final int id;
  final Color color;

  const Feedback({
    required this.name,
    required this.review,
    required this.userPic,
    required this.id,
    required this.color,
  });
}

/// List of feedback items
const List<Feedback> feedbacks = [
  Feedback(
    id: 1,
    name: "Ronald Thompson",
    review: kDefaultReview,
    userPic: "assets/images/people.png",
    color: kService3Color,
  ),
  Feedback(
    id: 2,
    name: "Ronald Thompson",
    review: kDefaultReview,
    userPic: "assets/images/people.png",
    color: kService1Color,
  ),
  Feedback(
    id: 3,
    name: "Ronald Thompson",
    review: kDefaultReview,
    userPic: "assets/images/people.png",
    color: kService4Color,
  ),
];
