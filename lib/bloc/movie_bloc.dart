import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myfluttix/models/models.dart';
import 'package:myfluttix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if(event is FetchMovies){
      List<MovieModel> movies = await MovieServices.getMovies(1);
      yield MovieLoaded(movies:movies);
    }
  }
}
