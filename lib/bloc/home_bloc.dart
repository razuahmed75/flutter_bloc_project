import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/post_model.dart';
import '../repos/post_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<Increment>(increment);
    on<Decrement>(decrement);
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> increment(Increment event, Emitter<HomeState> emit) {
  final currentCounter = state.counter ?? 0;
  emit(HomeState(counter: currentCounter + 1));
}

FutureOr<void> decrement(Decrement event, Emitter<HomeState> emit) {
  final currentCounter = state.counter ?? 0;
  emit(HomeState(counter: currentCounter - 1));
}

//
  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<HomeState> emit) async {
    List<Post> postList = [];
    emit(PostLoadingState());
    postList = await fetchPosts();
    print(postList.length);
    emit(PostFetchingSuccessfullState(postList: postList));
  }
}
