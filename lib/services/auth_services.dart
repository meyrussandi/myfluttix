part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      //authResult sudah diganti jadi UserCredential
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(userModel);

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(messagae: e.toString().split("]")[1]);
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = await result.user.fromFireStore();
      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(messagae: e.toString().split("]")[1]);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}

//class untuk mengecek hasil response result jika gagal
class SignInSignUpResult {
  final UserModel userModel;
  final String messagae;

  SignInSignUpResult({this.userModel, this.messagae});
}
