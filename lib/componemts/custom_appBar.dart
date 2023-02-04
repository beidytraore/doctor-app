import 'package:doc/utils/config.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

 CustomAppBar({super.key,required this.appTitle,required this.route,required this.icon,required this.actions});
 
final String appTitle;
final String route;
final Icon icon;
 List<Widget> actions;

@override
Size get preferredSize => const Size.fromHeight(60);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        widget.appTitle,
        style:const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      //if icon is not set return null
      leading: widget.icon != null ? 
       Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Config.primaryColor,
        ),
        child: IconButton(
          onPressed: () {
            //if route is given, then
            if (widget.route != null) {
              Navigator.of(context).pushNamed(widget.route);
            } else {
              //else, just simply pop back to previous page
              Navigator.of(context).pop();
            }
          },
          icon: widget.icon,
          iconSize: 16,
          color: Colors.white,
        ),
      )
      : null,
      //if action 
      actions: widget.actions ?? null,
    );
  }
}