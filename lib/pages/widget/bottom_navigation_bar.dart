import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/utils/themes.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  var selectedItem = 0;

  void handleSelectedItem(int index) {
    setState(() {
      selectedItem = index;
    });
    widget.onItemSelected(index);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationBarItems(
            index: 0,
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            label: "Messages",
            isSelected: (selectedItem == 0),
            onTap: handleSelectedItem,
          ),
          NavigationBarItems(
            index: 1,
            icon: CupertinoIcons.bell_solid,
            label: "Notifications",
            isSelected: (selectedItem == 1),
            onTap: handleSelectedItem,
          ),
          NavigationBarItems(
            index: 2,
            icon: CupertinoIcons.phone_fill,
            label: "Calls",
            isSelected: (selectedItem == 2),
            onTap: handleSelectedItem,
          ),
          NavigationBarItems(
            index: 3,
            icon:CupertinoIcons.person_2_fill,
            label: "Contacts",
            isSelected: (selectedItem == 3),
            onTap: handleSelectedItem,
          ),
        ],
      ),
    );
  }
}

class NavigationBarItems extends StatelessWidget {
   const NavigationBarItems({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.index,
    this.isSelected = false,
  }) : super(key: key);

  final int index;
  final IconData icon;
  final String label;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 50.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(height: 5.0,),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}