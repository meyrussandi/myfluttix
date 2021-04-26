part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;
  BrowseButton(this.genre);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: Color(0xffeef1f8), borderRadius: BorderRadius.circular(4)),
            child: Icon(getImageFromGenre(genre))),
        SizedBox(height: 4,),
        Text(genre, style: blackTextFont.copyWith(fontSize: 13),),
      ],
    );
  }

  IconData getImageFromGenre(String genre){
    switch(genre){
      case "Horror":
        return MdiIcons.ghost;
        break;
      case "Music":
        return MdiIcons.music;
        break;
      case "Action":
        return MdiIcons.boxingGlove;
        break;
      case "Drama":
        return MdiIcons.dramaMasks;
        break;
      case "War":
        return MdiIcons.sword;
        break;
      case "Crime":
        return MdiIcons.ghost;
        break;
      default :
        return MdiIcons.close;
    }
  }

}
