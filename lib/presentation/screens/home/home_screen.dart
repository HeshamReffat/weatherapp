import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              // //const CustomAppBar(),
              // const SizedBox(
              //   height: 20,
              // ),
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
                            color: Colors.black,
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
      ),
    );
  }
}
