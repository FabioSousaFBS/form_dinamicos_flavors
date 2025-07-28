# Forms Flavors - Flutter Project with Multiple Flavors

## 📋 Description

This project demonstrates the implementation of **Flavors** (variants) in Flutter, allowing you to create different versions of the same application with specific configurations for each environment or client. The project includes two flavors: **HarmonErp** and **HarmonECommerce**.

## 🎯 What are Flavors?

**Flavors** (also known as **Build Variants** or **Product Flavors**) are a technique that allows you to create multiple versions of the same application from a single codebase. Each flavor can have:

- **Unique identifiers** (Application ID)
- **Different icons**
- **Specific configurations** (API URLs, keys, etc.)
- **Custom resources** (strings, colors, images)
- **Distinct behaviors**

### Advantages of Flavors:

✅ **Code reuse**: One project for multiple versions  
✅ **Simplified maintenance**: Changes in main code affect all flavors  
✅ **Isolated configurations**: Each flavor can have its own configurations  
✅ **Independent deployment**: Each flavor can be published separately  
✅ **Specific testing**: Tests can be run per flavor  

## 🏗️ Project Architecture

### Flavor Structure

```
lib/
├── main.dart                    # Common entry point
├── flavors.dart                 # Flavor type definitions
├── main_flavors/
│   ├── main_ecommerce.dart      # Entry point for HarmonECommerce
│   └── main_erp.dart           # Entry point for HarmonErp
└── ...
```

### Flavor Configuration

#### 1. Type Definition (`lib/flavors.dart`)

```dart
enum FlavorTypes { hamonerp, harmonecommerce }

class Flavor {
  static late FlavorTypes flavorTypes;
  
  static String get flavorMessage {
    switch (flavorTypes) {
      case FlavorTypes.hamonerp:
        return 'HarmonErp';
      case FlavorTypes.harmonecommerce:
        return 'HarmonECommerce';
      default:
        return 'HarmonErp';
    }   
  }
  
  static bool isEcommerce() => flavorTypes == FlavorTypes.harmonecommerce;
  static bool isErp() => flavorTypes == FlavorTypes.hamonerp;
}
```

#### 2. Specific Entry Points

**HarmonECommerce** (`lib/main_flavors/main_ecommerce.dart`):
```dart
Future<void> main() async {
  GlobalVariables().companyID = "36820";
  Flavor.flavorTypes = FlavorTypes.harmonecommerce;
  main_common.main();
}
```

**HarmonErp** (`lib/main_flavors/main_erp.dart`):
```dart
Future<void> main() async {
  GlobalVariables().companyID = "95320";
  Flavor.flavorTypes = FlavorTypes.hamonerp;
  main_common.main();
}
```

## 🔧 Android Configuration

### Product Flavors (`android/app/build.gradle`)

```gradle
flavorDimensions "app"

productFlavors {
    harmonerp {
        applicationId = "br.com.harmonit.harmonerp"
        dimension "app"
        resValue "string", "app_name", "Harmon ERP"            
    }

    harmonecommerce {
        applicationId = "br.com.harmonit.harmonecommerce"
        dimension "app"
        resValue "string", "app_name", "Harmon e-Commerce"
    }
}
```

### Flavor Characteristics:

| Flavor | Application ID | App Name | Company ID |
|--------|----------------|----------|------------|
| **HarmonErp** | `br.com.harmonit.harmonerp` | Harmon ERP | 95320 |
| **HarmonECommerce** | `br.com.harmonit.harmonecommerce` | Harmon e-Commerce | 36820 |

## 🎨 Custom Icons

Each flavor has its own icon:

### Icon Configuration

**HarmonECommerce** (`flutter_launcher_icons-harmonecommerce.yaml`):
```yaml
flutter_launcher_icons:
  android: true
  ios: true
  remove_alpha_ios: true    
  image_path: "images/flavor1/android_icon.png"
```

**HarmonErp** (`flutter_launcher_icons-harmonerp.yaml`):
```yaml
flutter_launcher_icons:
  android: true
  ios: true
  remove_alpha_ios: true
  image_path: "images/flavor2/alien_icon.png"
```

## 🚀 How to Run

### Prerequisites

- Flutter SDK (version 3.1.0 or higher)
- Android Studio / VS Code
- Android emulator or physical device

### Commands to Run

#### HarmonECommerce
```bash
# Run in debug mode
flutter run --flavor harmonecommerce -t lib/main_flavors/main_ecommerce.dart

# Build APK
flutter build apk --flavor harmonecommerce -t lib/main_flavors/main_ecommerce.dart

# Build App Bundle
flutter build appbundle --flavor harmonecommerce -t lib/main_flavors/main_ecommerce.dart
```

#### HarmonErp
```bash
# Run in debug mode
flutter run --flavor harmonerp -t lib/main_flavors/main_erp.dart

# Build APK
flutter build apk --flavor harmonerp -t lib/main_flavors/main_erp.dart

# Build App Bundle
flutter build appbundle --flavor harmonerp -t lib/main_flavors/main_erp.dart
```

### Generate Icons

```bash
# For HarmonECommerce
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-harmonecommerce.yaml

# For HarmonErp
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-harmonerp.yaml
```

## 📱 App Features

The application demonstrates:

1. **Flavor Identification**: Displays the current flavor name on the main screen
2. **Form**: Form screen with customizable fields
3. **Product List**: Product listing screen
4. **Specific Configurations**: Each flavor has its own `companyID`

## 🔍 Flavor Detection in Code

```dart
// Check which flavor is active
if (Flavor.isEcommerce()) {
  // E-commerce specific logic
} else if (Flavor.isErp()) {
  // ERP specific logic
}

// Get flavor message
String flavorName = Flavor.flavorMessage;
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  dio: ^5.3.2
  retry: ^3.1.1
  sembast: ^3.7.1
  provider: ^6.1.2
  path_provider: ^2.1.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  flutter_launcher_icons: ^0.13.1
```

## 🎯 Common Use Cases

### 1. **Development Environments**
- **Dev**: For development and testing
- **Staging**: For acceptance testing
- **Production**: For production

### 2. **Different Clients**
- **Client A**: With specific configurations
- **Client B**: With specific configurations
- **Demo**: Demo version

### 3. **Application Types**
- **Free**: Free version
- **Premium**: Paid version
- **Enterprise**: Enterprise version

## 🔧 Future Extensions

To add a new flavor:

1. **Add to enum** in `flavors.dart`
2. **Create entry point** in `main_flavors/`
3. **Configure in build.gradle**
4. **Add icons** and specific configurations
5. **Implement specific logic** if necessary

## 📚 Additional Resources

- [Flutter Documentation - Build Modes](https://docs.flutter.dev/deployment/flavors)
- [Android Product Flavors](https://developer.android.com/studio/build/build-variants)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)

## 🤝 Contributing

This project serves as an educational example for implementing flavors in Flutter. Feel free to contribute with improvements or report issues.

---

**Developed with ❤️ using Flutter**

---

# Forms Flavors - Projeto Flutter com Múltiplos Flavors

## 📋 Descrição

Este projeto demonstra a implementação de **Flavors** (variantes) em Flutter, permitindo criar diferentes versões do mesmo aplicativo com configurações específicas para cada ambiente ou cliente. O projeto inclui dois flavors: **HarmonErp** e **HarmonECommerce**.

## 🎯 O que são Flavors?

**Flavors** (também conhecidos como **Build Variants** ou **Product Flavors**) são uma técnica que permite criar múltiplas versões do mesmo aplicativo a partir de um único código base. Cada flavor pode ter:

- **Identificadores únicos** (Application ID)
- **Ícones diferentes**
- **Configurações específicas** (URLs de API, chaves, etc.)
- **Recursos personalizados** (strings, cores, imagens)
- **Comportamentos distintos**

### Vantagens dos Flavors:

✅ **Reutilização de código**: Um único projeto para múltiplas versões  
✅ **Manutenção simplificada**: Mudanças no código principal afetam todos os flavors  
✅ **Configurações isoladas**: Cada flavor pode ter suas próprias configurações  
✅ **Deploy independente**: Cada flavor pode ser publicado separadamente  
✅ **Testes específicos**: Testes podem ser executados por flavor  

## 🏗️ Arquitetura do Projeto

### Estrutura de Flavors

```
lib/
├── main.dart                    # Ponto de entrada comum
├── flavors.dart                 # Definição dos tipos de flavor
├── main_flavors/
│   ├── main_ecommerce.dart      # Entry point para HarmonECommerce
│   └── main_erp.dart           # Entry point para HarmonErp
└── ...
```

### Configuração dos Flavors

#### 1. Definição dos Tipos (`lib/flavors.dart`)

```dart
enum FlavorTypes { hamonerp, harmonecommerce }

class Flavor {
  static late FlavorTypes flavorTypes;
  
  static String get flavorMessage {
    switch (flavorTypes) {
      case FlavorTypes.hamonerp:
        return 'HarmonErp';
      case FlavorTypes.harmonecommerce:
        return 'HarmonECommerce';
      default:
        return 'HarmonErp';
    }   
  }
  
  static bool isEcommerce() => flavorTypes == FlavorTypes.harmonecommerce;
  static bool isErp() => flavorTypes == FlavorTypes.hamonerp;
}
```

#### 2. Entry Points Específicos

**HarmonECommerce** (`lib/main_flavors/main_ecommerce.dart`):
```dart
Future<void> main() async {
  GlobalVariables().companyID = "36820";
  Flavor.flavorTypes = FlavorTypes.harmonecommerce;
  main_common.main();
}
```

**HarmonErp** (`lib/main_flavors/main_erp.dart`):
```dart
Future<void> main() async {
  GlobalVariables().companyID = "95320";
  Flavor.flavorTypes = FlavorTypes.hamonerp;
  main_common.main();
}
```

## 🔧 Configuração Android

### Product Flavors (`android/app/build.gradle`)

```gradle
flavorDimensions "app"

productFlavors {
    harmonerp {
        applicationId = "br.com.harmonit.harmonerp"
        dimension "app"
        resValue "string", "app_name", "Harmon ERP"            
    }

    harmonecommerce {
        applicationId = "br.com.harmonit.harmonecommerce"
        dimension "app"
        resValue "string", "app_name", "Harmon e-Commerce"
    }
}
```

### Características dos Flavors:

| Flavor | Application ID | Nome do App | Company ID |
|--------|----------------|-------------|------------|
| **HarmonErp** | `br.com.harmonit.harmonerp` | Harmon ERP | 95320 |
| **HarmonECommerce** | `br.com.harmonit.harmonecommerce` | Harmon e-Commerce | 36820 |

## 🎨 Ícones Personalizados

Cada flavor possui seu próprio ícone:

### Configuração dos Ícones

**HarmonECommerce** (`flutter_launcher_icons-harmonecommerce.yaml`):
```yaml
flutter_launcher_icons:
  android: true
  ios: true
  remove_alpha_ios: true    
  image_path: "images/flavor1/android_icon.png"
```

**HarmonErp** (`flutter_launcher_icons-harmonerp.yaml`):
```yaml
flutter_launcher_icons:
  android: true
  ios: true
  remove_alpha_ios: true
  image_path: "images/flavor2/alien_icon.png"
```

## 🚀 Como Executar

### Pré-requisitos

- Flutter SDK (versão 3.1.0 ou superior)
- Android Studio / VS Code
- Emulador Android ou dispositivo físico

### Comandos para Executar

#### HarmonECommerce
```bash
# Executar em modo debug
flutter run --flavor harmonecommerce -t lib/main_flavors/main_ecommerce.dart

# Build APK
flutter build apk --flavor harmonecommerce -t lib/main_flavors/main_ecommerce.dart

# Build App Bundle
flutter build appbundle --flavor harmonecommerce -t lib/main_flavors/main_ecommerce.dart
```

#### HarmonErp
```bash
# Executar em modo debug
flutter run --flavor harmonerp -t lib/main_flavors/main_erp.dart

# Build APK
flutter build apk --flavor harmonerp -t lib/main_flavors/main_erp.dart

# Build App Bundle
flutter build appbundle --flavor harmonerp -t lib/main_flavors/main_erp.dart
```

### Gerar Ícones

```bash
# Para HarmonECommerce
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-harmonecommerce.yaml

# Para HarmonErp
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-harmonerp.yaml
```

## 📱 Funcionalidades do App

O aplicativo demonstra:

1. **Identificação do Flavor**: Exibe o nome do flavor atual na tela principal
2. **Formulário**: Tela de formulário com campos personalizáveis
3. **Lista de Produtos**: Tela de listagem de produtos
4. **Configurações Específicas**: Cada flavor tem seu próprio `companyID`

## 🔍 Detecção do Flavor no Código

```dart
// Verificar qual flavor está ativo
if (Flavor.isEcommerce()) {
  // Lógica específica para e-commerce
} else if (Flavor.isErp()) {
  // Lógica específica para ERP
}

// Obter mensagem do flavor
String flavorName = Flavor.flavorMessage;
```

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  dio: ^5.3.2
  retry: ^3.1.1
  sembast: ^3.7.1
  provider: ^6.1.2
  path_provider: ^2.1.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  flutter_launcher_icons: ^0.13.1
```

## 🎯 Casos de Uso Comuns

### 1. **Ambientes de Desenvolvimento**
- **Dev**: Para desenvolvimento e testes
- **Staging**: Para testes de homologação
- **Production**: Para produção

### 2. **Clientes Diferentes**
- **Cliente A**: Com configurações específicas
- **Cliente B**: Com configurações específicas
- **Demo**: Versão de demonstração

### 3. **Tipos de Aplicação**
- **Free**: Versão gratuita
- **Premium**: Versão paga
- **Enterprise**: Versão corporativa

## 🔧 Extensões Futuras

Para adicionar um novo flavor:

1. **Adicionar ao enum** em `flavors.dart`
2. **Criar entry point** em `main_flavors/`
3. **Configurar no build.gradle**
4. **Adicionar ícones** e configurações específicas
5. **Implementar lógica específica** se necessário

## 📚 Recursos Adicionais

- [Flutter Documentation - Build Modes](https://docs.flutter.dev/deployment/flavors)
- [Android Product Flavors](https://developer.android.com/studio/build/build-variants)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)

## 🤝 Contribuição

Este projeto serve como exemplo educacional para implementação de flavors em Flutter. Sinta-se à vontade para contribuir com melhorias ou reportar issues.

---

**Desenvolvido com ❤️ usando Flutter**

