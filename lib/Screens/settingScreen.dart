import 'package:exploring_riverpod/main.dart';
import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final watchingSettingDarkThemeRiverpod = watch(darkThemeRiverpod);
        return Scaffold(
          appBar: appbar(watchingSettingDarkThemeRiverpod, context),
          body: Column(
            children: [
              darkThemeSwitch(watchingSettingDarkThemeRiverpod, context),
            ],
          ),
        );
      },
    );
  }

  Widget darkThemeSwitch(StateController<bool> watchingSettingDarkThemeRiverpod,
      BuildContext context) {
    return SwitchListTile(
        title: Text('Dark Theme'),
        value: watchingSettingDarkThemeRiverpod.state,
        onChanged: (changeValue) {
          context.read(darkThemeRiverpod).state =
              !context.read(darkThemeRiverpod).state;
        });
  }

  Widget appbar(StateController<bool> watchingSettingDarkThemeRiverpod,
      BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          color: watchingSettingDarkThemeRiverpod.state
              ? Colors.white
              : Colors.black,
          size: Theme.of(context).textTheme.headline4.fontSize,
        ),
        onPressed: () {
          pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        context.read(appsettingRiverpod),
        style: buildTextStyle(
          context,
          color: watchingSettingDarkThemeRiverpod.state
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
