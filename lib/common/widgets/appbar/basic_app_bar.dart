import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '/core/utils/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar(
      {super.key, this.title, this.actions, required this.hideBack});
  final Widget? title;
  final Widget? actions;
  final bool hideBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      actions: [actions ?? Container()],
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: hideBack,
      leading: !hideBack
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 30,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    FontAwesomeIcons.chevronLeft,
                    size: 15,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
    );
  }
}
