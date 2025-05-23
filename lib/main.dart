import 'package:meal_tracker/application/target/target_bloc.dart';
import 'package:meal_tracker/presentation/root_page.dart';
import 'package:meal_tracker/presentation/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bootstrap.dart';
import 'application/home/home_bloc.dart';

const APP_NAME = 'Fitness-Tracker';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) =>
          i<HomeBloc>()
            ..add(HomeLoad(time: DateTime.now())),
        ),
        BlocProvider(
          create: (context) => i<TargetBloc>()..add(TargetLoadValues()),
        ),
      ],
      child: MaterialApp(
        title: 'Fitness',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const RootPage(),
      ),
    );
  }
}