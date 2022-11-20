import 'package:adviser/2_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:adviser/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/services/theme_service.dart';
//import './widgets/error_message.dart';
import './widgets/advicer_field.dart';

class AdvicePageWrapper extends StatelessWidget {
  const AdvicePageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adsviser'),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) =>
                Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                    builder: (context, state) {
                  if (state is AdvicerInitial) {
                    return Text(
                      'fetch some advice.....',
                      style: themeData.textTheme.bodyText1,
                    );
                  } else if (state is AdvicerStateLoading) {
                    return CircularProgressIndicator(
                      color: themeData.colorScheme.secondary,
                    );
                  } else if (state is AdvicerStateLoaded) {
                    return AdvicerField(advice: state.advice);
                  } else if (state is AdvicerStateError) {
                    return ErrorMessage(
                      message: state.message,
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
                  backgroundColor: themeData.colorScheme.secondary,
                ),
                onPressed: () {
                  BlocProvider.of<AdvicerBloc>(context)
                      .add(AdviceRequestedEvent());
                },
                child: Text(
                  'Get Advice',
                  style: themeData.textTheme.headline1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
