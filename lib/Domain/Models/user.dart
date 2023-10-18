class User {
  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.difficulty = 1,
    required this.school,
    DateTime? date,
  }) : this.lastLoginDate = date ?? DateTime.now();

  int? id;
  String firstName;
  String lastName;
  String email;
  int difficulty;
  String school;
  DateTime lastLoginDate;

  String get name => '$firstName $lastName';

  String get emailAddress => '$email';

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        difficulty: json["difficulty"] ?? 1,
        school: json["school"] ?? "someschool",
        date: json["date"] != null
            ? DateTime.parse(json["date"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "difficulty": difficulty,
        "school": school,
        "date": lastLoginDate.toIso8601String(),
      };
}
