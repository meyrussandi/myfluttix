part of 'pages.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTickets = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // NOTE : CONTENT
          BlocBuilder<TicketBloc, TicketState>(
            builder: (context, ticketState) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: TicketViewer(isExpiredTickets
                    ? ticketState.tickets
                        .where(
                            (element) => element.time.isBefore(DateTime.now()))
                        .toList()
                    : ticketState.tickets
                        .where(
                            (element) => !element.time.isBefore(DateTime.now()))
                        .toList()),
              );
            },
          ),
          // NOTE : HEADER
          Container(height: 113, color: purpleAccentColor),
          SafeArea(
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 113,
                color: purpleAccentColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin:
                            EdgeInsets.only(left: defaultMargin, bottom: 32),
                        child: Text(
                          "My Tickets",
                          style: whiteTextFont.copyWith(fontSize: 20),
                        )),
                    Row(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isExpiredTickets = !isExpiredTickets;
                                });
                              },
                              child: Text(
                                "Newest",
                                style: whiteTextFont.copyWith(
                                    fontSize: 16,
                                    color: !isExpiredTickets
                                        ? Colors.white
                                        : Color(0xff6F678E)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: !isExpiredTickets
                                  ? yellowColor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isExpiredTickets = !isExpiredTickets;
                                });
                              },
                              child: Text(
                                "Oldest",
                                style: whiteTextFont.copyWith(
                                    fontSize: 16,
                                    color: isExpiredTickets
                                        ? Colors.white
                                        : Color(0xff6F678E)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: isExpiredTickets
                                  ? yellowColor
                                  : Colors.transparent,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<TicketModel> tickets;

  TicketViewer(this.tickets);

  @override
  Widget build(BuildContext context) {
    var sortedTickets = tickets;
    sortedTickets
        .sort((tickets1, tickets2) => tickets1.time.compareTo(tickets2.time));
    return ListView.builder(
      itemCount: sortedTickets.length,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(top: index == 0 ? 133 : 20),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                context
                    .read<PageBloc>()
                    .add(GoToTicketDetailPage(sortedTickets[index]));
              },
              child: Container(
                height: 90,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(imageBaseURL +
                            "w500" +
                            sortedTickets[index].movieDetailModel.posterPath),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width -
                  16 -
                  2 * defaultMargin -
                  70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sortedTickets[index].movieDetailModel.title,
                    style: blackTextFont.copyWith(fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(sortedTickets[index].movieDetailModel.genresAndLanguage,
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 6,
                  ),
                  Text(sortedTickets[index].theater.name,
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
