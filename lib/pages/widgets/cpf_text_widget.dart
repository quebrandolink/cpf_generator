import 'package:cpf_generator/stores/cpf_store.dart';
import 'package:flutter/material.dart';

class CpfTextWidget extends StatelessWidget {
  const CpfTextWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  final CpfStore store;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      textAlign: TextAlign.center,
      overflow: TextOverflow.fade,
      curve: Curves.bounceOut,
      style: store.masked
          ? Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.black,
                fontSize: 40,
              )
          : Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.black,
                fontSize: 41,
              ),
      duration: const Duration(milliseconds: 600),
      child: SelectableText(
        (store.masked) ? store.cpfMasked : store.cpf,
      ),
    );
  }
}
