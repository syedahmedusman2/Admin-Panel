import 'package:adminpanel/widgets/reviewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewTile extends StatelessWidget {
  ReviewTile({
    Key? key,
    required this.reviewModel,
  }) : super(key: key);
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 30,
      leading: CircleAvatar(
        backgroundImage: NetworkImage("${reviewModel.userImage}"),
      ),
      title: Text("${reviewModel.userName}"),
      subtitle: Text("${reviewModel.review}"),
      trailing: RatingBarIndicator(
        rating: reviewModel.rating,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        itemSize: 30.0,
        direction: Axis.horizontal,
      ),
    );
  }
}
