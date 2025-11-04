import 'package:flutter/material.dart';
import '../../../models/universidad.dart';
import '../../../services/universidad_service.dart';
import 'formulario_universidad_screen.dart';

class ListaUniversidadesScreen extends StatelessWidget {
  const ListaUniversidadesScreen({super.key});

  void _mostrarDetalles(BuildContext context, Universidad universidad) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Detalles universidad',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // 80% del ancho
              height: MediaQuery.of(context).size.height * 0.6, // 60% de la altura
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      universidad.nombre,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(Icons.numbers, 'NIT', universidad.nit),
                    _buildInfoRow(Icons.location_on, 'Dirección', universidad.direccion),
                    _buildInfoRow(Icons.phone, 'Teléfono', universidad.telefono),
                    _buildInfoRow(Icons.web, 'Página Web', universidad.paginaWeb),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                      label: const Text('Cerrar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final universidadService = UniversidadService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades'),
      ),
      body: StreamBuilder<List<Universidad>>(
        stream: universidadService.getUniversidades(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final universidades = snapshot.data!;
          if (universidades.isEmpty) {
            return const Center(child: Text('No hay universidades registradas'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: universidades.length,
            itemBuilder: (context, index) {
              final universidad = universidades[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    universidad.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(universidad.direccion),
                  onTap: () => _mostrarDetalles(context, universidad),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormularioUniversidadScreen(
                            universidad: universidad,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormularioUniversidadScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
