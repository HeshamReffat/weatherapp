import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/presentation/screens/splash/splash_screen.dart';
import 'package:weatherapp/theme/theme.dart';

import 'domain/di/di.dart';
import 'domain/providers/weather_provider.dart';
class App extends StatefulWidget {
  final String title;
  const App({super.key,required this.title});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherProvider>(create: (_) => di<WeatherProvider>()),
      ],
      builder: (context,_){
        return MaterialApp(
          title: widget.title,
          theme: Provider.of<WeatherProvider>(context).themeDataStyle,// Dark mode styles
          home: const SplashScreen(),
        );
      },
    );
  }
}
