import 'package:exploring_riverpod/showName_Riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textFieldChangeNotifier =
    ChangeNotifierProvider<TextFormWidget>((ref) => TextFormWidget());

// ignore: must_be_immutable
class ShowNamePage extends ConsumerWidget {
  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    final textImplementRiverpod = watch(textFieldChangeNotifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          context.read(appNameRiverpod),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                context.read(widgetNameRiverpod),
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
                context.read(textFieldChangeNotifier).onChangedVlue(val);
                _name.clear();
              },
              decoration: InputDecoration(
                hintText: "enter your name",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
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
              context.read(hopeRiverpod),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
