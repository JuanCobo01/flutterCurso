# 📱 Guía de Firebase App Distribution

## 🎯 Información del Proyecto
- **Application ID**: `com.example.grupo_2`
- **Versión actual**: `1.0.1+2`
- **APK generado**: `build\app\outputs\flutter-apk\app-release.apk`

## 🔧 Paso 1: Configurar Firebase Console

### 1.1 Crear/Abrir Proyecto Firebase
1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Haz clic en "Agregar proyecto" o selecciona uno existente
3. Nombra tu proyecto (ej: "flutterCurso-qa")

### 1.2 Registrar App Android
1. En el panel de Firebase, haz clic en "Agregar app" → Ícono de Android
2. **Application ID**: `com.example.grupo_2` (copia exactamente este ID)
3. **App nickname**: "Flutter Curso QA"
4. Haz clic en "Registrar app"
5. Descarga el archivo `google-services.json` (lo usarás más tarde si necesitas analytics)

## 🚀 Paso 2: Configurar App Distribution

### 2.1 Acceder a App Distribution
1. En Firebase Console, ve al menú lateral izquierdo
2. Busca "Release & Monitor" → "App Distribution"
3. Si no aparece, actívalo en "Build & Release"

### 2.2 Crear Grupo de Testers
1. Ve a la pestaña "Testers & Groups"
2. Haz clic en "Add group"
3. **Nombre del grupo**: `QA_Clase`
4. **Descripción**: "Grupo de testing para clase UCEVA"
5. Haz clic en "Create group"

### 2.3 Agregar Tester
1. Con el grupo `QA_Clase` seleccionado, haz clic en "Add testers"
2. **Email**: `dduran@uceva.edu.co`
3. Haz clic en "Add testers"

## 📦 Paso 3: Subir y Distribuir APK

### 3.1 Subir APK
1. Ve a la pestaña "Releases"
2. Haz clic en "Distribute app"
3. **Opción 1**: Arrastra el archivo `app-release.apk` desde:
   ```
   C:\Users\JuanC\Desktop\flutter uceva\flutterCurso\build\app\outputs\flutter-apk\app-release.apk
   ```
4. **Opción 2**: Haz clic en "Browse" y navega hasta el archivo

### 3.2 Configurar Release
1. **Release notes** (ejemplo):
   ```
   🚀 Versión 1.0.1 - Release Inicial
   
   ✨ Características:
   - Interfaz de usuario mejorada
   - Navegación con go_router implementada
   - Skeleton loading integrado
   
   📅 Fecha: 20 de Octubre, 2025
   👥 Responsable: [Tu nombre]
   
   🔧 Instrucciones de prueba:
   - Instalar y verificar que la app abre correctamente
   - Navegar por las diferentes pantallas
   - Reportar cualquier error encontrado
   ```

2. **Groups**: Selecciona `QA_Clase`
3. Haz clic en "Distribute"

### 3.3 Copiar Enlace de Instalación
1. Una vez distribuido, verás tu release en la lista
2. Haz clic en los tres puntos (⋮) del release
3. Selecciona "Copy installation link"
4. **Guarda este enlace** - lo necesitarás para documentación

## 📲 Paso 4: Proceso de Testing

### 4.1 Verificación del Tester
El tester (`dduran@uceva.edu.co`) recibirá:
1. **Email de invitación** para unirse a Firebase App Distribution
2. **Email de notificación** cuando haya un nuevo release disponible

### 4.2 Instalación en Dispositivo Android
1. El tester debe abrir el email en su dispositivo Android
2. Tocar "View in Firebase App Distribution"
3. Descargar e instalar la app
4. **Importante**: Permitir instalación de fuentes desconocidas si es necesario

## 🔄 Paso 5: Proceso de Actualización (1.0.1 → 1.0.2)

### 5.1 Hacer Cambios en la App
1. Realiza modificaciones en tu código
2. Actualiza la versión en `pubspec.yaml`:
   ```yaml
   version: 1.0.2+3
   ```

### 5.2 Generar Nuevo APK
```powershell
flutter clean
flutter build apk
```

### 5.3 Distribuir Nueva Versión
1. Regresa a Firebase Console → App Distribution
2. Sube el nuevo APK
3. **Release notes** (ejemplo):
   ```
   🔄 Versión 1.0.2 - Actualización
   
   🐛 Correcciones:
   - Bug fix en navegación corregido
   - Mejoras de rendimiento
   
   📅 Fecha: 20 de Octubre, 2025
   ```
4. Distribuir al mismo grupo `QA_Clase`

## 📸 Paso 6: Documentación de Evidencias

### 6.1 Capturas Requeridas
- [ ] Panel de Firebase Console mostrando el proyecto
- [ ] Página de App Distribution con releases
- [ ] Lista de testers en el grupo QA_Clase
- [ ] Email recibido por el tester
- [ ] App instalada en dispositivo Android
- [ ] Pantalla de la app funcionando
- [ ] Proceso de actualización (antes/después)

### 6.2 Bitácora de QA (Plantilla)
```
📋 BITÁCORA DE TESTING - Flutter Curso

🔍 Versión Probada: 1.0.1+2
📅 Fecha de Prueba: 20/10/2025
👤 Tester: dduran@uceva.edu.co
📱 Dispositivo: [Modelo del dispositivo]

✅ CASOS DE PRUEBA EXITOSOS:
- Instalación desde Firebase App Distribution
- Apertura de la aplicación
- Navegación entre pantallas
- [Agregar más casos específicos]

❌ INCIDENCIAS ENCONTRADAS:
- [Si hay errores, describirlos aquí]
- [Incluir pasos para reproducir]

🔄 ACTUALIZACIÓN PROBADA:
- Versión anterior: 1.0.1
- Versión nueva: 1.0.2
- Proceso de actualización: [Exitoso/Con errores]

📝 NOTAS ADICIONALES:
- [Cualquier observación relevante]
```

## ⚙️ Buenas Prácticas

### ✅ Release Notes Efectivas
- Usar emojis para mayor claridad
- Incluir fecha y responsable
- Describir cambios específicos
- Agregar instrucciones de prueba si es necesario

### ✅ Versionado Consistente
- **Major.Minor.Patch+BuildNumber**
- Ejemplo: `1.0.1+2` → `1.0.2+3`
- Incrementar buildNumber siempre
- Incrementar versión según el tipo de cambio

### ✅ Gestión de Testers
- Crear grupos específicos por rol
- Documentar quién puede acceder a qué
- Mantener emails actualizados

## 🔗 Enlaces Útiles
- [Firebase Console](https://console.firebase.google.com/)
- [Documentación App Distribution](https://firebase.google.com/docs/app-distribution)
- [Flutter Build Documentation](https://docs.flutter.dev/deployment/android)

---
**📝 Nota**: Esta guía fue generada para el proyecto Flutter Curso - UCEVA