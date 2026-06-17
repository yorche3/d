# D (DMD)

Proyectos en **D**, compilados con **DMD** (Digital Mars D) y gestionados con **DUB**.

Usa `dub.sdl` como manifiesto de proyecto y **unittest** (integrado en el lenguaje) como framework de pruebas.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
|--------|-------------|
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `calculator`, `numbers` |

---

### ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld
dmd -run hello_world.d

# Hello, User!
cd core/foundations/hellouser
dmd -run hello_user.d

# Calculator Tests
cd core/foundations/unit_test/calculator
dub test

# Numbers Tests
cd core/foundations/numbers
dub test
```

---

## 📦 Requisitos / Requirements

| Herramienta | Instalación |
|-------------|-------------|
| [DMD](https://dlang.org/download.html) (compilador) | `brew install dmd` (macOS) / `sudo apt install dmd-compiler` (Ubuntu) |
| [DUB](https://dub.pm/) (gestor de proyectos) | `brew install dub` (macOS) / incluido con DMD en Windows |

```bash
# Verificar instalación
dmd --version
dub --version
```

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Script simple (archivo único)

**ES:** Un único archivo fuente `.d`, sin dependencias externas, ejecutado directamente con `dmd -run`. Ideal para `helloworld` y `hellouser`.

**EN:** A single `.d` source file, no external dependencies, executed directly with `dmd -run`. Ideal for `helloworld` and `hellouser`.

```bash
dmd -run <archivo>.d
```

### 2. Proyecto DUB + tests (unittest)

**ES:** Para proyectos que requieren pruebas unitarias, se utiliza `dub.sdl` como manifiesto y el framework **unittest** integrado en D. Los tests se colocan en bloques `unittest { ... }` y se ejecutan con `dub test`.

**EN:** For projects requiring unit tests, `dub.sdl` is used as the manifest and the built-in **unittest** framework handles testing. Tests are placed in `unittest { ... }` blocks and run with `dub test`.

```bash
dub test
```

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*