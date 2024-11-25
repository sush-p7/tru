import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tru/screens/login/bloc/user_auth_bloc.dart';
import 'package:tru/screens/login/ui/login_screen.dart';
//import 'package:tru/screens/po_approval.dart';
import 'package:http/http.dart' as http;
import 'package:tru/screens/splash/ui/splash.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthBloc(
        storage: const FlutterSecureStorage(),
        httpClient: http.Client(),
      ),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //get http => null;

  @override
  Widget build(BuildContext context) {
    return
        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider(
        //       create: (context) => AuthBloc(
        //         storage: const FlutterSecureStorage(),
        //         httpClient: http.Client(),
        //       ),
        //     )
        //   ],
        //   child:
        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // ),
    );
  }
}
