import 'package:cpf_generator/pages/widgets/container_widget.dart';
import 'package:cpf_generator/pages/widgets/cpf_text_widget.dart';
import 'package:cpf_generator/pages/widgets/icon_copy_widget.dart';
import 'package:cpf_generator/pages/widgets/insert_mask_widget.dart';
import 'package:cpf_generator/pages/widgets/title_widget.dart';
import 'package:cpf_generator/stores/cpf_store.dart';
import 'package:flutter/material.dart';

class CpfPage extends StatefulWidget {
  const CpfPage({Key? key}) : super(key: key);

  @override
  State<CpfPage> createState() => _CpfPageState();
}

class _CpfPageState extends State<CpfPage> {
  final store = CpfStore();

  @override
  void initState() {
    super.initState();
    store.generate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CPF Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TitleWidget(),
            const Spacer(),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: store,
              builder: (_, __) {
                return ContainerWidget(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InsertMaskWidget(store: store),
                          IconCopyWidget(store: store),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CpfTextWidget(store: store),
                      const SizedBox(height: 10),
                      Text(
                        store.locale,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.generate,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
