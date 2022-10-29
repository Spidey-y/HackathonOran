class AppUser {
  AppUser({
    required this.score,
    required this.phoneNumber,
    required this.id,
    required this.firstName,
    required this.familyName,
    required this.email,
    required this.address,
  });
  String id;
  String familyName;
  String firstName;
  String address;
  String phoneNumber;
  int score;
  String email;
}

class Post {
  Post({
    required this.userName,
    required this.upvote,
    required this.image,
    required this.id,
    required this.downvote,
    required this.description,
    required this.date,
  });
  String id;
  String userName;
  String date;
  String image;
  String description;
  int upvote;
  int downvote;
}
