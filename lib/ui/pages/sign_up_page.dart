part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;
  SignUpPage(this.registrationData);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: yellowColor)));
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              onTap: () {
                                context.read<PageBloc>().add(GoToSplashPage());
                              },
                              child: Icon(Icons.arrow_back)),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Create New\nAccount",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                  Container(
                      width: 90,
                      height: 104,
                      child: Stack(
                        children: [
                          Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: purpleMainColor, width: 2),
                                  color:
                                      (widget.registrationData.profileImage ==
                                              null)
                                          ? yellowColor
                                          : Colors.transparent,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: (widget.registrationData
                                                  .profileImage ==
                                              null)
                                          ? AssetImage("assets/user_pic.png")
                                          : FileImage(widget.registrationData
                                              .profileImage)))),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () async {
                                if (widget.registrationData.profileImage ==
                                    null) {
                                  widget.registrationData.profileImage =
                                      await getImage();
                                } else {
                                  widget.registrationData.profileImage = null;
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    color:
                                        (widget.registrationData.profileImage ==
                                                null)
                                            ? purpleMainColor
                                            : Colors.red,
                                    shape: BoxShape.circle),
                                child: (widget.registrationData.profileImage ==
                                        null)
                                    ? Icon(Icons.add, color: Colors.white)
                                    : Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          )
                        ],
                      )),
                  SizedBox(height: 36),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: "Full Name"),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: reTypePasswordController,
                    decoration: InputDecoration(hintText: "Confirm Password"),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!(nameController.text.trim() != "" &&
                              emailController.text.trim() != "" &&
                              passwordController.text.trim() != "" &&
                              reTypePasswordController.text != "")) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              backgroundColor: Color(0xffff5C83),
                              message: "Please fill all the field !",
                            )..show(context);
                          } else if (passwordController.text !=
                              reTypePasswordController.text) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              backgroundColor: Color(0xffff5C83),
                              message: "Confirm password doesn't match !",
                            )..show(context);
                          } else if (passwordController.text.length < 6) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              backgroundColor: Color(0xffff5C83),
                              message: "Password's length min 6 characters !",
                            )..show(context);
                          } else if (!EmailValidator.validate(
                              emailController.text)) {
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              backgroundColor: Color(0xffff5C83),
                              message: "Wrong formatted email adress !",
                            )..show(context);
                          } else {
                            widget.registrationData.name = nameController.text;
                            widget.registrationData.email =
                                emailController.text;
                            widget.registrationData.password =
                                passwordController.text;
                          }
                        },
                        style:
                            ElevatedButton.styleFrom(primary: purpleMainColor),
                        child: Text("Next",
                            style: whiteTextFont.copyWith(
                              fontSize: 20,
                            ))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
