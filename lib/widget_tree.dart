import 'package:admin_pannel/app_bar_widget.dart';
import 'package:admin_pannel/drawer_page.dart';
import 'package:admin_pannel/pannel_center_page.dart';
import 'package:admin_pannel/pannel_left_page.dart';
import 'package:admin_pannel/pannel_right_page.dart';
import 'package:admin_pannel/responsive_layout.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : AppBarWedgit()),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const PannelCenterPage(),
        tablet: const Row(
          children: [
            Expanded(child: PannelLeftPage()),
            Expanded(child: PannelRightPage()),
          ],
        ),
        largeTablet: const Row(
          children: [
            Expanded(child: PannelLeftPage()),
            Expanded(child: PannelCenterPage()),
            Expanded(child: PannelRightPage()),
          ],
        ),
        computer: const Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(child: PannelLeftPage()),
            Expanded(child: PannelCenterPage()),
            Expanded(child: PannelRightPage()),
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }
}
