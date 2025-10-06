import 'dart:math';
import 'dart:async';

class FakeApiService {
  Future<String> fetchData() async {
    print("🔹 Antes del Future.delayed");
    await Future.delayed(const Duration(seconds: 3));
    print("🔸 Durante la espera (simulando API)");
    if (Random().nextBool()) {
      print("✅ Datos cargados correctamente");
      return "Datos obtenidos desde el servidor simulado ✅";
    } else {
      print("❌ Error al cargar datos");
      throw Exception("Fallo en la consulta de la API");
    }
  }
}
