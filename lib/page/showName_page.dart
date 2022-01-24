import 'package:exploring_riverpod/showName_Riverpod.dart';
import 'package:exploring_riverpod/utilis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textFieldChangeNotifier =
    ChangeNotifierProvider<TextFormWidget>((ref) => TextFormWidget());

// ignore: must_be_immutable
class ShowNamePage extends ConsumerWidget {
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textImplementRiverpod = ref.watch(textFieldChangeNotifier);

    final whatWidgetImpl = ref.watch(widgetNameRiverpod);
    final hopeRiverpodText = ref.watch(hopeRiverpod);
    final appname = ref.watch(appNameRiverpod);
    return Scaffold(
      appBar: appbar(appname),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                whatWidgetImpl,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextField(
              controller: _name,
              style: TextStyle(
                color: Colors.white,
              ),
              onSubmitted: (String val) {
                textImplementRiverpod.onChangedVlue(val);
                _name.clear();
              },
              decoration: InputDecoration(
                hintText: "enter your name",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: makeOutline(),
                focusedBorder: makeOutline(),
                fillColor: Colors.grey.withOpacity(0.3),
                filled: true,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Name is : ",
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.9),
                  ),
                ),
                Text(
                  textImplementRiverpod.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            Text(
              hopeRiverpodText,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appbar(String appname) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        appname,
      ),
    );
  }
}
