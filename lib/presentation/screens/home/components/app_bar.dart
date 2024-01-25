import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';

import '../../../../theme/theme.dart';
import '../../../../utils/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Selector<WeatherProvider, ThemeData>(
          builder: (BuildContext context, value, Widget? child) {
            return GestureDetector(
              onTap: () {
                Provider.of<WeatherProvider>(context, listen: false)
                    .changeTheme();
              },
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: value ==
                      ThemeDataStyle.dark
                      ? const Row(
                    children: [
                      Icon(
                        Icons.light_mode,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "Light",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  )
                      : const Row(
                    children: [
                      Icon(
                        Icons.dark_mode,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "Dark",
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  )),
            );
          },
          selector: (_, provider) => provider.themeDataStyle,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            ImageAssets.nightRain,
            height: 30,
            width: 30,
          ),
        )
      ],
    );
  }
}
