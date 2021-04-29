part of 'widgets.dart';

class TransactionCard extends StatelessWidget {
  final MyFluttixTransactionModel myFluttixTransactionModel;
  final double width;

  const TransactionCard({this.myFluttixTransactionModel, this.width});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 90,
          width: 70,
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (myFluttixTransactionModel.picture != null)
                      ? NetworkImage(imageBaseURL +
                          "w500" +
                          myFluttixTransactionModel.picture)
                      : AssetImage('assets/reflection2.png'))),
        ),
        Column(
          children: [
            SizedBox(
              width: width - 86,
              child: Text(
                myFluttixTransactionModel.title,
                style: blackTextFont.copyWith(fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: width - 86,
              child: Text(
                NumberFormat.currency(
                        locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
                    .format(myFluttixTransactionModel.amount < 0
                        ? -myFluttixTransactionModel.amount
                        : myFluttixTransactionModel.amount),
                style: whiteNumberFont.copyWith(fontSize: 12,
                color: myFluttixTransactionModel.amount < 0 ? Color(0xffFF5C83):Color(0xff3E9D9D)
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: width - 86,
              child: Text(
                myFluttixTransactionModel.subTitle,
                style: greyTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            )
          ],
        )
      ],
    );
  }
}
