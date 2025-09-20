# Flutter Navigation & Widgets Demo

Este proyecto es una práctica de navegación con **GoRouter** en Flutter y la implementación de diferentes **widgets de presentación** como `GridView`, `TabBar` y `ListView`.

---

## 📌 Navegación

La aplicación utiliza **GoRouter** para definir las rutas y controlar la navegación.  
Las rutas disponibles son:

- `/` → **HomeScreen** (pantalla de inicio con botones de navegación).
- `/detalle/:mensaje/:origen` → **DetailScreen** (pantalla de detalle que recibe parámetros desde `go`, `push` y `replace`).
- `/grid` → **GridTabScreen** (pantalla que combina un `GridView` y un `ListView` con `TabBar`).
- `/ciclo` → **CicloDeVidaScreen** (pantalla de prueba para ver el ciclo de vida de un widget).

### Envío de parámetros

Los parámetros se envían directamente en la ruta. Ejemplo:

```dart
context.go('/detalle/Hola desde go/go');
context.push('/detalle/Hola desde push/push');
context.replace('/detalle/Hola desde replace/replace');

## ▶️ Pasos para ejecutar el proyecto

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/JuanCobo01/flutterCurso.git
2. Entrar en la carpeta del proyecto:
   ```bash
   cd flutterCurso
3. Instalar las dependencias:
   ```bash
   flutter pub get
4. Ejecutar la aplicación:
   ```bash
   flutter run


## 🧑‍🎓Juan David Cobo Aguirre / 230221060   
