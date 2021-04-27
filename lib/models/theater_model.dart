part of 'models.dart';

class TheaterModel extends Equatable{
  final String name;

  TheaterModel(this.name);
  @override
  List<Object> get props => [name];

}

//dummy theater
List<TheaterModel> dummyTheater = [
  TheaterModel("CGV Mall Of Indonesia"),
  TheaterModel("CGV AEON Mall Jakarta Garden City"),
  TheaterModel("XXI Mall Kelapa Gading"),
  TheaterModel("XXI Gading Festival Sedayu City"),
];