part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final CreditModel creditModel;

  CreditCard(this.creditModel);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(8),
              image: (creditModel.profilePath == null)
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                          imageBaseURL + "w185" + creditModel.profilePath),
                      fit: BoxFit.cover)),
        ),
        Container(
            margin: EdgeInsets.only(top: 6),
            width: 70,
            child: Text(creditModel.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: blackTextFont.copyWith(
                    fontSize: 10, fontWeight: FontWeight.w400))),
      ],
    );
  }
}
