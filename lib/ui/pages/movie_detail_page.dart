part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movieModel;

  MovieDetailPage(this.movieModel);
  @override
  Widget build(BuildContext context) {
    MovieDetailModel movieDetailModel;
    List<CreditModel> credits;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(color: purpleAccentColor),
          SafeArea(
            child: Container(color: Colors.white),
          ),
          ListView(
            children: [
              FutureBuilder(
                  future: MovieServices.getMovieDetail(movieModel),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      movieDetailModel = snapshot.data;
                    }
                    return Column(
                      children: [
                        Stack(
                          children: [
                            // note: BACKDROP
                            Stack(
                              children: [
                                Container(
                                    height: 270,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(imageBaseURL +
                                                    "w1280" +
                                                    movieModel.backdropPath ??
                                                movieModel.posterPath)))),
                                Container(
                                  height: 271,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment(0, 1),
                                          end: Alignment(0, 0.06),
                                          colors: [
                                        Colors.white,
                                        Colors.white.withOpacity(0)
                                      ])),
                                ),

                                // NOTE : BACK ICON
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 20, left: defaultMargin),
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black.withOpacity(0.04)),
                                  child: InkWell(
                                      onTap: () {
                                        context
                                            .read<PageBloc>()
                                            .add(GoToMainPage());
                                      },
                                      child: Icon(Icons.arrow_back,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // NOTE : TITLE
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 16, defaultMargin, 6),
                          child: Text(movieModel.title,
                              textAlign: TextAlign.center,
                              style: blackTextFont.copyWith(fontSize: 24)),
                        ),
                        // NOTE : GENRE
                        (snapshot.hasData)
                            ? Text(movieDetailModel.genresAndLanguage)
                            : SizedBox(
                                height: 50,
                                width: 50,
                                child: SpinKitFadingCircle(
                                  color: purpleAccentColor,
                                )),
                        SizedBox(height: 6),
                        // NOTE : RATING
                        RatingStars(
                            voteAverage: movieModel.voteAverage,
                            color: greyColor,
                            alignment: MainAxisAlignment.center),
                        SizedBox(height: 24),
                        // NOTE: CREDITS
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: defaultMargin, bottom: 12),
                              child: Text("Cast & Crew",
                                  style: blackTextFont.copyWith(fontSize: 14))),
                        ),
                        FutureBuilder(
                            future: MovieServices.getCredits(movieModel.id),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                credits = snapshot.data;
                                return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: credits.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                              left: index == 0
                                                  ? defaultMargin
                                                  : 0,
                                              right: index == credits.length - 1
                                                  ? defaultMargin
                                                  : 16,
                                            ),
                                            child: CreditCard(credits[index]),
                                          );
                                        }));
                              } else {
                                return SizedBox(
                                    height: 50,
                                    child: SpinKitFadingCircle(
                                        color: purpleAccentColor));
                              }
                            }),

                        //NOTE : STORYLINE
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, 0, defaultMargin, 30),
                          child: Text(movieModel.overview,
                              style: greyTextFont.copyWith(
                                  fontWeight: FontWeight.w400)),
                        ),

                        // NOTE : BUTTON
                        Container(
                            height: 50,
                            width: 250,
                            child: ElevatedButton(
                                onPressed: () {
                                  context.read<PageBloc>().add(
                                      GoToSelectSchedulePage(movieDetailModel));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: purpleMainColor),
                                child: Text("Continue To Book",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 20)))),
                        SizedBox(height: defaultMargin)
                      ],
                    );
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
