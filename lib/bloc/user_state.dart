part of 'user_bloc.dart';

abstract class UserState extends Equatable{
  const UserState();
}

class UserInitial extends UserState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class UserLoaded extends UserState{
  final UserModel userModel;

  UserLoaded(this.userModel);


  @override
  List<Object> get props => [userModel];

}