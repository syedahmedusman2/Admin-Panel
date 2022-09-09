import 'package:adminpanel/widgets/reviewModel.dart';
import 'package:adminpanel/widgets/review_tile.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  Reviews({Key? key}) : super(key: key);

  List<ReviewModel> reviews = [
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 4.0),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 3.4),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 3.0),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 2),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 4.8),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 5),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 4.5),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 2.2),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 5),
    ReviewModel(
        userImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU",
        userName: "Ahmed",
        review: "Very Nice Service",
        rating: 3.0),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewTile(
          reviewModel: reviews[index],
        );
      },
    );
  }
}
