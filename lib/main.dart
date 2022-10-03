import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean/core/di/service_locator.dart';

import 'package:movies_app_clean/core/utils/app_router.dart';
import 'package:movies_app_clean/core/utils/constant.dart';
import 'package:movies_app_clean/presentation/logic/shared/shared_cubit.dart';

Future<void> main() async {
  ServiceLocator().init();

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SharedCubit>(
        create: (BuildContext context) {
          return SharedCubit();
        },
        lazy: false,
        child: BlocConsumer<SharedCubit,SharedState>(
          builder: (BuildContext context, state) {
            return MaterialApp(
              title: "Movies App",
              theme: myThemeData(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: RoutesConstants.homeScreen,
            );
          },
          listener: (BuildContext context, Object? state) {},
        ));
  }

  ThemeData myThemeData() {
    return ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: ColorConstants.primary),
        scaffoldBackgroundColor: ColorConstants.primary,
        textTheme: const TextTheme(
            displayMedium: TextStyle(color: Colors.grey, fontSize: 15),
            displaySmall: TextStyle(
              color: Colors.white,
              fontSize: 13,
            )));
  }
}
