import 'package:obichat/helpers.dart';
import 'package:obichat/pages/notification_page.dart';
import 'package:obichat/utils/glow_button.dart';
import 'package:obichat/widgets/avatar.dart';
import 'package:obichat/widgets/icon_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:obichat/pages/calls_page.dart';
import 'package:obichat/pages/contacts_page.dart';
import 'package:obichat/pages/messages_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final titles = const [
    "Messages",
    "Calls",
    "Notifications",
    "Contacts",
  ];

  void _onNavigationItemSelected(index) {
    title.value = titles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
        ),
        leadingWidth: 80,
        leading: Align(
          alignment: Alignment.centerRight,
          child: Center(
              child: IconBackground(
            icon: Icons.search_rounded,
            onTap: () {},
          )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Avatar.small(url: Helpers.randomPictureUrl(),),
          ),
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          }),
      bottomNavigationBar:
          BottomNavBar(onItemSelected: _onNavigationItemSelected),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32), topLeft: Radius.circular(32)),
          color: Colors.grey.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
            top: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavigationBarItem(
                icon: selectedIndex == 0
                    ? CupertinoIcons.text_bubble_fill
                    : CupertinoIcons.text_bubble,
                index: 0,
                onTap: handleItemSelected,
              ),
              NavigationBarItem(
                icon: selectedIndex == 1
                    ? CupertinoIcons.bell_fill
                    : CupertinoIcons.bell,
                index: 1,
                onTap: handleItemSelected,
              ),
              BlueGlowFAB(
                onPressed: () {},
              ),
              NavigationBarItem(
                icon: selectedIndex == 2
                    ? CupertinoIcons.phone_fill
                    : CupertinoIcons.phone,
                index: 2,
                onTap: handleItemSelected,
              ),
              NavigationBarItem(
                icon: selectedIndex == 3
                    ? CupertinoIcons.person_crop_circle_fill
                    : CupertinoIcons.person_crop_circle,
                index: 3,
                onTap: handleItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {Key? key, required this.icon, required this.index, required this.onTap})
      : super(key: key);

  final IconData icon;
  final int index;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 23,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
