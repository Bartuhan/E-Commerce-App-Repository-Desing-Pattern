import 'package:e_commerce_ui_project/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       firstName: data['firstName'] ?? '',
  //       lastName: data['lastName'] ?? '',
  //       userName: data['userName'] ?? '',
  //       email: data['email'] ?? '',
  //       phoneNumber: data['phoneNumber'] ?? '',
  //       profilePicture: data['profilePicture'] ?? '',
  //     );
  //   }
  //   return
  // }

  // Helper Functions

  // Get FullName
  String get fullName => '$firstName $lastName';

  // Format phoneNumber
  String get formattedPhoneNo => TFormatter.phoneFormatter(phoneNumber);

  // Static function to split full name into first anad last name
  static List<String> nameParts(fullName) => fullName.split(' ');

  // Static function to generate a username from the fullname
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUserName = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUserName';
    return usernameWithPrefix;
  }

  // Static func to create empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');
}
