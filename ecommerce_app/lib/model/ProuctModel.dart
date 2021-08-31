class Product {
  String title;
  String images;
  String deskription;
  List<CommentModel> comments;
  double price;
  String type;
  Product(
      {required this.title,
        required this.images,
        required this.comments,
        required this.deskription,
        required this.price,
        required this.type});
}

class CommentModel {
  double rating;
  String user;
  String text;

  CommentModel({required this.user, required this.text, required this.rating});
}
