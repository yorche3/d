# Numbers — D

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **D (DMD)**, compilado con **dmd** y probado con **unittest** integrado.

Implementa 5 algoritmos fundamentales (suma de los primeros N naturales, factorial, Fibonacci, MCD, MCM) utilizando tres enfoques: **recursivo directo**, **recursivo con acumulador** e **iterativo**.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo / Directorio | Propósito |
|----------------------|-----------|
| [`dub.sdl`](dub.sdl) | Manifiesto del proyecto D. |
| [`source/numbers.d`](source/numbers.d) | 15 funciones (3 enfoques × 5 algoritmos). |
| [`test/numbersrectests.d`](test/numbersrectests.d) | 5 tests para el enfoque recursivo directo. |
| [`test/numbersitertests.d`](test/numbersitertests.d) | 5 tests para el enfoque iterativo. |

**Estructura de directorios esperada:**

```text
numbers/
├── dub.sdl                      # Manifiesto del proyecto
├── source/
│   └── numbers.d                # 15 funciones (3 enfoques × 5 algoritmos)
├── test/
│   ├── numbersrectests.d        # 5 tests recursivos
│   └── numbersitertests.d       # 5 tests iterativos
└── README.md                    # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **D** con `dub.sdl` y el framework de testing integrado `unittest`.

Cada algoritmo se implementa de tres formas distintas:

1. **Recursivo Directo (`...Rec`)**: Basado directamente en la definición matemática, con llamadas recursivas.
2. **Recursivo con Acumulador (`...Acc`)**: Expone una función limpia que delega en un helper interno con tail recursion.
3. **Iterativo (`...Iter`)**: Utiliza bucles `while` para evitar el crecimiento de la pila.

**EN:** This project uses **D** with `dub.sdl` and the built-in `unittest` testing framework.

Each algorithm is implemented in three different ways:

1. **Direct Recursive (`...Rec`)**: Based directly on the mathematical definition, with recursive calls.
2. **Accumulator Recursive (`...Acc`)**: Exposes a clean function that delegates to an internal helper with tail recursion.
3. **Iterative (`...Iter`)**: Uses `while` loops to avoid stack growth.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `dub.sdl` — Manifiesto del proyecto

**ES:** Define el nombre del proyecto y los archivos fuente.

**EN:** Defines the project name and source files.

```sdl
name "numbers"
sourceFiles "source/*.d" "test/*.d"
```

### `source/numbers.d` — Implementación

**ES:** Las 15 funciones. Cada algoritmo tiene 3 implementaciones con idéntica semántica pero distinto enfoque.

**EN:** The 15 functions. Each algorithm has 3 implementations with identical semantics but different approaches.

```d
module numbers;

// Enfoque recursivo directo
int fibonacciRec(int n) {
    if(n < 2) return n;
    return fibonacciRec(n - 1) + fibonacciRec(n - 2);
}

// Helper con acumulador (tail recursion)
int fibonacciHelp(int n, int acc1, int acc2) {
    if(n < 1) return acc1;
    if(n == 1) return acc2;
    return fibonacciHelp(n - 1, acc2, acc1 + acc2);
}

int fibonacciAcc(int n) {
    return fibonacciHelp(n, 0, 1);
}

// Enfoque iterativo
int fibonacciIter(int n) {
    if(n < 2) return n;
    int acc1 = 0, acc2 = 1;
    while(n > 2) {
        int temp = acc2;
        acc2 += acc1;
        acc1 = temp;
        n--;
    }
    return acc2 + acc1;
}
```

### `test/numbersrectests.d` — Pruebas recursivas

**ES:** 5 bloques `unittest` para el enfoque recursivo, cada uno con aserciones `assert`.

**EN:** 5 `unittest` blocks for the recursive approach, each with `assert` statements.

```d
import numbers;

unittest
{
    assert(fibonacciRec(0) == 0);
    assert(fibonacciRec(1) == 1);
    assert(fibonacciRec(6) == 8);
}
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener DMD y DUB instalados

```bash
brew install dmd dub     # macOS / Linux
```

### Ejecutar pruebas

```bash
cd core/foundations/numbers
dub test
```

**Salida esperada / Expected output:**

```text
All unit tests have been run successfully.
```

---

## 🧠 Algoritmos / operaciones

### 3 enfoques × 5 algoritmos = 15 funciones / 10 tests

| Algoritmo | Casos de prueba | `Rec` | `Acc` | `Iter` |
|-----------|----------------|:-----:|:-----:|:------:|
| `sumFirstN` | `(0) = 0`, `(3) = 6` | ✅ | ✅¹ | ✅ |
| `factorial` | `(0) = 1`, `(4) = 24` | ✅ | ✅¹ | ✅ |
| `fibonacci` | `(0) = 0`, `(1) = 1`, `(6) = 8` | ✅ | ✅¹ | ✅ |
| `largestCommonDivisor` | `(12, 8) = 4`, `(7, 5) = 1` | ✅ | ✅¹ | ✅ |
| `leastCommonMultiple` | `(8, 6) = 24`, `(6, 4) = 12` | ✅ | ✅¹ | ✅ |

> ¹ Los acumuladores se prueban implícitamente al ejecutar `acc(n)`, que internamente llama al helper recursivo. No tienen tests directos porque D no garantiza TCO y son detalles de implementación.
> ¹ Accumulators are implicitly tested when `acc(n)` runs, which internally calls the recursive helper. They have no direct tests because D does not guarantee TCO and they are implementation details.

---

## 📝 Notas de implementación / Implementation Notes

### 🔁 Sobre recursión con acumulador y Tail Call Optimization (TCO) / On recursion with accumulator and Tail Call Optimization (TCO)

**ES:**

*Tail recursion* ocurre cuando la llamada recursiva es la última acción que ejecuta una función; después de la llamada no hay más instrucciones, la función devuelve el resultado de la llamada recursiva. La recursión con acumulador consigue esto pasando el estado previo como parámetro a cada llamada, sin dejar trabajo pendiente en la pila.

**D no garantiza TCO.** DMD compila a código máquina nativo; aunque el backend puede aplicar ciertas optimizaciones, la tail call optimization no es parte de la especificación del lenguaje ni es confiable en todas las plataformas. Por lo tanto, la implementación con acumulador se conserva únicamente con fines educativos: sirve como puente conceptual entre la recursión directa (más cercana a la definición matemática) y la versión iterativa (más eficiente). Como en este contexto no hay un beneficio práctico de rendimiento, no se desarrollan pruebas unitarias específicas para los métodos con acumulador. La validación del comportamiento se cubre a través de las pruebas de los enfoques recursivo e iterativo, que juntos ejercitan los mismos resultados.

**EN:**

*Tail recursion* occurs when the recursive call is the last action that runs a function; after the call there are no more instructions, the function returns the result of the recursive call. Recursion with accumulator achieves this by passing the previous state as a parameter to each call, without leaving any pending work on the stack.

**D does not guarantee TCO.** DMD compiles to native machine code; although the backend may apply certain optimizations, tail call optimization is not part of the language specification nor is it reliable across all platforms. Therefore, the accumulator implementation is preserved only for educational purposes: it serves as a conceptual bridge between the direct recursive (closer to mathematical definition) and the iterative version (more efficient). Since there is no practical performance benefit in this context, no specific unit tests are developed for the accumulator methods. Behavior validation is covered through the recursive and iterative test suites, which together exercise the same results.

### Sobre la implementación / On the implementation

- **ES:** Todos los parámetros y retornos son `int` (entero de 32 bits).
- **EN:** All parameters and return values are `int` (32-bit integer).
- **ES:** D usa `unittest` como framework de testing integrado. Los bloques `unittest { ... }` se ejecutan con `dub test` o compilando con `-unittest`.
- **EN:** D uses `unittest` as its built-in testing framework. `unittest { ... }` blocks run with `dub test` or by compiling with `-unittest`.
- **ES:** `foreach` y `while` son los mecanismos de iteración estándar de D.
- **EN:** `foreach` and `while` are D's standard iteration mechanisms.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
