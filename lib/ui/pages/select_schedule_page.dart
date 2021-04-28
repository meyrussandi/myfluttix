part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetailModel movieDetailModel;

  SelectSchedulePage(this.movieDetailModel);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  TheaterModel selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToMovieDetailPage(widget.movieDetailModel));
          return;
        },
        child: Scaffold(
            body: Stack(
          children: [
            Container(color: purpleAccentColor),
            SafeArea(child: Container(color: Colors.white)),
            ListView(
              children: [
                // NOTE : BACK ICON
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: defaultMargin),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.04)),
                      child: InkWell(
                          onTap: () {
                            context.read<PageBloc>().add(
                                GoToMovieDetailPage(widget.movieDetailModel));
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black)),
                    ),
                  ],
                ),

                // NOTE: CHOOSE DATE
                Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 16),
                    child: Text("Choose Date",
                        style: blackTextFont.copyWith(fontSize: 20))),
                Container(
                    margin: EdgeInsets.only(bottom: 24),
                    height: 90,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: (index == 0) ? defaultMargin : 0,
                                right: (index < dates.length - 1)
                                    ? 16
                                    : defaultMargin),
                            child: DateCard(dates[index],
                                isSelected: selectedDate == dates[index],
                                onTap: () {
                              setState(() {
                                selectedDate = dates[index];
                              });
                            }),
                          );
                        })),

                // NOTE : CHOOSE TIME
                generateTimeTable(),

                // NOTE : NEXT BUTTON
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, userState) => Container(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isValid) {
                                context.read<PageBloc>().add(GoToSelectSeatPage(
                                    TicketModel(
                                        widget.movieDetailModel,
                                        selectedTheater,
                                        DateTime(
                                            selectedDate.year,
                                            selectedDate.month,
                                            selectedDate.day,
                                            selectedTime),
                                        randomAlphaNumeric(12).toUpperCase(),
                                        null,
                                        (userState as UserLoaded)
                                            .userModel
                                            .name,
                                        null)));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: isValid
                                    ? purpleMainColor
                                    : Color(0xffE4E4E4)),
                            child: Text("NEXT",
                                style: whiteTextFont.copyWith(fontSize: 20)),
                          )),
                    )),
                SizedBox(height: 50)
              ],
            ),
          ],
        )));
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheater) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
          child: Text(
            theater.name,
            style: blackTextFont.copyWith(fontSize: 20),
          )));

      widgets.add(Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: schedule.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(
                left: index == 0 ? defaultMargin : 0,
                right: index == schedule.length - 1 ? defaultMargin : 16),
            child: SelectableBox(
              "${schedule[index]}:00",
              height: 50,
              isSelected:
                  selectedTheater == theater && selectedTime == schedule[index],
              isEnabled: schedule[index] > DateTime.now().hour ||
                  selectedDate.day != DateTime.now().day,
              onTap: () {
                setState(() {
                  selectedTheater = theater;
                  selectedTime = schedule[index];
                  isValid = true;
                });
              },
            ),
          ),
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
