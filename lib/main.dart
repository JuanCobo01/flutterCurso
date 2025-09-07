import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _titulo = "Hola, Flutter";
  bool _cambiado = false;

  void _cambiarTitulo() {
    setState(() {
      _cambiado = !_cambiado;
      _titulo = _cambiado ? "¡Título cambiado!" : "Hola, Flutter";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Título actualizado")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Texto con mi nombre
            Center(
              child: Text(
                "Juan David Cobo Aguirre",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            /// ElevatedButton que cambia el título
            ElevatedButton(
              onPressed: _cambiarTitulo,
              child: const Text("Cambiar título"),
            ),
            const SizedBox(height: 20),

            /// Row con imagen network + imagen local
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/128/6270/6270188.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/imagenes/javaN.png', // imagen local
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 20),

            /// Container decorado
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Soy un Container con bordes y color!!!"),
            ),
            const SizedBox(height: 20),

            /// ListView con elementos
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text("Estudio en la UCEVA"),
                  ),
                  ListTile(
                    leading: Icon(Icons.computer),
                    title: Text("Ingeniería de Sistemas"),
                  ),
                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text("Me gusta programar en Flutter y Java"),
                  ),
                  ListTile(
                    leading: Icon(Icons.lightbulb),
                    title: Text("Siempre aprendiendo cosas nuevas"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
