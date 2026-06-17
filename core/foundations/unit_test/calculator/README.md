# Calculator — D

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **D (DMD)**, compilado con **dmd** y probado con **unittest** integrado.

Implementa 5 operaciones aritméticas (`addition`, `substraction`, `multiplication`, `division`, `modulus`) usando únicamente `+` y `-` como operaciones primitivas.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`dub.sdl`](dub.sdl) | Manifiesto del proyecto D. |
| [`source/calculator.d`](source/calculator.d) | Implementación de las 5 operaciones aritméticas. |
| [`test/calculatortests.d`](test/calculatortests.d) | 5 tests con `unittest` integrado de D. |

**Estructura de directorios esperada:**

```text
calculator/
├── dub.sdl                      # Manifiesto del proyecto
├── source/
│   └── calculator.d             # 5 operaciones aritméticas
├── test/
│   └── calculatortests.d        # 5 tests
└── README.md                    # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **D** con `dub.sdl` y el framework de testing integrado `unittest`.

Características:
- **5 operaciones**: `addition`, `substraction`, `multiplication`, `division`, `modulus`.
- **Implementación minimalista**: `multiplication`, `division` y `modulus` se construyen usando solo `+` y `-` como operaciones primitivas.
- **Framework de tests**: `unittest` integrado en D — los tests se ejecutan con `dub test`.

**EN:** This project uses **D** with `dub.sdl` and the built-in `unittest` testing framework.

Features:
- **5 operations**: `addition`, `substraction`, `multiplication`, `division`, `modulus`.
- **Minimalist implementation**: `multiplication`, `division` and `modulus` are built using only `+` and `-` as primitive operations.
- **Test framework**: `unittest` built into D — tests run with `dub test`.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `dub.sdl` — Manifiesto del proyecto

**ES:** Define el nombre del proyecto y los archivos fuente que incluye tanto `source/` como `test/`.

**EN:** Defines the project name and source files including both `source/` and `test/`.

```sdl
name "calculator"
sourceFiles "source/*.d" "test/*.d"
```

### `source/calculator.d` — Implementación

**ES:** Las 5 operaciones como funciones públicas. `multiplication` suma repetidamente, `division` resta repetidamente, y `modulus` usa ambos.

**EN:** The 5 operations as public functions. `multiplication` repeatedly adds, `division` repeatedly subtracts, and `modulus` uses both.

```d
module calculator;

int addition(int a, int b) {
    return a + b;
}

int substraction(int a, int b) {
    return a - b;
}

int multiplication(int a, int b) {
    int result = 0;
    foreach (i; 0..b) {
        result = addition(result, a);
    }
    return result;
}

int division(int a, int b) {
    int quotient = 0;
    while (a >= b) {
        a = substraction(a, b);
        quotient = addition(quotient, 1);
    }
    return quotient;
}

int modulus(int a, int b) {
    int quotient = division(a, b);
    return substraction(a, multiplication(quotient, b));
}
```

### `test/calculatortests.d` — Pruebas

**ES:** 5 bloques `unittest`, cada uno con una aserción. D ejecuta automáticamente todos los bloques `unittest` al compilar con `dub test`.

**EN:** 5 `unittest` blocks, each with one assertion. D automatically runs all `unittest` blocks when compiling with `dub test`.

```d
import calculator;

unittest
{
    assert(addition(3, 2) == 5);
}

unittest
{
    assert(multiplication(4, 3) == 12);
}

// ...
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener DMD y DUB instalados

```bash
brew install dmd dub     # macOS / Linux
```

### Ejecutar pruebas

```bash
cd core/foundations/unit_test/calculator
dub test
```

**Salida esperada / Expected output:**

```text
All unit tests have been run successfully.
```

---

## 🧠 Algoritmos / operaciones

| Operación | Implementación | Primitivas usadas |
|-----------|---------------|-------------------|
| `addition(a, b)` | `a + b` | `+` |
| `substraction(a, b)` | `a - b` | `-` |
| `multiplication(a, b)` | Suma repetitiva de `a`, `b` veces | `+` |
| `division(a, b)` | Resta repetitiva, cuenta cociente | `+`, `-` |
| `modulus(a, b)` | `a - (cociente * b)` | `+`, `-` |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `foreach` en D es equivalente a `for (i in range)`. Se usa para la suma repetitiva en `multiplication`.
- **EN:** `foreach` in D is equivalent to `for (i in range)`. It's used for repeated addition in `multiplication`.
- **ES:** El framework `unittest` de D está integrado en el lenguaje: cualquier bloque `unittest { ... }` se ejecuta al pasar `-unittest` al compilador.
- **EN:** D's `unittest` framework is built into the language: any `unittest { ... }` block runs when passing `-unittest` to the compiler.
- **ES:** `dub test` compila y ejecuta todas las unidades de test automáticamente.
- **EN:** `dub test` compiles and runs all test units automatically.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
