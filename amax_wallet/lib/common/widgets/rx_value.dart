import 'package:flutter/foundation.dart';

class RxValue<T> extends ChangeNotifier implements ValueListenable<T> {
  RxValue(this._value);

  @override
  T get value => _value;
  T _value;

  set value(T newValue) {
    if (_value == newValue) {
      return;
    }
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}

class RxInt extends RxValue<int> {
  RxInt(super.value);
}

extension RxIntExtension<E> on int {
  RxInt get rx => RxInt(this);
}

class RxBool extends RxValue<bool> {
  RxBool(super.value);
}

extension RxBoolExtension<E> on bool {
  RxBool get rx => RxBool(this);
}

extension RxListExtension<E> on List<E> {
  RxList<E> get rx => RxList<E>(this);
}

class RxList<E> extends RxValue<List<E>> {
  RxList(super.value);

  void add(E e) {
    _value.add(e);
    notifyListeners();
  }

  void addAll(Iterable<E> iterable) {
    _value.addAll(iterable);
    notifyListeners();
  }

  void remove(E e) {
    _value.remove(e);
    notifyListeners();
  }

  void removeAt(int index) {
    _value.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _value.clear();
    notifyListeners();
  }

  E operator [](int index) => _value[index];

  void operator []=(int index, E value) {
    _value[index] = value;
    notifyListeners();
  }

  bool contains(Object? e) => _value.contains(e);

  E get first => _value.first;

  E get last => _value.last;

  int get length => _value.length;

  bool get isEmpty => _value.isEmpty;

  bool get isNotEmpty => _value.isNotEmpty;
}

extension RxMapExtension<K, V> on Map<K, V> {
  RxMap<K, V> get rx => RxMap<K, V>(this);
}

class RxMap<K, V> extends RxValue<Map<K, V>> {
  RxMap(super.value);

  void addAll(Map<K, V> other) {
    _value.addAll(other);
    notifyListeners();
  }

  V? remove(K k) {
    var v = _value.remove(k);
    notifyListeners();
    return v;
  }

  void clear() {
    _value.clear();
    notifyListeners();
  }

  V? operator [](Object? key) => _value[key];

  void operator []=(K key, V value) {
    _value[key] = value;
    notifyListeners();
  }

  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    _value.addEntries(newEntries);
    notifyListeners();
  }

  bool containsValue(Object? value) => _value.containsValue(value);

  bool containsKey(Object? key) => _value.containsKey(key);

  Iterable<MapEntry<K, V>> get entries => _value.entries;

  Iterable<K> get keys => _value.keys;

  Iterable<V> get values => _value.values;

  int get length => _value.length;

  bool get isEmpty => _value.isEmpty;

  bool get isNotEmpty => _value.isNotEmpty;
}
