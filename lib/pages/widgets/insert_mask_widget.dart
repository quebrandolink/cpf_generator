import 'package:flutter/material.dart';

import '../../stores/cpf_store.dart';

class InsertMaskWidget extends StatelessWidget {
  const InsertMaskWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  final CpfStore store;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Row(
        children: [
          const Text("INSERIR PONTOS"),
          Checkbox(
            value: store.masked,
            shape: const CircleBorder(),
            onChanged: (value) => store.setMasked(value ?? false),
          ),
        ],
      ),
    );
  }
}
