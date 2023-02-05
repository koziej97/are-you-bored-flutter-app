import 'package:are_you_bored/bloc/activity_bloc/activity_bloc.dart';
import 'package:are_you_bored/presentation/error_screen.dart';
import 'package:are_you_bored/presentation/loading_activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loaded_activity_screen.dart';


class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ActivityBloc>(context).add(LoadActivityEvent());
    return Scaffold(
        body: BlocBuilder<ActivityBloc, ActivityState>(
            builder: (context, state) {
              if (state is ActivityLoadingState) {
                return const LoadingActivityScreen();
              }
              if (state is ActivityLoadedState) {
                return LoadedActivityScreen(activity: state.activity);
              }
              if (state is ActivityErrorState) {
                return const ErrorScreen();
              }
              else {
                return Container();
              }
            }));
  }
}
