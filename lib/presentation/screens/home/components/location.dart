import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/domain/providers/weather_provider.dart';

import '../../../../utils/images.dart';
import '../../../../utils/utils.dart';
import '../../location/locations_screen.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (BuildContext context, WeatherProvider provider, Widget? child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.getAddress(),
                    style: const TextStyle(
                        height: 0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    Utils.formateDate(DateTime.now()),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.7),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          //  const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LocationsScreen()));
              },
              child: SizedBox(
                height: 120,
                width: 120,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      ImageAssets.map,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
