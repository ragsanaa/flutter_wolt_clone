// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final String title;
  final String subTitle;
  final double deliveryFee;
  final String time;
  final double smileRate;
  final String imagePath;
  Post({
    required this.title,
    required this.subTitle,
    this.deliveryFee = 0,
    required this.time,
    this.smileRate = 0,
    required this.imagePath,
  });
}
