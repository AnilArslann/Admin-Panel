import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isDarkTheme;
  final VoidCallback onToggleTheme;

  CustomAppBar({required this.isDarkTheme, required this.onToggleTheme});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: Row(
        children: [
          Image.asset(
            'assets/cubtale logo1.png',
            height: 60,
          ),
          const SizedBox(width: 10),
          Image.asset('assets/Cubtale watermark.png', height: 60),
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            widget.isDarkTheme ? 'assets/darkmode_icon.png' : 'assets/lightmode_icon.png',
            width: 60,
            height: 60,
          ),
          onPressed: widget.onToggleTheme,
        ),
        Text(
          widget.isDarkTheme ? 'Dark Mode' : 'Light Mode',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
