# 🧠 Flutter Async & Isolate Demo

Este proyecto demuestra el uso de **asincronía en Flutter**, aplicando los conceptos de `Future`, `async/await`, `Timer` e `Isolate`.  
Incluye ejemplos prácticos en una aplicación con un **cronómetro (Timer)** y una **tarea pesada (Isolate)**, mostrando cómo evitar que la interfaz se bloquee.

---

## 🚀 Objetivo del proyecto

El objetivo de esta app es mostrar cómo manejar tareas asíncronas en Flutter **sin congelar la interfaz del usuario (UI)**.  
Se implementan distintos mecanismos de ejecución asíncrona:

- **`Future`**: para tareas que devuelven un valor en el futuro.  
- **`async/await`**: para escribir código asíncrono de forma legible.  
- **`Timer`**: para ejecutar acciones periódicas o después de un tiempo.  
- **`Isolate`**: para ejecutar tareas pesadas en paralelo al hilo principal.

---

## 🧭 Diagrama de pantallas y flujo de navegación

<img width="3840" height="2105" alt="image" src="https://github.com/user-attachments/assets/d7aa108d-5363-4a3d-bff6-c46b488befc2" />

---

## 📘 Conceptos de asincronía en Flutter

### 🔹 **1. Future**

Un `Future` representa una **tarea asíncrona** que devolverá un valor **en el futuro**.  
Se usa cuando una operación **tarda un tiempo** en completarse, como leer un archivo o consultar una API.

**Cuándo usarlo:**
- Cuando necesitas obtener un resultado **después de un tiempo**.
- Para operaciones que **no deben bloquear la UI**.
- En llamadas HTTP, acceso a base de datos o cálculos lentos.

**Ejemplo:**
```dart
Future<String> obtenerDatos() async {
  await Future.delayed(const Duration(seconds: 2));
  return "Datos cargados correctamente";
}
```

Este `Future` simula una tarea que se completa tras 2 segundos.

---

### 🔹 **2. async / await**

Las palabras clave `async` y `await` permiten **manejar Futures de manera secuencial y más legible**.

- `async` convierte una función normal en una función asíncrona (retorna un `Future`).
- `await` pausa la ejecución hasta que el `Future` se complete.

**Cuándo usarlo:**
- Cuando necesitas **esperar un resultado** antes de continuar.
- Para **simplificar** el manejo de Futures.
- Para **evitar callbacks anidados**.

**Ejemplo:**
```dart
Future<void> cargarDatos() async {
  print("Cargando...");
  final datos = await obtenerDatos(); // Espera el Future
  print(datos);
}
```

Aquí la función espera el resultado de `obtenerDatos()` antes de continuar, sin bloquear la interfaz.

---

### 🔹 **3. Timer**

`Timer` permite ejecutar código **después de un retraso** o **de forma periódica**.  
Es ideal para cronómetros, temporizadores o acciones repetitivas.

**Cuándo usarlo:**
- Para ejecutar tareas **cada cierto tiempo**.
- Para **cronómetros**, **cuentas regresivas** o **animaciones simples**.
- Para ejecutar una función **después de un retraso específico**.

**Ejemplo:**
```dart
import 'dart:async';

void iniciarTemporizador() {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    print('Tick ${timer.tick}');
    if (timer.tick == 5) timer.cancel(); // Detiene después de 5 segundos
  });
}
```

Este código imprime "Tick" cada segundo y se detiene tras 5 repeticiones.

---

### 🔹 **4. Isolate**

Un `Isolate` es un **hilo de ejecución independiente** en Dart.  
A diferencia de los `Future` o `Timer`, un `Isolate` **corre en paralelo** y **no comparte memoria** con el hilo principal.

**Cuándo usarlo:**
- Cuando realizas **tareas muy pesadas** (por ejemplo, cálculos grandes o procesamiento de datos).
- Cuando el trabajo **podría congelar la interfaz** si se ejecuta en el hilo principal.
- Para **optimizar el rendimiento** de la aplicación.

**Ejemplo:**
```dart
import 'dart:isolate';

// Función pesada
void sumarHastaN(List args) {
  final n = args[0] as int;
  final sendPort = args[1] as SendPort;
  int suma = 0;
  for (int i = 0; i < n; i++) suma += i;
  sendPort.send(suma);
}

Future<int> ejecutarSumaPesada(int n) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(sumarHastaN, [n, receivePort.sendPort]);
  return await receivePort.first;
}
```

Este código ejecuta una suma pesada en un isolate separado para que la UI no se congele.

---

## 🏠 Pantallas de la aplicación

### 🏠 HomeScreen
- Pantalla principal del proyecto.  
- Contiene botones para ir al **cronómetro** o al **demo de Isolate**.
- Usa navegación con `GoRouter`.

---

### ⏱️ TimerDemo
- Demuestra el uso de `Timer.periodic` para crear un cronómetro funcional.
- Botones disponibles:
  - **Iniciar** → comienza el conteo.
  - **Pausar** → detiene temporalmente.
  - **Reanudar** → continúa desde el punto detenido.
  - **Reiniciar** → vuelve a cero.
- Usa `setState()` para actualizar la UI en tiempo real.

---

### ⚙️ IsolateDemo
- Ejecuta una **tarea pesada** (por ejemplo, sumar hasta 20 millones) usando un `Isolate`.
- Muestra:
  - Estado actual (`Presiona Ejecutar`, `Ejecutando Isolate...`, `Listo`, `Error`).
  - Resultado del cálculo.
- El texto y el botón están **centrados verticalmente** para una vista limpia.
- Permite regresar al Home con el botón del AppBar.

---

## 🔄 Flujo de uso

1. El usuario inicia la app y llega al **HomeScreen**.  
2. Puede elegir entre:
   - **Cronómetro** → prueba asincronía con `Timer`.  
   - **Tarea Pesada** → prueba ejecución paralela con `Isolate`.  
3. Ambas pantallas actualizan la UI en tiempo real **sin bloquear** el hilo principal.
4. El usuario puede regresar al menú principal en cualquier momento.
---
