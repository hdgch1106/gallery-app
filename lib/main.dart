import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/config/config.dart';
import 'package:gallery_app/presentation/bloc/simple_bloc_observer.dart';

void main() async {
  // Asegura que Flutter esté inicializado
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa el entorno de la aplicación
  await Environment.initEnvironment();
  Bloc.observer = const SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Gallery App",
      routerConfig: appRouter,
    );
  }
}
