import 'package:cpf_generator/cpf_store.dart';
import 'package:flutter/material.dart';

class CpfPage extends StatefulWidget {
  const CpfPage({Key? key}) : super(key: key);

  @override
  State<CpfPage> createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  final store = CpfStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CPF Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedBuilder(
          animation: store,
          builder: (_, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MASTERCLASS FLUTTERANDO",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "30/07/2022",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Material(
                  shadowColor: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: store.cpf.isEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Clique no botão para gerar o cpf.",
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectableText(
                                      store.cpf,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    const SizedBox(width: 10),
                                    store.cpf.isEmpty
                                        ? const SizedBox()
                                        : IconButton(
                                            onPressed: () {
                                              store.copyToClipboard(store.cpf);

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(
                                                    'CPF: ${store.cpf} \nCopiado com sucesso!'),
                                              ));
                                            },
                                            icon:
                                                const Icon(Icons.copy_rounded),
                                          ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  store.locale,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.generate,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
