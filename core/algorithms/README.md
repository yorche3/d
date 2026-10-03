# 🚀 Algorithms Pure — D

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **D (DMD)**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase usan **indicadores de fallo compatibles con el lenguaje** (`null` en arrays/slices, valor retornado) en lugar de excepciones.

---

## 📖 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `dub test` + `dub.sdl` + `unittest` | 3 | ✅ |
| [`data_structures_basics/`](data_structures_basics/) | [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) | `dub test` + `dub.sdl` + `unittest` | 4 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
├── naive_sort/                   # 05_Naive_Sort
│   ├── dub.sdl                   # Manifiesto (targetType "library")
│   ├── source/
│   │   └── naive_sort.d          # selectionSort, bubbleSort, insertionSort
│   ├── test/
│   │   └── naive_sort_test.d     # 3 tests (unittest)
│   ├── .gitignore
│   └── README.md
└── data_structures_basics/       # 06_Data_Structures_Basics
    ├── dub.sdl                   # Manifiesto (targetType "library")
    ├── source/
    │   └── data_structures_basics.d # Node, LinkedList, Stack, Queue
    ├── test/
    │   └── data_structures_basic_test.d # 4 tests (unittest)
    ├── .gitignore
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Compilador** | `dmd` (Digital Mars D) |
| **Gestor de proyectos** | `dub` — manifiesto `dub.sdl` |
| **Target** | `targetType "library"` — evita el `main` por defecto de un ejecutable |
| **Framework de tests** | `unittest` — integrado en D, bloques `unittest { assert(...); }` |
| **Runner** | `dub test` — genera su propio runner de unit tests |
| **Indicador de fallo** | `null` (los arrays de D son *slices* y admiten `null`) |
| **Ordenamiento** | *In-place* sobre el slice recibido |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
dub test

# Data Structures Basics Tests
cd data_structures_basics
dub test
```

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

## ▶️ Siguiente / Next

👉 Continúa con los módulos pendientes de esta fase en el [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).  
👉 Continue with the pending modules of this phase in the [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
