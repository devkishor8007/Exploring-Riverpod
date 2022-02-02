import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MiniMartMenu {
  home,
  favourite,
  cart,
  profile,
}

final miniMartMenuProvider = StateProvider<MiniMartMenu>(
  (ref) => MiniMartMenu.home,
);
