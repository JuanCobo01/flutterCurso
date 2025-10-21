# 📱 Flutter Curso - UCEVA

## 📌 Descripción
Este repositorio contiene el desarrollo de los talleres del curso de Flutter en UCEVA.  
Incluye implementaciones de UI, navegación, y distribución de aplicaciones móviles.

### 🚀 Taller 1 - Distribución con Firebase
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
   - Versión actual: `1.0.3+4`

## 📦 Publicación y Distribución

### 🔄 **Flujo de Distribución Completo**
```
Generar APK → App Distribution → Testers → Instalación → Actualización
     ↓              ↓              ↓           ↓            ↓
1. flutter      2. Firebase    3. Invitar   4. Tester    5. Nueva versión
   build apk       Console       usuarios     instala      y repetir ciclo
```

#### **Explicación del Flujo:**
1. **Generar APK**: Compilar la aplicación para Android en modo release
2. **App Distribution**: Subir el APK a Firebase App Distribution
3. **Testers**: Configurar grupos de testing e invitar usuarios
4. **Instalación**: Los testers reciben el enlace e instalan la app
5. **Actualización**: Repetir el proceso con nuevas versiones

### 📋 **Sección Publicación**

#### **Pasos Resumidos para Replicar en el Equipo:**

**PASO 1: Preparación del APK**
```bash
# 1. Actualizar versión en pubspec.yaml
version: 1.0.X+Y

# 2. Limpiar y generar APK
flutter clean
flutter pub get
flutter build apk --release
```

**PASO 2: Firebase Console Setup**
1. Ir a [Firebase Console](https://console.firebase.google.com/)
2. Seleccionar proyecto → App Distribution
3. Crear grupo de testers: `QA_Clase`
4. Agregar email del tester: `dduran@uceva.edu.co`

**PASO 3: Distribución**
1. Subir APK desde: `build/app/outputs/flutter-apk/app-release.apk`
2. Completar Release Notes (ver formato abajo)
3. Seleccionar grupo de testers
4. Hacer clic en "Distribute"
5. Copiar enlace de instalación

**PASO 4: Verificación**
1. Confirmar que tester recibe email de invitación
2. Verificar instalación exitosa en dispositivo Android
3. Documentar el proceso con capturas de pantalla

#### **Replicación en Equipo:**
```bash
# Para que otros miembros del equipo puedan replicar:
git clone https://github.com/JuanCobo01/flutterCurso.git
cd flutterCurso
flutter pub get

# Seguir los pasos 1-4 anteriores
# Usar el mismo proyecto Firebase
# Agregar nuevos testers al grupo QA_Clase
```

### 📊 **Versionado y Release Notes**

#### **Sistema de Versionado:**
```yaml
# Formato en pubspec.yaml
version: MAJOR.MINOR.PATCH+BUILD_NUMBER

# Ejemplos prácticos:
version: 1.0.2+3  # Correcciones menores
version: 1.0.3+4  # Nuevas funcionalidades
```

**Reglas de Incremento:**
- **MAJOR**: Cambios incompatibles o restructuración completa
- **MINOR**: Nuevas funcionalidades compatibles
- **PATCH**: Correcciones de bugs o mejoras menores
- **BUILD_NUMBER**: Siempre incrementar en cada build

#### **Formato de Release Notes:**
```
Versión X.X.X – [Título del Release]
Fecha: DD de Mes, YYYY
Responsable: [Nombre Completo] ([Código Estudiante])
Tamaño: ~XX MB
Compatibilidad: Android 5.0+ (API 21+)
Grupo de testing: QA_Clase
Contacto: [email]

Características Implementadas:
- [Característica 1]
- [Característica 2]
- [Característica 3]

Instrucciones de Prueba:
- [Instrucción 1]
- [Instrucción 2]
- [Instrucción 3]

Estado de Pruebas:
[Descripción del estado actual y observaciones]
```

#### **Ejemplos Reales del Proyecto:**

**Ejemplo v1.0.1 - Formato Académico:**
```
Versión 1.0.1 – Release Inicial para QA
Fecha: 20 de Octubre, 2025
Responsable: Juan David Cobo Aguirre (230221060)
Tamaño: ~44 MB
Compatibilidad: Android 5.0+ (API 21+)
Grupo de testing: QA_Clase
Contacto: coboaguirrej@gmail.com

Características Implementadas:
- Interfaz con AppBar dinámico
- Navegación con go_router
- Skeleton loading para mejor experiencia de usuario
- Integración de widgets Container y ListView
- Imágenes desde network y assets

Instrucciones de Prueba:
- Abrir la app y verificar correcto inicio
- Comprobar cambio de título en AppBar
- Navegar entre pantallas
- Validar carga correcta de imágenes
- Reportar errores o comportamientos anómalos

Estado de Pruebas:
Versión estable para pruebas funcionales iniciales.
No se detectaron fallos críticos.
```

**v1.0.1+2 - Release Inicial:**
- Funcionalidades base del Taller 1
- AppBar dinámico, imágenes, navegación
- 5 pantallas principales

**v1.0.3+4 - Expansión de Funcionalidades:**
- Calculadora, Todo List, Juego de adivinanza
- Contador persistente, toggle de temas
- 10 pantallas activas

### 🔧 **Comandos Rápidos para el Equipo**
```bash
# Generar APK para distribución
flutter clean && flutter build apk --release

# Verificar versión actual
grep "version:" pubspec.yaml

# Ver estructura de archivos APK
ls -la build/app/outputs/flutter-apk/

# Verificar permisos en AndroidManifest
cat android/app/src/main/AndroidManifest.xml
```

---

## 🧑‍🎓 Estudiante
**Juan David Cobo Aguirre** - 230221060   
