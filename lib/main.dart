import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/firebase_options.dart';
import 'package:project1/presentation/bloc/auth/auth_bloc.dart';
import 'package:project1/presentation/bloc/doner/doner_bloc.dart';
import 'package:project1/presentation/screen/auth/login_screen.dart';
import 'injection/di.dart' as di;

Future<void> main() async {
  di.setup();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);

  runApp(MultiBlocProvider(
      providers: [BlocProvider.value(value: di.getIt<DonerBloc>()),
       BlocProvider.value(
          value: di.getIt<AuthBloc>(),
        )],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:LoginScreen()
    );
  }
}
