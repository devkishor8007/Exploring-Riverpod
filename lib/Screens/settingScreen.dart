import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/route.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final callChangeAllFont = ChangeNotifierProvider<ChangeAllFont>(
  (ref) => ChangeAllFont(),
);

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final watchcallChangeAllFont = ref.watch(callChangeAllFont);

        final settingRiverpodName = ref.read(appsettingRiverpod);

        return Scaffold(
          appBar: appBar(settingRiverpodName, context),
          body: Column(
            children: [
              Text(
                "Text Size is " +
                    watchcallChangeAllFont.fontSize.toStringAsFixed(2),
                style: buildTextStyle(
                  context,
                  color: Colors.white,
                ),
              ),
              Slider(
                  max: 100.0,
                  min: 15,
                  value: watchcallChangeAllFont.fontSize,
                  onChanged: (val) {
                    watchcallChangeAllFont.increaseSize(val);
                  }),
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
          size: Theme.of(context).textTheme.headline4.fontSize,
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
