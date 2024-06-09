import 'package:fase_4/widgets/custom_input/custom_input.widget.dart';
import 'package:flutter/material.dart';

class NewDeckPage extends StatefulWidget {
  const NewDeckPage({super.key});

  @override
  State<NewDeckPage> createState() => _NewDeckPageState();
}

class _NewDeckPageState extends State<NewDeckPage> {
  final _titleDeckController = TextEditingController();

  @override
  void dispose() {
    _titleDeckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          key: const Key("btnvoltar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text("Novo deck"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Qual é o título do seu novo deck? ",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomInput(
              controller: _titleDeckController,
              label: "Título do deck",
              key: const Key("tituloDeck"),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_titleDeckController.text.isNotEmpty) {
                    Navigator.of(context).pop(_titleDeckController.text);
                  }
                },
                key: const Key("btnAdicionarDeck"),
                child: const Text("Adicionar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
