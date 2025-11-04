import 'package:flutter/material.dart';
import '../../../models/universidad.dart';
import '../../../services/universidad_service.dart';

class UniversidadFormScreen extends StatefulWidget {
  final Universidad? universidad;

  const UniversidadFormScreen({super.key, this.universidad});

  @override
  State<UniversidadFormScreen> createState() => _UniversidadFormScreenState();
}

class _UniversidadFormScreenState extends State<UniversidadFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _universidadService = UniversidadService();

  late TextEditingController _nitController;
  late TextEditingController _nombreController;
  late TextEditingController _direccionController;
  late TextEditingController _telefonoController;
  late TextEditingController _paginaWebController;

  @override
  void initState() {
    super.initState();
    _nitController = TextEditingController(text: widget.universidad?.nit ?? '');
    _nombreController = TextEditingController(text: widget.universidad?.nombre ?? '');
    _direccionController = TextEditingController(text: widget.universidad?.direccion ?? '');
    _telefonoController = TextEditingController(text: widget.universidad?.telefono ?? '');
    _paginaWebController = TextEditingController(text: widget.universidad?.paginaWeb ?? '');
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

  bool _isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.isAbsolute;
    } catch (e) {
      return false;
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final universidad = Universidad(
        id: widget.universidad?.id,
        nit: _nitController.text,
        nombre: _nombreController.text,
        direccion: _direccionController.text,
        telefono: _telefonoController.text,
        paginaWeb: _paginaWebController.text,
      );

      try {
        if (widget.universidad == null) {
          await _universidadService.crearUniversidad(universidad);
        } else {
          await _universidadService.actualizarUniversidad(universidad);
        }
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.universidad == null
            ? 'Nueva Universidad'
            : 'Editar Universidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nitController,
                decoration: const InputDecoration(labelText: 'NIT'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el NIT';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la dirección';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el teléfono';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _paginaWebController,
                decoration: const InputDecoration(labelText: 'Página Web'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la página web';
                  }
                  if (!_isValidUrl(value)) {
                    return 'Por favor ingrese una URL válida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  widget.universidad == null ? 'Crear Universidad' : 'Actualizar Universidad',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}