import "package:timbu_mobile_app/util/constants/sizes.dart";
import "package:flutter/material.dart";

AppBar myBottomAppBar(BuildContext context, String title,
    {List<Widget> actions = const []}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(Sizes.appBarHeight),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: AlignmentDirectional.bottomStart,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
    actions: actions,
  );
}