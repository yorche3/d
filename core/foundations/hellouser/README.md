# Hello, User! — D

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **D (DMD)**, compilado con **dmd**.

Lee un nombre desde la entrada estándar y saluda al usuario.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hello_user.d`](hello_user.d) | Código fuente: solicita un nombre al usuario y saluda. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hello_user.d     # Código fuente
└── README.md        # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este programa introduce tres conceptos nuevos respecto a `hello_world`:

1. **Lectura de entrada** — `readln()` lee una línea desde `stdin` en un buffer mutable.
2. **Procesamiento del nombre** — `strip()` de `std.string` elimina espacios y saltos de línea al inicio y final.
3. **Salida sin salto de línea** — `write()` para el prompt (sin `ln`), para que el cursor se quede en la misma línea.

**EN:** This program introduces three new concepts compared to `hello_world`:

1. **Input reading** — `readln()` reads a line from `stdin` into a mutable buffer.
2. **Name processing** — `strip()` from `std.string` removes leading and trailing whitespace/newlines.
3. **Output without newline** — `write()` for the prompt (no `ln`), so the cursor stays on the same line.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `hello_user.d`

**ES:** El flujo del programa es:

1. Imprimir `"Enter your name: "` con `write` (sin salto de línea).
2. Declarar un buffer mutable `char[] name` y leer entrada con `readln`.
3. Limpiar el nombre con `strip` para eliminar el `\n` final y espacios.
4. Imprimir `"Hello, <nombre>!"` con `writeln`.

**EN:** Program flow:

1. Print `"Enter your name: "` with `write` (no newline).
2. Declare a mutable buffer `char[] name` and read input with `readln`.
3. Clean the name with `strip` to remove the trailing `\n` and spaces.
4. Print `"Hello, <name>!"` with `writeln`.

```d
import std.stdio;
import std.string;

void main() {
  write("Enter your name: ");

  char[] name;
  readln(name);
  name = strip(name);

  writeln("Hello, ", name, "!");
}
```

| Elemento | Propósito |
|----------|-----------|
| `import std.string;` | Importa `strip` para limpiar la cadena |
| `write(...)` | Imprime sin salto de línea (ideal para prompts) |
| `char[] name;` | Buffer mutable para almacenar la línea leída |
| `readln(name);` | Lee una línea desde `stdin` al buffer |
| `strip(name)` | Elimina espacios y `\n` al inicio y final de la cadena |
| `writeln("Hello, ", name, "!")` | Imprime múltiples valores con salto de línea final |

> **ES:** `write` y `writeln` son versiones de `writef`/`writefln` sin formato. Aceptan múltiples argumentos separados por comas y los convierten automáticamente a string.
> **EN:** `write` and `writeln` are the unformatted versions of `writef`/`writefln`. They accept multiple comma-separated arguments and auto-convert them to string.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener DMD instalado

```bash
brew install dmd     # macOS / Linux
```

### Ejecutar

```bash
cd core/foundations/hellouser
dmd -run hello_user.d
```

**Salida esperada / Expected output:**

```text
Enter your name: Ada
Hello, Ada!
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `readln` necesita un buffer `char[]` mutable; si se usara `string` (inmutable), no se podría modificar internamente.
- **EN:** `readln` needs a mutable `char[]` buffer; if `string` (immutable) were used, it couldn't be modified internally.
- **ES:** `strip` de `std.string` elimina tanto el `\n` final como espacios extra. Así el saludo no tiene saltos de línea inesperados.
- **EN:** `strip` from `std.string` removes both the trailing `\n` and extra spaces. This ensures the greeting has no unexpected line breaks.
- **ES:** D tiene sobrecarga de funciones: `write`/`writeln` aceptan cualquier número de argumentos tipados seguramente.
- **EN:** D has function overloading: `write`/`writeln` accept any number of type-safe arguments.

---

### 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
