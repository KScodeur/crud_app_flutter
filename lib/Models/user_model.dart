// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   int? age;

//   User(this.id, this.firstName, this.lastName, this.age);

//   Map<String, dynamic> toMap() {
//     return {'id': id, 'firstName': firstName, 'lastName': lastName, 'age': age};
//   }

//   factory User.fromMap(Map<String, dynamic> map) =>
//       User(map['id'], map['firstName'], map['lastName'], map['age']);

//   Map<String, dynamic> toJson() =>
//       {'id': id, 'firstName': firstName, 'lastName': lastName, 'age': age};
// }

class User {
  int? id;
  String? firstName;
  String? lastName;
  int? age;

  User({this.id, this.firstName, this.lastName, this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        age: json['age'] 
        );
  }

    Map<String, Object?> toMap() {
    return {'id': id, 'firstName': firstName, 'lastName': lastName, 'age': age};
  }
 }
