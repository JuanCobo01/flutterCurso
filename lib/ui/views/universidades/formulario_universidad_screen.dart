import 'package:flutter/material.dart';
import 'package:flutterCurso/models/universidad.dart';
import 'package:flutterCurso/services/universidad_service.dart';

class FormularioUniversidadScreen extends StatefulWidget {
  final Universidad? universidad;

  const FormularioUniversidadScreen({super.key, this.universidad});

  @override
  State<FormularioUniversidadScreen> createState() =>
      _FormularioUniversidadScreenState();
}

class _FormularioUniversidadScreenState
    extends State<FormularioUniversidadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nitController = TextEditingController();
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _paginaWebController = TextEditingController();

  final universidadService = UniversidadService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.universidad != null) {
      _nitController.text = widget.universidad!.nit;
      _nombreController.text = widget.universidad!.nombre;
      _direccionController.text = widget.universidad!.direccion;
      _telefonoController.text = widget.universidad!.telefono;
      _paginaWebController.text = widget.universidad!.paginaWeb;
    }
  }

  @override
  void dispose() {
    _nitController.dispose();
    _nombreController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _paginaWebController.dispose();
    super.dispose();
  }

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'La página web es requerida';
    }
    final urlPattern = RegExp(
      r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$',
    );
    if (!urlPattern.hasMatch(value)) {
      return 'Ingrese una URL válida';
    }
    return null;
  }

  Future<void> _guardarUniversidad() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final universidad = Universidad(
      id: widget.universidad?.id,
      nit: _nitController.text.trim(),
      nombre: _nombreController.text.trim(),
      direccion: _direccionController.text.trim(),
      telefono: _telefonoController.text.trim(),
      paginaWeb: _paginaWebController.text.trim(),
    );

    try {
      if (widget.universidad == null) {
        await universidadService.crearUniversidad(universidad);
      } else {
        await universidadService.actualizarUniversidad(universidad);
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.universidad == null
                ? 'Universidad creada con éxito'
                : 'Universidad actualizada con éxito'),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditando = widget.universidad != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditando ? 'Editar Universidad' : 'Nueva Universidad'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nitController,
              decoration: const InputDecoration(
                labelText: 'NIT',
                hintText: 'Ejemplo: 890.123.456-7',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'El NIT es requerido' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                hintText: 'Nombre de la universidad',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'El nombre es requerido'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _direccionController,
              decoration: const InputDecoration(
                labelText: 'Dirección',
                hintText: 'Dirección física',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'La dirección es requerida'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _telefonoController,
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                hintText: 'Número de contacto',
                border: OutlineInputBorder(),
              ),
              validator: (v) => v == null || v.trim().isEmpty
                  ? 'El teléfono es requerido'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _paginaWebController,
              decoration: const InputDecoration(
                labelText: 'Página Web',
                hintText: 'https://www.ejemplo.com',
                border: OutlineInputBorder(),
              ),
              validator: _validateUrl,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _guardarUniversidad,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(isEditando ? 'Actualizar' : 'Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
