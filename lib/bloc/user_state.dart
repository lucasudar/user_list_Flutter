part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserEmptyState extends UserState {}
class UserLoadingState extends UserState {}
class UserLoadedState extends UserState {
  final List<dynamic> loadedUser;
  UserLoadedState({required this.loadedUser}) : assert(loadedUser != null);
}
class UserErrorState extends UserState {}
