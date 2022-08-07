import 'package:cpf_generator/stores/cpf_store.dart';
import 'package:flutter/material.dart';

class IconCopyWidget extends StatelessWidget {
  const IconCopyWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  final CpfStore store;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("COPIAR CPF"),
        IconButton(
          tooltip: "Copiar CPF",
          onPressed: () {
            store.copyToClipboard(
              (store.masked) ? store.cpfMasked : store.cpf,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 500),
                content: Text(
                    'CPF: ${(store.masked) ? store.cpfMasked : store.cpf} \nCopiado com sucesso!'),
              ),
            );
          },
          icon: const Icon(Icons.copy_rounded),
        ),
      ],
    );
  }
}
