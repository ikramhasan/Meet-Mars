import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/mars_photos_cubit.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'repository/nasa_api_repository.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarsPhotosCubit(NasaApiRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meet Mars',
        theme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: Color(0xFF111111),
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
