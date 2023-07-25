// ignore_for_file: public_member_api_docs, sort_constructors_first
class CarouselImage {
  String imgPath =
      'https://images.unsplash.com/photo-1650692201357-3b1b15469952?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2370&q=80';
  final String heading;
  final String category;
  final String label;
  final int discount;
  CarouselImage({
    required this.imgPath,
    this.heading = '',
    this.category = '',
    this.label = '',
    this.discount = 0,
  });
}
