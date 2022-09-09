class ReviewModel {
  final userName;
  final userImage;
  final review;
  double rating;

  ReviewModel(
      {required this.userImage,
      required this.userName,
      required this.review,
      required this.rating});
}
