import 'dart:isolate';

// Helper que lanza un Isolate y devuelve el resultado (ej. suma 0..n-1)
Future<int> runHeavySum(int n) async {
  final rp = ReceivePort();
  await Isolate.spawn(_isolateEntry, [rp.sendPort, n]);
  final result = await rp.first as int;
  rp.close();
  return result;
}

// Entry point del isolate: recibe [SendPort, int n]
void _isolateEntry(List<dynamic> args) {
  final SendPort send = args[0] as SendPort;
  final int n = args[1] as int;

  // Tarea CPU-bound: suma 0..n-1
  int sum = 0;
  for (int i = 0; i < n; i++) {
    sum += i;
    // opcional: trabajo adicional para simular carga
  }

  send.send(sum); // envía resultado de vuelta
}
