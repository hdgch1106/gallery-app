import 'package:flutter/material.dart';
import 'package:gallery_app/infrastructure/models/models.dart';
import 'package:gallery_app/presentation/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  const MainScreen({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      HomeItem(
        name: "Inicio",
        iconData: Icons.home_outlined,
      ),
      HomeItem(
        name: "Configuración",
        iconData: Icons.settings_outlined,
      ),
      HomeItem(
        name: "Favoritos",
        iconData: Icons.favorite_outline,
      ),
      HomeItem(
        name: "Compartir",
        iconData: Icons.share_outlined,
      ),
    ];
    return Scaffold(
      body: body,
      bottomNavigationBar: CustomBottomNavigationbar(
        currentIndex: selectedIndex,
        items: items,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
