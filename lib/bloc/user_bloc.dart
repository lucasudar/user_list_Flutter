import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/user.dart';
import '../services/users_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _loadedUsers = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUsers));
      } catch (_) {
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}
