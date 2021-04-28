part of "pages.dart";

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: purpleAccentColor,
          ),
          SafeArea(child: Container(color: Color(0xffF6F7F9))),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: [
              MoviePage(),
              TicketPage(),
            ],
          ),
          buildCustomBotNavBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 46,
              width: 46,
              margin: EdgeInsets.only(bottom: 42),
              child: FloatingActionButton(
                backgroundColor: yellowColor,
                elevation: 0,
                child: SizedBox(
                  width: 26,
                  height: 26,
                  child: Icon(
                    MdiIcons.walletPlus,
                    color: Colors.black.withOpacity(0.54),
                  ),
                ),
                onPressed: () {
                  context.read<PageBloc>().add(GoToTopUpPage(GoToMainPage()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCustomBotNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: purpleMainColor,
            unselectedItemColor: Color(0xffE5E5E5),
            currentIndex: bottomNavBarIndex,
            selectedLabelStyle:
                GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w600),
            unselectedLabelStyle:
                GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w600),
            onTap: (index) {
              setState(() {
                bottomNavBarIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'New Movies',
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(
                      Icons.movie,
                      color: bottomNavBarIndex == 0
                          ? purpleMainColor
                          : Color(0xffE5E5E5),
                    ),
                  )),
              BottomNavigationBarItem(
                  label: 'My Ticket',
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(
                      Icons.local_movies,
                      color: bottomNavBarIndex == 1
                          ? purpleMainColor
                          : Color(0xffE5E5E5),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
