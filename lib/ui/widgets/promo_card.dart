part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final PromoModel promoModel;

  PromoCard(this.promoModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: purpleMainColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promoModel.title,
                    style: whiteTextFont,
                  ),
                  Text(
                    promoModel.subTitle,
                    style: whiteTextFont.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Text.rich(TextSpan(
                text: "OFF ",
                style: yellowNumberFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w300),
                children: [
                  TextSpan(
                    text: "${promoModel.discount}%",
                    style: yellowNumberFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ))
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black, Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 148, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 148,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset("assets/reflection1.png")),
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 45,
            width: 145.5,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),),
                child: Image.asset("assets/reflection2.png")),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            height: 30,
            width: 123.5,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),),
                child: Image.asset("assets/reflection3.png")),
          ),
        ),
      ],
    );
  }
}
