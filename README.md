# 📱 Taller - Paso de Parámetros y Widgets en Flutter

Este proyecto corresponde al taller de **navegación con parámetros, uso de widgets y ciclo de vida en Flutter**, utilizando `go_router` y siguiendo el flujo de trabajo con **GitFlow**.

---

## 🚀 Arquitectura y Navegación

El proyecto está organizado en capas para mantener un código limpio:

- **`lib/config/`** → configuración de rutas (`app_router.dart`).
- **`lib/ui/views/`** → pantallas principales (`HomeScreen`, `DetalleScreen`, `GridTabScreen`, `CicloVidaScreen`).
- **`lib/ui/widgets/`** → componentes reutilizables como `BaseView`.

### 🔀 Rutas Definidas

- `/` → **HomeScreen** (pantalla principal con botones de navegación).
- `/detalle/:mensaje/:tipo` → **DetalleScreen** (recibe parámetros y los muestra en pantalla).
- `/grid` → **GridTabScreen** (demuestra uso de GridView y TabBar).
- `/ciclo` → **CicloVidaScreen** (muestra el ciclo de vida de un StatefulWidget en consola).

### 📌 Paso de Parámetros

Ejemplo:  
Desde **HomeScreen** se envía un mensaje y el tipo de navegación (go, push o replace) hacia **DetalleScreen**:

context.go('/detalle/Hola desde go/go');
context.push('/detalle/Hola desde push/push');
context.replace('/detalle/Hola desde replace/replace');

## 🌿 Widgets Usados

### 1. GridView
Utilizado para mostrar una lista de elementos en forma de cuadrícula.  
En este caso, se generan tarjetas con colores y texto de ejemplo.  

**Motivo:** facilita la visualización de listas organizadas en varias columnas.

---

### 2. TabBar + TabBarView
Se incluyó dentro de `GridTabScreen` para dividir la pantalla en secciones (Ej: "Grid" y "Lista").  

**Motivo:** mejora la organización y experiencia del usuario, permitiendo navegar entre diferentes vistas sin salir de la pantalla.

---

### 3. Card + ListView (widget adicional)
En la segunda pestaña del `TabBar` se agregó un `ListView` con elementos dentro de `Card`.  

**Motivo:** mostrar un tercer widget en acción, ideal para listas verticales con un diseño más atractivo y moderno.
