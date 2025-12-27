import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appbarrr twin
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Whoop Unlocked',
              style: TextStyle(
                color: const Color.fromARGB(255, 146, 145, 145),
                fontSize: 28.00,
              ),
            ),
          ),
        ),



        //this is the widget columbs
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Icon(Icons.alarm),
            Icon(Icons.bar_chart),
            Icon(Icons.backpack),
          ],
        ),



      ),
    );
  }
}
*/

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
                  icon: Badge(child: Icon(Icons.notifications_outlined)),
                  selectedIcon: Badge(child: Icon(Icons.notifications)),
                  label: Text('Notifications'),
                ),
                NavigationRailDestination(
                  icon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.mail_outline),
                  ),
                  selectedIcon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.mail),
                  ),
                  label: Text('Messages'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people_outline),
                  selectedIcon: Icon(Icons.people),
                  label: Text('Team'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),

            // This is the main content.
          ],
        ),
      ),
    );
  }
}
