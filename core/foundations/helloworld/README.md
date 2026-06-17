# Hello, World! — D

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **D (DMD)**, compilado con **dmd**.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_world.d`](hello_world.d) | Código fuente: imprime `"Hello World! from D"` en la consola. |

**Estructura de directorios esperada:**

```text
helloworld/
├── hello_world.d     # Código fuente
└── README.md         # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto usa **DMD (Digital Mars D)** y sigue un enfoque minimalista: un único archivo fuente, sin dependencias externas, compilado con `dmd`.

Características:
- **Sin dependencias externas** — solo importa `std.stdio` para `writefln`.
- **Compilación directa** — `dmd -run` compila y ejecuta en un solo paso.
- **Sin sistema de proyectos** — no necesita `dub.json` ni `dub.sdl`.

**EN:** This project uses **DMD (Digital Mars D)** and follows a minimalist approach: a single source file, no external dependencies, compiled with `dmd`.

Features:
- **No external dependencies** — only imports `std.stdio` for `writefln`.
- **Direct compilation** — `dmd -run` compiles and runs in one step.
- **No build system** — no `dub.json` or `dub.sdl` needed.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_world.d`

**ES:** Punto de entrada `main()`. Importa `std.stdio` para `writefln`.

**EN:** Entry point `main()`. Imports `std.stdio` for `writefln`.

```d
import std.stdio;

void main() {
   writefln("Hello World! from D");
}
```

| Elemento | Propósito |
|----------|-----------|
| `import std.stdio;` | Importa el módulo de E/S estándar de D |
| `void main()` | Punto de entrada del programa |
| `writefln(...)` | Imprime una cadena con formato, añadiendo salto de línea |

> **ES:** `writefln` es la función de D para salida con formato, similar a `printf` de C pero con seguridad de tipos. El sufijo `ln` indica que añade un salto de línea al final.
> **EN:** `writefln` is D's formatted output function, similar to C's `printf` but type-safe. The `ln` suffix means it adds a newline at the end.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener DMD instalado

```bash
# Linux / macOS (con Homebrew)
brew install dmd

# Linux (con apt)
sudo apt install dmd-compiler

# Windows
# Descargar desde: https://dlang.org/download.html
```

### Ejecutar

```bash
# Compilar y ejecutar en un paso (recomendado)
cd core/foundations/helloworld
dmd -run hello_world.d

# O compilar a binario y ejecutar
dmd hello_world.d
./hello_world
```

**Salida esperada / Expected output:**

```text
Hello World! from D
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** D es un lenguaje compilado con inferencia de tipos y seguridad de memoria. `dmd -run` abstrae el paso de compilación.
- **EN:** D is a compiled language with type inference and memory safety. `dmd -run` abstracts the compilation step.
- **ES:** No se necesita archivo `dub.json` para scripts simples; solo se requiere cuando hay dependencias externas.
- **EN:** No `dub.json` file is needed for simple scripts; it's only required when there are external dependencies.
- **ES:** `writefln` es la versión con formato de `writeln`; acepta cadenas con placeholders como `%s`, `%d`, etc.
- **EN:** `writefln` is the formatted version of `writeln`; it accepts strings with placeholders like `%s`, `%d`, etc.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
