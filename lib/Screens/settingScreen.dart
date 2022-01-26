import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final watchingSettingDarkThemeRiverpod =
            ref.watch(darkThemeRiverpod);

        final settingRiverpodName = ref.read(appsettingRiverpod);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.navigate_before,
                color: watchingSettingDarkThemeRiverpod
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
              settingRiverpodName,
              style: buildTextStyle(
                context,
                color: watchingSettingDarkThemeRiverpod
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),

          //  appbar(
          // settingRiverpodName, watchingSettingDarkThemeRiverpod, context),
          body: Column(
            children: [
              SwitchListTile(
                  title: Text('Dark Theme'),
                  value: watchingSettingDarkThemeRiverpod,
                  onChanged: (changeValue) {
                    ref.read(darkThemeRiverpod.notifier).state =
                        !ref.read(darkThemeRiverpod.notifier).state;
                  }),
            ],
          ),
        );
      },
    );
  }

  // Widget darkThemeSwitch(StateController<bool> watchingSettingDarkThemeRiverpod,
  //     BuildContext context) {
  //   return SwitchListTile(
  //       title: Text('Dark Theme'),
  //       value: watchingSettingDarkThemeRiverpod.state,
  //       onChanged: (changeValue) {
  //         context.read(darkThemeRiverpod).state =
  //             !context.read(darkThemeRiverpod).state;
  //       });
  // }

  // Widget appbar(
  //     String appname,
  //     StateController<bool> watchingSettingDarkThemeRiverpod,
  //     BuildContext context) {
  //   return
  // }
}
