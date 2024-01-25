import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';
import '../../../../utils/images.dart';
import '../../home/components/small_container.dart';
class SmallContainerList extends StatelessWidget {
   const SmallContainerList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (BuildContext context, WeatherProvider provider, Widget? child) {
        return Row(
          children: [
            const Spacer(),
            SmallContainer(text: '${provider.day!.precipprob.toInt().toString()}%', image: ImageAssets.heavyRain,color: Colors.white38,textColor: Colors.white,),
            const Spacer(),
            SmallContainer(text: '${provider.day!.windspeed.toInt().toString()}km/h', image: ImageAssets.wind,color: Colors.white38,textColor: Colors.white,),
            const Spacer(),
            SmallContainer(text: '${provider.day!.humidity.toInt().toString()}%', image: ImageAssets.sun,color: Colors.white38,textColor: Colors.white,),
            const Spacer(),
          ],
        );
      },
    );
  }
}
