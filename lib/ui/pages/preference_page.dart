part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horror",
    "Action",
    "Drama",
    "Music",
    "War",
    "Crima"
  ];

  final List<String> languages = ["Bahasa", "English", "Japanese", "Korean"];
  final RegistrationData registrationData;
  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguages = "English";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          widget.registrationData.password = "";
          context.read<PageBloc>().add(GoToSignUpPage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 4),
                      height: 56,
                      child: InkWell(
                          onTap: () {
                            context
                                .read<PageBloc>()
                                .add(GoToSignUpPage(widget.registrationData));
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    Text(
                      "Selected Your Four\nFavorite Genres",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateGenreWidgets(context),
                    ),
                    Text(
                      "Selected Your Language",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateLanguageWidgets(context),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: purpleMainColor),
                          onPressed: () {
                            if (selectedGenres.length != 4) {
                              Flushbar(
                                duration: Duration(milliseconds: 1500),backgroundColor: Color(0xffFF5C83),
                                flushbarPosition: FlushbarPosition.BOTTOM,
                                message: "Please Select 4 Genres",
                              )..show(context);
                            }else{
                              widget.registrationData.selectedGenres = selectedGenres;
                              widget.registrationData.selectedLang = selectedLanguages;

                              context.read<PageBloc>().add(GoToAccountConfirmationPage(widget.registrationData));
                            }
                          },
                          child: Text("Next",
                              style: whiteTextFont.copyWith(
                                fontSize: 20,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - (2 * defaultMargin) - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectedGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLanguageWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - (2 * defaultMargin) - 24) / 2;

    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguages == e,
              onTap: () {
                setState(() {
                  selectedLanguages = e;
                });
              },
            ))
        .toList();
  }

  void onSelectedGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }else{
        setState(() {
          selectedGenres.removeLast();
          selectedGenres.add(genre);
        });
      }
    }
  }
}
