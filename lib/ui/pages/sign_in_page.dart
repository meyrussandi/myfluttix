part of "pages.dart";

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    context
        .read<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: yellowColor)));
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.network(
                    "https://image.flaticon.com/icons/png/128/4362/4362431.png",
                    height: 80,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome Back,\nViewer !!!",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email Address"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password? ",
                        style: greyTextFont,
                      ),
                      Text(
                        "Get Now ",
                        style: purpleTextFont.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 30),
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              AuthServices.signIn(
                                  "may.rosandy92@gmail.com", "mayrosandi");
                            },
                            style: ElevatedButton.styleFrom(
                                primary: purpleMainColor),
                            child: Text(
                              "Sign In",
                              style: whiteTextFont.copyWith(fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start fresh now? ",
                        style: greyTextFont.copyWith(fontSize: 16),
                      ),
                      Text(
                        "Sign Up ",
                        style: purpleTextFont.copyWith(fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
