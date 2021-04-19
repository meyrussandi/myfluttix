part of "pages.dart";

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              AuthServices.signIn("may.rosandy92@gmail.com", "mayrosandi");
            },
            child: Text("Sign In")),
      ),
    );
  }
}
