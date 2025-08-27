# Projeto Dev Mobile UNIRV

## 📱 Descrição
Este é um projeto desenvolvido para a disciplina de Desenvolvimento Mobile da Universidade de Rio Verde (UNIRV). O projeto implementa uma aplicação Flutter com **BottomNavigationBar** e **TabBar aninhada** conforme os requisitos do módulo 2.

## 🏗️ Arquitetura do Projeto

### Estrutura de Pastas
```
lib/
├── core/                          # Componentes centrais
│   ├── navigation/               # Sistema de navegação
│   │   └── bottom_navigation.dart
│   └── widgets/                  # Widgets compartilhados
│       └── app_bar_custom.dart
├── modules/                      # Módulos organizados
│   ├── modulo1/                 # Atividades Básicas
│   │   ├── modulo1_screen.dart
│   │   └── atividade02-08.dart
│   ├── modulo2/                 # Atividades Intermediárias (com TabBar)
│   │   ├── modulo2_screen.dart
│   │   ├── atividade09-08.dart
│   │   └── widgets/
│   │       ├── formularios_tab.dart
│   │       ├── layouts_tab.dart
│   │       └── navigation_tab.dart
│   └── modulo3/                 # Atividades Avançadas
│       ├── modulo3_screen.dart
│       └── atividade-mododark.dart
├── shared/                      # Componentes compartilhados
│   └── widgets/
├── main.dart                    # Ponto de entrada principal
└── [atividades antigas...]      # Atividades originais mantidas
```

## 🎯 Características Principais

### ✅ BottomNavigationBar
- **3 módulos** organizados hierarquicamente
- **Navegação fluida** entre diferentes seções
- **Design responsivo** com cores temáticas por módulo
- **Ícones adaptativos** que mudam conforme seleção

### ✅ TabBar Aninhada (Módulo 2)
- **TabBar subordinada** à BottomNavigationBar
- **3 abas especializadas**: Formulários, Layouts, Navegação
- **Conteúdo específico** para cada aba
- **Preservação do estado** durante navegação

### ✅ Splash Screen Animado
- **Animações suaves** de entrada
- **Transição elegante** para a tela principal
- **Branding** da universidade

## 📋 Módulos Disponíveis

### 🟢 Módulo 1 - Atividades Básicas
- **Validação de Chamada**: Sistema de login/logout
- **Formulário Validação**: Validação de idade e dados
- **Widget Bem-Vindo**: Tela de boas-vindas
- **Alterar Background**: Mudança dinâmica de cores

### 🔵 Módulo 2 - Atividades Intermediárias ⭐ (Principal)
#### 📋 Aba Formulários
- **Carrossel de Formulários**: Múltiplos formulários horizontais
- Demonstrações de validação complexa

#### 🎨 Aba Layouts
- **Grid Layout**: Demonstração de GridView
- **Flex Layout**: Exemplo de Flexible e Expanded
- **Stack Layout**: Sobreposição de widgets
- **Wrap Layout**: Layout adaptativo

#### 🧭 Aba Navegação
- **Drawer Navigation**: Menu lateral
- **Tab Navigation**: Exemplo de TabBar (atual)
- **Modal Navigation**: Bottom sheets e diálogos
- **Nested Routes**: Rotas aninhadas (demonstração)

### 🟣 Módulo 3 - Atividades Avançadas
- **Modo Dark/Light**: Alternância de temas
- **State Management**: Provider/Bloc (em desenvolvimento)
- **API Integration**: REST/GraphQL (em desenvolvimento)
- **Local Database**: SQLite/Hive (em desenvolvimento)
- **Animations**: Animações customizadas (em desenvolvimento)
- **Push Notifications**: Notificações (em desenvolvimento)

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (≥ 3.8.1)
- Dart SDK
- Android Studio / VS Code
- Emulador Android/iOS ou Chrome

### Instalação
```bash
# 1. Clone o repositório
git clone [URL_DO_REPOSITORIO]

# 2. Navegue para o diretório
cd projetodevmobileunirv

# 3. Obtenha as dependências
flutter pub get

# 4. Execute o projeto
flutter run
```

### Executar na Web (Recomendado para demonstração)
```bash
# Para executar no Chrome
flutter run -d chrome

# Para visão mobile no navegador
# Após executar, pressione F12 e selecione a visualização mobile
```

### Executar no Emulador Android/iOS
```bash
# Listar dispositivos disponíveis
flutter devices

# Executar em dispositivo específico
flutter run -d [DEVICE_ID]
```

## 🎨 Design e UX

### Paleta de Cores
- **Módulo 1**: Verde (básico/iniciante)
- **Módulo 2**: Azul (intermediário/principal)
- **Módulo 3**: Roxo (avançado/expert)

### Características de UX
- **Material Design 3** seguindo guidelines do Google
- **Animações fluidas** entre transições
- **Feedback visual** claro para interações
- **Layout responsivo** para diferentes tamanhos de tela
- **Tipografia consistente** e hierárquica

## 📱 Demonstração

### BottomNavigationBar
A navegação principal permite alternar entre os 3 módulos, mantendo o estado de cada um e preservando a posição de scroll.

### TabBar Aninhada (Destaque do Projeto)
No **Módulo 2**, implementamos uma **TabBar aninhada** que demonstra:
- ✅ BottomNavigationBar **permanece visível**
- ✅ TabBar fornece **navegação secundária**
- ✅ Conteúdo específico para cada aba
- ✅ **Estado preservado** durante navegação

## 🛠️ Tecnologias Utilizadas
- **Flutter** 3.8.1+
- **Dart** 
- **Material Design 3**
- **Android/iOS/Web** support

## 📝 Requisitos Atendidos
- ✅ **BottomNavigationBar** implementada
- ✅ **TabBar aninhada** no módulo 2
- ✅ **Múltiplas atividades** organizadas e acessíveis
- ✅ **Navegação funcional** entre todas as telas
- ✅ **Estrutura escalável** para futuras atividades

## 🎥 Material de Entrega
- **Repositório Git**: Código fonte completo
- **APK Debug**: Para teste em dispositivos Android
- **Web Demo**: Executável no navegador (F12 para visão mobile)
- **GIF/Vídeo**: Demonstração da navegação funcionando

## 👨‍💻 Desenvolvimento
Projeto desenvolvido seguindo boas práticas de:
- **Clean Architecture**
- **Separação de responsabilidades**
- **Reutilização de componentes**
- **Documentação clara**

---

### 📌 Notas Importantes
- O projeto mantém as **atividades originais** intactas
- A **navegação aninhada** é o foco principal do módulo 2
- Futuras atividades podem ser facilmente **adicionadas** à estrutura modular
- O design é **responsivo** e funciona em diferentes dispositivos

**UNIRV - Universidade de Rio Verde**  
**Desenvolvimento Mobile - 2024**