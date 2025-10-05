import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../services/fake_api_service.dart';

class AsyncDemoScreen extends StatefulWidget {
  const AsyncDemoScreen({super.key});

  @override
  State<AsyncDemoScreen> createState() => _AsyncDemoScreenState();
}

class _AsyncDemoScreenState extends State<AsyncDemoScreen> {
  String? data;
  bool loading = false;
  String? error;

  Future<void> _loadData() async {
    setState(() {
      loading = true;
      data = null;
      error = null;
    });

    try {
      final result = await FakeApiService().fetchData();
      setState(() {
        data = result;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demostración de Asincronía")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _loadData,
              child: const Text("Cargar datos (Future + async/await)"),
            ),
            const SizedBox(height: 16),

            // 🔹 Skeleton mientras carga
            Skeletonizer(
              enabled: loading,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  error != null
                      ? "❌ Error: $error"
                      : data ?? "Aquí aparecerán los datos simulados.",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
