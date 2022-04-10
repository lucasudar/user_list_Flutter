import 'package:bloc_network/bloc/user_bloc.dart';
import 'package:bloc_network/services/users_repository.dart';
import 'package:bloc_network/widgets/action_buttons.dart';
import 'package:bloc_network/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository),
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          ActionButtons(),
          Expanded(
            child: UserList(),
          ),
        ],
      ),
    ),
    );
  }
}
