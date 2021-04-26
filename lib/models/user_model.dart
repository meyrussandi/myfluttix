part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  UserModel(this.id, this.email,
      {this.profilePicture,
      this.name,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  UserModel copyWith({String name, String profilePicture, int balance}) =>
      UserModel(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  @override
  String toString() {
    // TODO: implement toString
    return "[$id] - $name , $email";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
