import 'package:flutter/material.dart';

//start of screen imports
import 'screens/dashboard_screen.dart';
import 'screens/health_screen.dart';
import 'screens/data_screen.dart';
import 'screens/alarm_screen.dart';
import 'screens/device_settings_screen.dart';
import 'screens/tutorials_screen.dart';
import 'screens/about_screen.dart';
import 'screens/settings_screen.dart';
//end of screen imports


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // ← REQUIRED for Badge
      ),
      home: const CustomNavigationRail(),
    );
  }
}

class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({super.key});

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;
  bool showTrailing = false;
  double groupAlignment = -1.0;
  bool isExtended = false;

  final List<Widget> _screens = const [
    ConcentricAnimationOnboarding(),
    HealthScreen(),
    DataScreen(),
    AlarmScreen(),
    DeviceSettingsScreen(),
    TutorialsScreen(),
    AboutScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              leading: IconButton(
                tooltip: isExtended
                    ? 'Collapse navigation'
                    : 'Expand navigation',
                icon: Icon(
                  isExtended ? Icons.navigate_before : Icons.navigate_next,
                ),
                onPressed: () {
                  setState(() {
                    isExtended = !isExtended;
                  });
                },
              ),
              selectedIndex: _selectedIndex,
              groupAlignment: groupAlignment,
              extended: isExtended,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

              labelType: labelType,
              trailing: showTrailing
                  ? IconButton(
                      onPressed: () {
                        // when the trailing ... is pressed what happens
                      },
                      icon: const Icon(Icons.more_horiz_rounded),
                    )
                  : const SizedBox(),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Badge(child: Icon(Icons.heart_broken_outlined)),
                  selectedIcon: Badge(child: Icon(Icons.heart_broken)),
                  label: Text('Health'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.data_array_outlined),
                  selectedIcon: Icon(Icons.data_array),
                  label: Text('Data'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.alarm_outlined),
                  selectedIcon: Icon(Icons.alarm),
                  label: Text('Alarm'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.watch_outlined),
                  selectedIcon: Icon(Icons.watch),
                  label: Text('Device Settings'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.help_outlined),
                  selectedIcon: Icon(Icons.help),
                  label: Text('Tutorials'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.pageview_outlined),
                  selectedIcon: Icon(Icons.pageview),
                  label: Text('About'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('App Settings'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded( //switching between screens
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _screens[_selectedIndex],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
}
