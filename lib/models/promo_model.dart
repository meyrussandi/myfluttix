part of 'models.dart';

class PromoModel extends Equatable {
  final String title;
  final String subTitle;
  final int discount;

  PromoModel({this.title, this.subTitle, this.discount});

  @override
  List<Object> get props => [title, subTitle, discount];
}

List<PromoModel> dummyPromos = [
  PromoModel(
      title: "Student Holiday",
      subTitle: "Maximal only for two peoples",
      discount: 50),
  PromoModel(
      title: "Family Club",
      subTitle: "Maximal only for three members",
      discount: 70),
  PromoModel(
      title: "Subscribtion Promo", subTitle: "Min. one year", discount: 40),
];
