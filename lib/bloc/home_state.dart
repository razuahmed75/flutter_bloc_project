part of 'home_bloc.dart';

class HomeState {
  final int? counter;
  HomeState({this.counter});

}

class HomeInitial extends HomeState {
  HomeInitial() : super(counter: 0);
}

class PostLoadingState extends HomeState {}

class PostFetchingSuccessfullState extends HomeState {
  final List<Post>? postList;
  PostFetchingSuccessfullState({this.postList});
}
