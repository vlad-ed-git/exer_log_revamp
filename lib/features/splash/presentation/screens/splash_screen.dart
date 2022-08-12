import 'package:exer_log_revamp/core/presentation/components/gradients/primary_gradient.dart';
import 'package:exer_log_revamp/core/presentation/components/progress/circular_progress.dart';
import 'package:exer_log_revamp/features/splash/presentation/state/user_state_bloc.dart';
import 'package:exer_log_revamp/res/app_theme.dart';
import 'package:exer_log_revamp/res/dimen.dart';
import 'package:exer_log_revamp/res/strings.dart';
import 'package:exer_log_revamp/res/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserStateBloc? _eventDispatcher;
  bool _isLoading = false;
  String? _errMsg;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocProvider(
      create: (context) => GetIt.instance<UserStateBloc>(),
      child: BlocListener<UserStateBloc, UserStateState>(
        listener: _listenToState,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(gradient: primaryGradient),
            constraints: BoxConstraints(
                minWidth: width,
                minHeight: height,
                maxWidth: width,
                maxHeight: height),
            child: BlocBuilder<UserStateBloc, UserStateState>(
                builder: (blocContext, state) {
              if (state is InitialUserState) {
                _fireCheckAuthUserEvent(blocContext);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appName.toUpperCase(),
                    style:
                        appTextTheme.headline4?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: spaceStd,
                  ),
                  if (_isLoading) const Center(child: CircularProgress()),
                  if (_errMsg != null)
                    Text(
                      _errMsg!,
                      style: appTextTheme.headline6
                          ?.copyWith(color: appTheme.colorScheme.error),
                    )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void _listenToState(BuildContext context, UserStateState state) {
    if (state is LoadingAuthUserState) {
      setState(() {
        _isLoading = true;
        _errMsg = null;
      });
    }

    if (state is LoadingAuthUserFailedState) {
      setState(() {
        _isLoading = false;
        _errMsg = state.errMsg;
      });
    }

    if (state is LoadedAuthUserState) {
      setState(() {
        _errMsg = null;
        _isLoading = false;
      });
      _eventDispatcher?.add(CheckUserProfileEvent());
    }

    if (state is LoadingUserProfileState) {
      setState(() {
        _isLoading = true;
      });
    }

    if (state is LoadingUserProfileFailedState) {
      setState(() {
        _isLoading = false;
        _errMsg = state.errMsg;
      });
    }

    if (state is LoadedUserProfileState) {
      setState(() {
        _isLoading = false;
      });
      //todo - go home
    }
  }

  void _fireCheckAuthUserEvent(BuildContext blocContext) {
    _eventDispatcher ??= BlocProvider.of<UserStateBloc>(blocContext);
    _eventDispatcher?.add(CheckAuthUserEvent());
  }
}
