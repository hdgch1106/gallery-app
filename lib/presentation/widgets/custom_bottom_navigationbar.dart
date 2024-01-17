import 'package:flutter/material.dart';
import 'package:gallery_app/infrastructure/models/models.dart';

class CustomBottomNavigationbar extends StatelessWidget {
  final List<HomeItem> items;
  final int currentIndex;
  final Function(int) onDestinationSelected;
  const CustomBottomNavigationbar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onDestinationSelected,
  });

  void onItemTapped(BuildContext context, int index) {
    if (index >= 0 && index < items.length) {
      onDestinationSelected(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedLabelStyle: const TextStyle(fontSize: 0),
      unselectedLabelStyle: const TextStyle(fontSize: 0),
      onTap: (value) => onItemTapped(context, value),
      elevation: 8,
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(
            item.iconData,
            color: Colors.black,
          ),
          activeIcon: Icon(
            item.iconData,
            color: Colors.blue,
          ),
          label: item.name,
        );
      }).toList(),
    );
  }
}
