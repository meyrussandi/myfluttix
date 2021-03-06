import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfluttix/models/models.dart';
import 'package:myfluttix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUser) {
      UserModel userModel = await UserServices.getUser(event.id);
      yield UserLoaded(userModel);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      UserModel updateUser = (state as UserLoaded)
          .userModel
          .copyWith(name: event.name, profilePicture: event.profileImage);
      await UserServices.updateUser(updateUser);
      yield UserLoaded(updateUser);
    } else if (event is TopUp) {
      if (state is UserLoaded) {
        try {
          UserModel updatedUserModel = (state as UserLoaded).userModel.copyWith(
              balance: (state as UserLoaded).userModel.balance + event.amount);

          await UserServices.updateUser(updatedUserModel);

          yield UserLoaded(updatedUserModel);
        } catch (e) {
          print(e);
        }
      }
    } else if (event is Purchase) {
      if (state is UserLoaded) {
        try {
          UserModel updatedUserModel = (state as UserLoaded).userModel.copyWith(
              balance: (state as UserLoaded).userModel.balance - event.amount);

          await UserServices.updateUser(updatedUserModel);

          yield UserLoaded(updatedUserModel);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
