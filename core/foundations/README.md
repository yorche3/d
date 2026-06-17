# 🚀 Foundations — D

Implementaciones de la [Fase 0 — Fundamentos](https://yorche3.github.io/programming_languages/ROADMAP/#fase-0--fundamentos--foundations--completada) en **D (DMD)**: `helloworld`, `hellouser`, `unit_test/calculator` y `numbers`.

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`helloworld/`](helloworld/) | [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | `dmd -run` (archivo único) | — | ✅ |
| [`hellouser/`](hellouser/) | [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | `dmd -run` (archivo único) | — | ✅ |
| [`unit_test/calculator/`](unit_test/calculator/) | [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | `dub test` + `dub.sdl` + `unittest` | 5 | ✅ |
| [`numbers/`](numbers/) | [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | `dub test` + `dub.sdl` + `unittest` | 10 | ✅ |

---

## 📁 Estructura / Structure

```text
foundations/
├── helloworld/                   # 01_Hello_World
│   ├── hello_world.d             # import std.stdio; writefln("Hello World! from D");
│   └── README.md
│
├── hellouser/                    # 02_Hello_User
│   ├── hello_user.d              # write() + readln() + strip()
│   └── README.md
│
├── unit_test/
│   └── calculator/               # 03_Unit_Test_Calculator
│       ├── dub.sdl
│       ├── source/
│       │   └── calculator.d      # 5 operaciones (+, -, *, /, mod)
│       ├── test/
│       │   └── calculatortests.d # 5 tests (unittest)
│       └── README.md
│
└── numbers/                      # 04_Numbers
    ├── dub.sdl
    ├── source/
    │   └── numbers.d             # 15 funciones (3 enfoques × 5 algoritmos)
    ├── test/
    │   ├── numbersrectests.d     # 5 tests recursivos
    │   └── numbersitertests.d    # 5 tests iterativos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Compilador** | `dmd` (Digital Mars D) — compilador nativo |
| **Gestor de proyectos** | `dub` — gestor de paquetes y construcción |
| **Archivos únicos** | `dmd -run <archivo>.d` para programas simples (`helloworld`, `hellouser`) |
| **Proyectos con tests** | `dub test` — compila y ejecuta bloques `unittest` |
| **Manifiesto** | `dub.sdl` — define nombre y archivos fuente del proyecto |
| **Framework de tests** | `unittest` — integrado en D, bloques `unittest { assert(...); }` |
| **Tipado** | Parámetros `int` (entero de 32 bits) |
| **Acumuladores** | Sin tests directos (D no garantiza TCO) |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Hello, World!
cd helloworld
dmd -run hello_world.d

# Hello, User!
cd hellouser
dmd -run hello_user.d

# Calculator Tests
cd unit_test/calculator
dub test

# Numbers Tests
cd numbers
dub test
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Después de fundamentos, continúa con [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).  
👉 After foundations, continue with [Phase 1 — Algorithms Pure](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-).

---

*[← Volver a D](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
