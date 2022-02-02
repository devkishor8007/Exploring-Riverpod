import 'package:exploring_riverpod/model/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final miniMartProvider =
    StateNotifierProvider<MiniMartDataItems, List<MiniMartData>>(
        (ref) => MiniMartDataItems([
              MiniMartData(
                title: "Ladies Bag",
                color: "Black",
                img:
                    "https://images.unsplash.com/photo-1597633125097-5a9961e1f03d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80",
                des:
                    'Women\'s Handbags. An indispensable accessory for most, whatever be the occasion, is a bag of some sort.',
                price: 220,
                count: 1,
              ),
              MiniMartData(
                title: "Iphone",
                color: "Black",
                img:
                    "https://images.unsplash.com/photo-1567581935884-3349723552ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
                des:
                    'Explore iPhone, the world\'s most powerful personal device. Check out iPhone 13, Pro iPhone 13 Pro Max, iPhone 13, iPhone 13 mini, and iPhone SE.',
                price: 430,
                count: 1,
              ),
              MiniMartData(
                title: "Laptop",
                color: "Black",
                img:
                    "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                des:
                    'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard. ',
                price: 540,
                count: 1,
              ),
            ]));

class MiniMartDataItems extends StateNotifier<List<MiniMartData>> {
  MiniMartDataItems(state) : super(state ?? []);

  subtractItem(int index) {
    int _currentData = state[index].count ?? 0;
    _currentData--;

    if (_currentData <= 1) {
      _currentData = 1;
    }

    List<MiniMartData> _cartitem = [...state];

    MiniMartData _item = state[index].copyWith(count: _currentData);

    _cartitem[index] = _item;
    state = _cartitem;
  }

  addItem(int index) {
    int _currentData = state[index].count ?? 0;
    _currentData++;

    List<MiniMartData> _cartitem = [...state];

    MiniMartData _item = state[index].copyWith(count: _currentData);

    _cartitem[index] = _item;
    state = _cartitem;
  }
}
