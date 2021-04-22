part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
            body: Container(
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
                                context.read<PageBloc>().add(GoToPreferencePage(
                                    widget.registrationData));
                              },
                              child: Icon(Icons.arrow_back)),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Confirm\nNew Account",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: purpleMainColor),
                        color: yellowColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage("assets/user_pic.png")
                                    : FileImage(
                                        widget.registrationData.profileImage))),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${widget.registrationData.name}",
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  isSigningUp
                      ? SpinKitWave(
                          color: purpleAccentColor,
                          size: 45,
                        )
                      : Container(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isSigningUp = true;
                                });

                                imageFileToUpload = widget.registrationData.profileImage;

                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                        widget.registrationData.email,
                                        widget.registrationData.password,
                                        widget.registrationData.name,
                                        widget.registrationData.selectedGenres,
                                        widget.registrationData.selectedLang);
                                if(result.userModel == null){
                                  //gagal
                                  setState(() {
                                    isSigningUp = false;
                                  });
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.BOTTOM,
                                    message: result.messagae,
                                  )..show(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: purpleMainColor),
                              child: Text(
                                "Create My Account",
                                style: whiteTextFont.copyWith(fontSize: 20),
                              )),
                        )
                ],
              )
            ],
          ),
        )));
  }
}
