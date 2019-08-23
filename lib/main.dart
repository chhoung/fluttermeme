import 'package:flutter/material.dart';
import 'package:fluttermeme/util/colors.dart';
//import 'package:fluttermeme/app.dart';
import './splash_screen.dart';
import './home.dart';
import 'package:bloc/bloc.dart';
import 'package:fluttermeme/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermeme/user_repository.dart';
import 'package:fluttermeme/authentication_bloc/bloc.dart';
import 'package:fluttermeme/authentication_bloc/simple_block_delegate.dart';
import 'app_model.dart';


// void main() => runApp(FlutterMeme());
void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: userRepository)
        ..dispatch(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}
class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
   return    
    MaterialApp(
      theme: AppModel().themeData,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);       
          }
          return SplashScreen();
        },
      ),
    );
  }
}



