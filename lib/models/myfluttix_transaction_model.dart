part of 'models.dart';

class MyFluttixTransactionModel extends Equatable {
  final String userID;
  final String title;
  final String subTitle;
  final int amount;
  final DateTime time;
  final String picture;

  MyFluttixTransactionModel(
      {@required this.userID,
      @required this.title,
      @required this.subTitle,
      this.amount = 0,
      @required this.time,
      this.picture});
  @override
  List<Object> get props => [userID, title, subTitle, amount, time, picture];
}
