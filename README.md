# 📱 Flutter Curso - UCEVA

## 📌 Descripción
Este repositorio contiene el desarrollo de los talleres del curso de Flutter en UCEVA.  
Incluye implementaciones de UI, navegación, y distribución de aplicaciones móviles.

### 🎯 Taller 1 - Fundamentos de Flutter
- `AppBar` con título dinámico usando `setState()`
- Texto centrado con nombre del estudiante
- Imágenes con `Image.network()` e `Image.asset()`
- Botón con `ElevatedButton` y `SnackBar`
- Widgets: `Container`, `ListView`, `Column`, `Padding`

### 🚀 Taller 2 - Distribución con Firebase
- Configuración de Firebase App Distribution
- Gestión de versionado y releases
- Testing con usuarios externos
- Documentación de procesos de QA

---

## ▶️ Pasos para ejecutar el proyecto

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/JuanCobo01/flutterCurso.git
   ```

2. Entrar en la carpeta del proyecto:
   ```bash
   cd flutterCurso
   ```

3. Instalar las dependencias:
   ```bash
   flutter pub get
   ```

4. Ejecutar la aplicación:
   ```bash
   flutter run
   ```

## 📦 Publicación y Distribución

### 🔧 Generar APK para Distribución
```bash
flutter clean
flutter build apk
```
El APK se genera en: `build/app/outputs/flutter-apk/app-release.apk`

### � Firebase App Distribution
1. **Configuración del Proyecto**:
   - Application ID: `com.example.grupo_2`
   - Versión actual: `1.0.1+2`

2. **Flujo de Distribución**:
   ```
   Generar APK → Firebase Console → App Distribution → 
   Agregar Testers → Subir Release → Distribuir → Instalación
   ```

3. **Versionado**:
   - Formato: `major.minor.patch+buildNumber`
   - Ejemplo: `1.0.0+1` → `1.0.1+2`
   - Actualizar en `pubspec.yaml` antes de cada release

4. **Release Notes Template**:
   ```
   🚀 Versión X.X.X - [Título del Release]
   
   ✨ Nuevas características:
   - [Cambio 1]
   - [Cambio 2]
   
   🐛 Correcciones:
   - [Fix 1]
   
   📅 Fecha: DD/MM/YYYY
   👥 Responsable: [Nombre]
   ```

5. **Grupo de Testers**:
   - Nombre: `QA_Clase`
   - Tester principal: `dduran@uceva.edu.co`

### 📋 Proceso de QA
1. **Distribución inicial** (v1.0.1)
2. **Testing en dispositivo físico**
3. **Actualización incremental** (v1.0.2)
4. **Verificación del flujo de actualización**
5. **Documentación de evidencias**

### 📁 Documentación Adicional
- Ver guía detallada en: [`DISTRIBUCION_FIREBASE.md`](./DISTRIBUCION_FIREBASE.md)
- Incluye pasos específicos para Firebase Console
- Templates para Release Notes y Bitácora de QA
- Buenas prácticas de versionado

---

## �📷 Capturas de pantalla:
1. Codigo (Estado inicial y cambio de titulo),2 widgets(Container y ListView):
<img width="701" height="196" alt="image" src="https://github.com/user-attachments/assets/6ab4726c-8739-4c2d-92f3-552a2d403b30" />
<br>
<br>
<img width="502" height="1009" alt="image" src="https://github.com/user-attachments/assets/fe09fe7b-f752-466a-975d-c4ca1ead9447" />
<br>
<br>
<img width="497" height="1021" alt="image" src="https://github.com/user-attachments/assets/7902d944-0b40-40e7-837f-381202164d26" />

---

## 🧑‍🎓 Estudiante
**Juan David Cobo Aguirre** - 230221060   
