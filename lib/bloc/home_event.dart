part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class Increment extends HomeEvent {
  final int? counter;
  Increment({ this.counter});
}

class Decrement extends HomeEvent {}

class PostInitialFetchEvent extends HomeEvent {}
