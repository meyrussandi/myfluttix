part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final TicketModel ticketModel;
  TicketDetailPage(this.ticketModel);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToMainPage());
          return;
        },
        child: Scaffold(
          backgroundColor: purpleAccentColor,
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToMainPage());
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Ticket Details",
                              style: whiteTextFont.copyWith(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 170,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageBaseURL +
                                    "w500" +
                                    ticketModel.movieDetailModel.backdropPath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                      ),
                      ClipPath(
                        clipper: TopClipper(),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          color: Colors.white,
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Movie : ",
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                      ticketModel.movieDetailModel.title,
                                      maxLines: 2,
                                      style: blackTextFont.copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Cinema", style: greyTextFont),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(ticketModel.theater.name,
                                          maxLines: 2,
                                          style: blackTextFont.copyWith(
                                            fontSize: 16,
                                          )),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Seat Number", style: greyTextFont),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(ticketModel.seatsInString,
                                          maxLines: 2,
                                          textAlign: TextAlign.end,
                                          style: blackTextFont.copyWith(
                                            fontSize: 16,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Date & time", style: greyTextFont),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(ticketModel.time.dateAndTime,
                                          maxLines: 2,
                                          style: blackTextFont.copyWith(
                                            fontSize: 16,
                                          )),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Booking Code", style: greyTextFont),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(ticketModel.bookingCode,
                                          maxLines: 2,
                                          textAlign: TextAlign.end,
                                          style: blackTextFont.copyWith(
                                            fontSize: 16,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          generateDashedDivider(
                              MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  40),
                        ],
                      ),
                      ClipPath(
                        clipper: BottomClipper(),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name", style: greyTextFont),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(ticketModel.name,
                                        maxLines: 2,
                                        style: blackTextFont.copyWith(
                                          fontSize: 16,
                                        )),
                                  ),
                                  SizedBox(height: 16),
                                  Text("Paid", style: greyTextFont),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                        NumberFormat.currency(
                                                locale: "id_ID",
                                                decimalDigits: 0,
                                                symbol: "IDR ")
                                            .format(ticketModel.totalPrice),
                                        maxLines: 2,
                                        style: blackTextFont.copyWith(
                                          fontSize: 16,
                                        )),
                                  ),
                                ],
                              ),
                              QrImage(
                                  version: 6,
                                  foregroundColor: Colors.black,
                                  errorCorrectionLevel: QrErrorCorrectLevel.M,
                                  padding: EdgeInsets.all(0),
                                  size: 100,
                                  data: ticketModel.bookingCode)
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}

class TopClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomClipper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
