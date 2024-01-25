import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';
import 'package:weatherapp/presentation/screens/home/components/small_container.dart';

import '../../../../utils/images.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});

  //final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context,provider,_){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallContainer(
                  text: '${provider.getCloudOver()}%',
                  image: ImageAssets.heavyRain),
              SmallContainer(
                  text: '${provider.getWindSpeed()}km/h',
                  image: ImageAssets.wind),
              SmallContainer(
                  text: '${provider.getHumidity()}%', image: ImageAssets.sun),
            ],
          ),
        );
      },
    );
  }
}
