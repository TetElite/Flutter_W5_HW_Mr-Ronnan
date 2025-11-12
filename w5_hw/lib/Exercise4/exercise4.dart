import 'package:flutter/material.dart';

enum Weather {
  phnompenh('PhnomPenh', 10.0, 30.0, 12.2, '/home/tet-elite/Desktop/CADT/Y3T1/Flutter_MR-ronnan/W5_HW/assets/ex4/cloudy.png', [Color(0xFFBB86FC), Color(0xFF9C5FD0)]),
  paris('Paris', 10.0, 40.0, 22.2, '/home/tet-elite/Desktop/CADT/Y3T1/Flutter_MR-ronnan/W5_HW/assets/ex4/sunnyCloudy.png', [Color(0xFF6DD5C3), Color(0xFF4ECDC4)]),
  rome('Rome', 10.0, 40.0, 45.2, '/home/tet-elite/Desktop/CADT/Y3T1/Flutter_MR-ronnan/W5_HW/assets/ex4/sunny.png', [Color(0xFFFF6B9D), Color(0xFFFFC371)]),
  toulouse('Toulouse', 10.0, 40.0, 45.2, '/home/tet-elite/Desktop/CADT/Y3T1/Flutter_MR-ronnan/W5_HW/assets/ex4/veryCloudy.png', [Color(0xFFFFB88C), Color(0xFFDE6262)]);

  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String iconPath;
  final List<Color> gradientColors;

  const Weather(this.city, this.minTemp, this.maxTemp, this.currentTemp, this.iconPath, this.gradientColors);
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              SizedBox(height: 30),
              WeatherCard(weather: Weather.phnompenh),
              SizedBox(height: 20),
              WeatherCard(weather: Weather.paris),
              SizedBox(height: 20),
              WeatherCard(weather: Weather.rome),
              SizedBox(height: 20),
              WeatherCard(weather: Weather.toulouse),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    required this.weather,
    super.key,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 8,
        borderRadius: BorderRadius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: weather.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                // Half circle decoration at right edge (40% of card)
                Positioned(
                  right: -100,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          weather.gradientColors[1].withOpacity(0.6),
                          weather.gradientColors[0].withOpacity(0.4),
                          weather.gradientColors[1].withOpacity(0.2),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.4, 0.7, 1.0],
                        center: Alignment.center,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Main content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Weather info section
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(weather.iconPath),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weather.city,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Min ${weather.minTemp}°C',
                                style: const TextStyle(
                                  fontSize: 13, 
                                  color: Colors.white70
                                ),
                              ),
                              Text(
                                'Max ${weather.maxTemp}°C',
                                style: const TextStyle(
                                  fontSize: 13, 
                                  color: Colors.white70
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Current temperature
                      Text(
                        '${weather.currentTemp}°C',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 50,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}