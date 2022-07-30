import 'dart:math';
import 'package:cpf_generator/utils/locales_cpf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CpfStore with ChangeNotifier {
  String _cpf = "";
  String _localeCpf = "";

  String get cpf => _cpf;
  String get locale => _localeCpf;

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  List<int> _createInitialNumbers() {
    List<int> cpf = List.generate(9, (index) => Random().nextInt(10));

    if (cpf.join("") == "123456789") {
      _createInitialNumbers();
    }
    if (cpf.toSet().toList().length == 1) {
      _createInitialNumbers();
    }
    if (cpf[0] == 0) {
      _createInitialNumbers();
    }

    return cpf;
  }

  int _generateVefiricatorNumber(List<int> cpfInitial) {
    int totalMultiplicator = cpfInitial.length + 1;
    int index = 0;
    int sum = 0;

    for (int multi = totalMultiplicator; multi >= 2; multi--) {
      sum += cpfInitial[index] * multi;
      index++;
    }

    int rest = sum % 11;

    return rest < 2 ? 0 : (11 - rest);
  }

  void generate() {
    List<int> cpfInitial = _createInitialNumbers();

    _localeCpf = LocaleCpf().getLocale(cpfInitial.last);

    int firstNumber = _generateVefiricatorNumber(cpfInitial);

    cpfInitial.add(firstNumber);

    int secondNumber = _generateVefiricatorNumber(cpfInitial);

    cpfInitial.add(secondNumber);

    _cpf = cpfInitial.join("");

    if (kDebugMode) {
      print(_cpf);
      print(_localeCpf);
    }

    notifyListeners();
  }
}
