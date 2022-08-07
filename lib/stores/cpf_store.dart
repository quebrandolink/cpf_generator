import 'dart:math';

import 'package:cpf_generator/utils/locales_cpf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CpfStore with ChangeNotifier {
  String _cpf = "00000000000";
  String _localeCpf = "";
  bool masked = false;
  String get cpfMasked =>
      "${_cpf.substring(0, 3)}.${_cpf.substring(3, 6)}.${_cpf.substring(6, 9)}-${_cpf.substring(9)}";

  String get cpf => _cpf;
  String get locale => _localeCpf;

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  List<int> _createInitialNumbers() {
    List<int> cpf = List.generate(9, (index) => Random().nextInt(10));

    if (cpf.join() == "123456789" || cpf.toSet().toList().length == 1) {
      return _createInitialNumbers();
    }

    return cpf;
  }

  int _generateVefiricatorNumber(List<int> cpfInitial) {
    int totalMultiplicator = cpfInitial.length + 1;
    int index = 0;
    int sum = 0;

    for (int multi = totalMultiplicator; multi >= 2; multi--) {
      sum += cpfInitial[index++] * multi;
    }

    int rest = sum % 11;

    return rest < 2 ? 0 : (11 - rest);
  }

  void setMasked(bool value) {
    masked = value;
    notifyListeners();
  }

  void generate() {
    List<int> cpfInitial = _createInitialNumbers();

    _localeCpf = LocaleCpf().getLocale(cpfInitial.last);

    cpfInitial.add(_generateVefiricatorNumber(cpfInitial));

    cpfInitial.add(_generateVefiricatorNumber(cpfInitial));

    _cpf = cpfInitial.join("");

    if (kDebugMode) {
      print(_cpf);
      print(_localeCpf);
    }

    notifyListeners();
  }
}
