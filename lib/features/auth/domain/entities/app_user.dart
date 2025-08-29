class AppUser {
  final String uid;
  final String email;

  AppUser({
    required this.uid,
    required this.email,
  });

  //convert app user -> json
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
  };
}