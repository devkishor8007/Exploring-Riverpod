import 'package:exploring_riverpod/riverpod_/dataService_riverpod.dart';
import 'package:exploring_riverpod/riverpod_/stringText_riverpod.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final apiServiceImplement = ref.watch(dataServicesRiverpod);

        final whatWidgetImpl = ref.watch(widgetNameRiverpod);
        final appname = ref.watch(appNameRiverpod);
        return Scaffold(
          appBar: makeAppBar(appname, context),
          body: apiServiceImplement.when(
            data: (data) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    whatWidgetImpl,
                    style: buildTextStyle(
                      context,
                      color: Colors.white,
                      size: Theme.of(context).textTheme.headline6.fontSize,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(
                            data[index].name,
                            style: buildTextStyle(context, color: Colors.white),
                          ),
                          subtitle: Text(
                            data[index].email,
                            style: buildTextStyle(context, color: Colors.grey),
                          ),
                          leading: Text(
                            data[index].id.toString() + "\nLikes",
                            style: buildTextStyle(context, color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, s) => SizedBox(),
          ),
        );
      },
    );
  }

  Widget makeAppBar(String appname, BuildContext context) {
    return AppBar(
      title: Text(appname),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}
