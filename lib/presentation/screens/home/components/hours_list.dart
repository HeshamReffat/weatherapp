import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';

class HoursList extends StatelessWidget {
  HoursList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, _) {
        return SizedBox(
          height: 180,
          child: ListView.builder(
            itemCount: provider.weatherDataModel!.days![0].hours!.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => provider.setHour(index),
                child: Column(
                  // for ignoring parent height
                  children: [
                    Card(
                        //elevation: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        //shadowColor : provider.compareIndex(index) ? Colors.blue :Colors.white70,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                          height: 130,
                          width: 80,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: provider.compareIndex(index)
                                  ? Colors.blue
                                  : Colors.white10,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    color: provider.compareIndex(index)
                                        ? Colors.blue
                                        : Colors.white10,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.getHour(index),
                                style: TextStyle(
                                  color: provider.compareIndex(index)
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset(
                                provider.getImage(index),
                                height: 50,
                                width: 50,
                              ),
                              Text(
                                '${provider.weatherDataModel!.days![0].hours![index].temp!.toInt()}\u00B0',
                                style: TextStyle(
                                    color: provider.compareIndex(index)
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
