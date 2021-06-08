import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calDropdownButton = ChangeNotifierProvider<DropdownButtonsRiverpod>(
    (ref) => DropdownButtonsRiverpod());

class DropDownButtonScreens extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    var watchcallDropdownButton = watch(calDropdownButton);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: ListView(
            children: [
              Text(
                context.read(widgetNameRiverpod),
                style: buildTextStyle(
                  context,
                  color: Colors.white,
                  size: Theme.of(context).textTheme.headline6.fontSize,
                ),
              ),
              DropdownButton<String>(
                underline: SizedBox(),
                style: TextStyle(
                  color: Colors.white,
                ),
                dropdownColor: Colors.black,
                onChanged: (newChanged) {
                  context
                      .read(calDropdownButton)
                      .onChangeCountryName(newChanged);
                },
                items: watchcallDropdownButton.countryNameList
                    .map((String showData) {
                  return DropdownMenuItem<String>(
                    value: showData,
                    child: Text(showData),
                  );
                }).toList(),
                value: watchcallDropdownButton.currentCountryName,
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Text(
                context.read(
                  hopeRiverpod,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(
    BuildContext context,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        context.read(appNameRiverpod),
      ),
    );
  }
}
