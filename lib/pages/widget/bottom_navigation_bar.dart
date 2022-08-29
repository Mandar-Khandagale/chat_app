import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/contact_page.dart';
import 'package:flutter_chat_app/pages/widget/action_button.dart';
import 'package:flutter_chat_app/screens/sign_up_screen.dart';
import 'package:flutter_chat_app/utils/themes.dart';
import 'package:get/get.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ActionButton(
              color: AppColors.secondary,
              icon: CupertinoIcons.add,
              onTap: () {
                Get.to(() => SignUpScreen());
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Dialog(
                //       shape:  const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //       ),
                //       child: SizedBox(
                //        height: MediaQuery.of(context).size.height / 3,
                //         child:  Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: ContactPage(isFromDialog: true,),
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
            ),
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
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap(index);
        },
        child: SizedBox(
          width: 60.0,
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
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}