part of 'pages.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // note: Header
        Container(
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          decoration: BoxDecoration(
              color: purpleAccentColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload).then((value) {
                    imageFileToUpload = null;
                    context
                        .read<UserBloc>()
                        .add(UpdateData(profileImage: value));
                  });
                }

                return Row(
                  children: [
                    InkWell(
                      onTap:(){
                        context.read<PageBloc>().add(GoToProfilePage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xff5F5588), width: 1)),
                        child: Stack(
                          children: [
                            SpinKitFadingCircle(
                              color: purpleAccentColor,
                              size: 50,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          (userState.userModel.profilePicture ==
                                                  "")
                                              ? AssetImage("assets/user_pic.png")
                                              : NetworkImage(userState
                                                  .userModel.profilePicture))),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width -
                                2 * defaultMargin -
                                78,
                            child: Text(
                              userState.userModel.name,
                              style: whiteTextFont.copyWith(fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            )),
                        InkWell(
                          onTap:(){
                            context.read<PageBloc>().add(GoToWalletPage(GoToMainPage()));
                          },
                          child: Text(
                            NumberFormat.currency(
                                    locale: "id_ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(userState.userModel.balance),
                            style: yellowNumberFont.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(color: purpleAccentColor, size: 50);
              }
            },
          ),
        ),
        // note : NOW PLAYING
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 20),
            child: Text(
              "Now Playing",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                List<MovieModel> movies = movieState.movies.sublist(0, 10);
                return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index == movies.length - 1) ? defaultMargin : 16),
                    child: MovieCard(
                      movies[index],
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToMovieDetailPage(movies[index]));
                      },
                    ),
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: purpleMainColor,
                  size: 50,
                );
              }
            },
          ),
        ),

        // note : BROWSE MOVIE
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 20),
            child: Text(
              "Browse Movie",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            if (userState is UserLoaded) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      userState.userModel.selectedGenres.length,
                      (index) => BrowseButton(
                          userState.userModel.selectedGenres[index])),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: purpleMainColor,
                size: 50,
              );
            }
          },
        ),

        // note : COMING SOON
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 20),
            child: Text(
              "Coming Soon",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                List<MovieModel> movies = movieState.movies.sublist(10);
                return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index == movies.length - 1) ? defaultMargin : 16),
                    child: ComingSoonCard(movies[index]),
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: purpleMainColor,
                  size: 50,
                );
              }
            },
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 20),
            child: Text(
              "Get Lucky Day",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold),
            )),
        Column(
          children: dummyPromos.map((e) {
            return Padding(
              padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
              child: PromoCard(e),
            );
          }).toList(),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
