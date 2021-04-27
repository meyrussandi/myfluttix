part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final DateTime dateTime;
  final double width;
  final double height;
  final Function onTap;
  DateCard(this.dateTime,
      {this.isSelected = false, this.width = 70, this.height = 90, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? yellowColor : Colors.transparent,
                border: Border.all(
                    color:
                        isSelected ? Colors.transparent : Color(0xffE4E4E4))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dateTime.shortDayName.toString(),
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 6,
                ),
                Text(dateTime.day.toString(),
                    style: whiteNumberFont.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400))
              ],
            )));
  }
}
