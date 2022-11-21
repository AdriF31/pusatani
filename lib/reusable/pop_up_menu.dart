import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  final Alignment alignment;
  final Offset offset;
  final VoidCallback? onTap;
  const PopUpMenu(
      {this.onTap,
      required this.alignment,
      this.offset = const Offset(0, 0),
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: PopupMenuButton<int>(
        offset: offset,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
              value: 0,
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Edit',
                    ),
                  ],
                ),
              )),
          PopupMenuItem<int>(
              value: 1,
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Text(
                      'Edit',
                    ),
                  ],
                ),
              )),
        ],
        child: Icon(
          Icons.more_vert,
          size: 24,
        ),
      ),
    );
  }
}
