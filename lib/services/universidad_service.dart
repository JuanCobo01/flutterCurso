import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/universidad.dart';

class UniversidadService {
  final CollectionReference _universidadesCollection =
      FirebaseFirestore.instance.collection('universidades');

  // Obtener stream de universidades
  Stream<List<Universidad>> getUniversidades() {
    return _universidadesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Universidad.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Crear nueva universidad
  Future<void> crearUniversidad(Universidad universidad) async {
    await _universidadesCollection.add(universidad.toMap());
  }

  // Actualizar universidad
  Future<void> actualizarUniversidad(Universidad universidad) async {
    if (universidad.id == null) {
      throw Exception('No se puede actualizar una universidad sin ID');
    }
    await _universidadesCollection.doc(universidad.id).update(universidad.toMap());
  }

  // Eliminar universidad
  Future<void> eliminarUniversidad(String id) async {
    await _universidadesCollection.doc(id).delete();
  }
}