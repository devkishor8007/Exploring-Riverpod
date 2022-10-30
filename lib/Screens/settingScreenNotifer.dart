import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingNotifierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final watchcallChangeAllFont = ref.watch(changeNotifierProvider);

        final settingRiverpodName = ref.read(appsettingRiverpod);

        return Scaffold(
          appBar: appBar(settingRiverpodName, context) as PreferredSizeWidget?,
          body: Column(
            children: [
              Text(
                "Text Size is " + watchcallChangeAllFont.toString(),
                style: buildTextStyle(
                  context,
                  color: Colors.white,
                ),
              ),
              Slider(
                max: 100.0,
                min: 15.0,
                value: watchcallChangeAllFont,
                onChanged: (val) =>
                    ref.read(changeNotifierProvider.notifier).increaseSize(val),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget appBar(String settingName, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          size: Theme.of(context).textTheme.headline4!.fontSize,
        ),
        onPressed: () {
          pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        settingName,
        style: buildTextStyle(
          context,
        ),
      ),
    );
  }
}
