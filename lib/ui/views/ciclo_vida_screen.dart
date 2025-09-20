import 'package:flutter/material.dart';
import '../widgets/base_view.dart';

class CicloVidaScreen extends StatefulWidget {
  const CicloVidaScreen({super.key});

  @override
  State<CicloVidaScreen> createState() => _CicloVidaScreenState();
}

class _CicloVidaScreenState extends State<CicloVidaScreen> {
  int contador = 0;

  @override
  void initState() {
    super.initState();
    print("🔵 initState(): se crea el widget (solo una vez).");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("🟡 didChangeDependencies(): dependencias cambiaron (ej. tema).");
  }

  @override
  Widget build(BuildContext context) {
    print("🟢 build(): dibuja/reconstruye la UI.");
    return BaseView(
      title: "Ciclo de Vida",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador: $contador", style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
                print("🟠 setState(): actualiza el estado.");
              },
              child: const Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("🔴 dispose(): widget destruido (cuando sales de la pantalla).");
    super.dispose();
  }
}
