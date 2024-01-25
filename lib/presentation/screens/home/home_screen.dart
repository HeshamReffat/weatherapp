import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/providers/weather_provider.dart';
import '../next-days/next_14_days.dart';
import 'components/app_bar.dart';
import 'components/container_list.dart';
import 'components/hours_list.dart';
import 'components/info_card.dart';
import 'components/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<WeatherProvider>(context, listen: false)
        .getCities();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                
                    const Location(),
                    const Hero(
                        tag: 'TAG',
                        child:
                            Material(color: Colors.transparent, child: InfoCard())),
                    ContainerList(),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NextDays()),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                  //color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            Spacer(),
                            Text(
                              'Next 14 Days',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    HoursList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
