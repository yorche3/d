# Data Structures Advanced — D

Implementación de la especificación [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) en **D (DMD)**, gestionado con **DUB** y probado con **unittest** integrado en el lenguaje.

El módulo implementa un árbol binario de búsqueda (`BinaryTree`) y un grafo dirigido (`Graph`) a partir de una clase base común abstracta `Node` para el almacenamiento del valor. Cada hijo (`TreeNode` y `GraphNode`) valida y gestiona sus propios enlaces de forma desacoplada y manual sin colecciones asociativas de biblioteca.

---

## 📂 Archivos y estructura / Files & Structure

Describe la estructura del proyecto y el propósito de cada archivo.

| Archivo / Directory | Propósito / Purpose |
|---|---|
| [`source/data_structures_advanced.d`](source/data_structures_advanced.d) | Código fuente principal: clases `Node`, `TreeNode`, `BinaryTree`, `GraphNode` y `Graph` / Main source code: `Node`, `TreeNode`, `BinaryTree`, `GraphNode`, and `Graph` classes |
| [`test/data_structures_advanced_test.d`](test/data_structures_advanced_test.d) | Pruebas unitarias para `TreeNode`, `BinaryTree` y `Graph` / Unit tests for `TreeNode`, `BinaryTree`, and `Graph` |
| [`dub.sdl`](dub.sdl) | Configuración de construcción del paquete DUB (target `library`) / DUB package build configuration (`library` target) |
| [`.gitignore`](.gitignore) | Archivos generados excluidos del control de versiones / Ignored generated files |

**Estructura del módulo / Module structure:**

```text
data_structures_advanced/
├── dub.sdl
├── .gitignore
├── source/
│   └── data_structures_advanced.d
└── test/
    └── data_structures_advanced_test.d
```

**Nota sobre la estructura / Note about the structure:**

> **ES:** La estructura difiere de la propuesta en la especificación (`src/` y `test/run_tests.ext`). DUB utiliza convencionalmente `source/` como directorio fuente predeterminado y `dub test` orquesta y ejecuta las pruebas de forma nativa sin requerir un script ejecutable auxiliar `run_tests.ext`.
>
> **EN:** The layout differs from the specification's proposed structure (`src/` and `test/run_tests.ext`). DUB conventionally uses `source/` as the default source directory, and `dub test` natively discovers and runs tests without requiring an auxiliary executable script `run_tests.ext`.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se configuró como una biblioteca D declarando `targetType "library"` en `dub.sdl`. La reutilización del valor se realiza por **herencia real** mediante la clase base abstracta `Node`, que únicamente encapsula `_value` sin enlaces ni validaciones. `TreeNode` añade los enlaces mutables `_left` y `_right` validados mediante referencias a clase (`null` para ausencia). `Graph` gestiona un registro propio de vértices encadenados manualmente mediante `GraphNode` (`nextVertex`), y almacena los vecinos ordenados en un slice dinámico `int[]` gestionado manualmente sin delegar en `std.container`, tablas hash ni conjuntos.

**EN:** The project was configured as a D library declaring `targetType "library"` in `dub.sdl`. Value reuse is implemented via **real inheritance** through an abstract base class `Node`, which only encapsulates `_value` with no links or validations. `TreeNode` adds mutable links `_left` and `_right` verified through class references (`null` for absence). `Graph` manages an explicit linked vertex registry through `GraphNode` (`nextVertex`), and stores sorted neighbours in a manually maintained dynamic slice `int[]` without delegating to `std.container`, hash tables, or sets.

---

## 📄 Configuración clave / Key Configuration

### `dub.sdl` — Manifiesto del paquete / Package manifest

**ES:** Declara el nombre del paquete, metadatos y la configuración como biblioteca para evitar que DUB busque un punto de entrada `main`.

**EN:** Declares package name, metadata, and the library target configuration to prevent DUB from expecting a `main` entry point.

```sdl
name "data_structures_advanced"
description "Advanced data structures: binary search tree and directed graph."
authors "yorche3"
copyright "Copyright © 2026, yorche3"
license "proprietary"

targetType "library"
```

---

## 🚀 Compilación y ejecución / Build & Run

```bash
# Compilar como biblioteca / Build as library
dub build

# Verificación estática de tipos y avisos / Static analysis and warnings check
dmd -c -o- -w -wi source/data_structures_advanced.d test/data_structures_advanced_test.d

# Ejecución de la suite de pruebas unitarias / Run unit test suite
dub test
```

**Salida real / Actual output:**

```text
             Generating test runner configuration 'data_structures_advanced-test-library' for 'library' (library).
    Starting Performing "unittest" build using dmd for x86_64.
    Building data_structures_advanced ~master: building configuration [data_structures_advanced-test-library]
     Linking data_structures_advanced-test-library
     Running data_structures_advanced-test-library 
All unit tests have been run successfully.
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.this(value)` | `int → Node` | $O(1)$ | Constructor protegido; inicializa `_value` / Protected constructor; initializes `_value` |
| `Node.value` | `void → int` | $O(1)$ | Getter de propiedad del valor encapsulado / Property getter for encapsulated value |
| `TreeNode.this(value)` | `int → TreeNode` | $O(1)$ | Inicializa enlaces `left` y `right` a `null` / Initializes `left` and `right` links to `null` |
| `TreeNode.left` | `void → TreeNode` | $O(1)$ | Getter de propiedad del hijo izquierdo / Property getter for left child |
| `TreeNode.right` | `void → TreeNode` | $O(1)$ | Getter de propiedad del hijo derecho / Property getter for right child |
| `TreeNode.left(TreeNode)` | `TreeNode → void` | $O(1)$ | Setter de propiedad para mutar hijo izquierdo / Property setter to mutate left child |
| `TreeNode.right(TreeNode)` | `TreeNode → void` | $O(1)$ | Setter de propiedad para mutar hijo derecho / Property setter to mutate right child |
| `BinaryTree.this()` | `void → BinaryTree` | $O(1)$ | Inicializa árbol vacío (`_root = null`, `_count = 0`) / Initializes empty tree (`_root = null`, `_count = 0`) |
| `BinaryTree.insert(value)` | `int → bool` | $O(h)$ | Inserción iterativa siguiendo invariante ABB; duplicados no incrementan tamaño / Iterative insertion maintaining BST invariant; duplicates do not increase size |
| `BinaryTree.contains(value)` | `int → bool` | $O(h)$ | Búsqueda iterativa en ABB; `true` si existe, `false` si ausente / Iterative search in BST; `true` if found, `false` if absent |
| `BinaryTree.isEmpty` | `void → bool` | $O(1)$ | Comprueba `size == 0` / Checks `size == 0` |
| `BinaryTree.size` | `void → size_t` | $O(1)$ | Devuelve cantidad de claves únicas / Returns unique key count |
| `GraphNode.this(label)` | `int → GraphNode` | $O(1)$ | Nodo interno del grafo con etiqueta, vecinos vacíos y enlace canónico / Internal graph node with label, empty neighbours, and canonical link |
| `Graph.this()` | `void → Graph` | $O(1)$ | Inicializa grafo vacío (`_vertices = null`, contadores en 0) / Initializes empty graph (`_vertices = null`, counters at 0) |
| `Graph.addVertex(label)` | `int → bool` | $O(V)$ | Inserta vértice si no existe; idempotente / Inserts vertex if missing; idempotent |
| `Graph.addEdge(u, v)` | `(int, int) → bool` | $O(V + d(u))$ | Verifica existencia de `u` y `v`; inserta `v` ordenado sin duplicados / Verifies existence of `u` and `v`; inserts `v` sorted without duplicates |
| `Graph.hasEdge(u, v)` | `(int, int) → bool` | $O(V + d(u))$ | Busca `u` y recorre adyacencia comprobando existencia de `v` / Locates `u` and scans adjacency checking for `v` |
| `Graph.getNeighbors(u, out neighbors)` | `(int, out int[]) → bool` | $O(V + d(u))$ | Copia defensiva (`dup`) de vecinos ordenados; `false` si `u` no existe / Defensive copy (`dup`) of sorted neighbours; `false` if `u` missing |
| `Graph.isEmpty` | `void → bool` | $O(1)$ | Comprueba `vertexCount == 0` / Checks `vertexCount == 0` |
| `Graph.vertexCount` | `void → size_t` | $O(1)$ | Devuelve total de vértices registrados / Returns total registered vertices |
| `Graph.edgeCount` | `void → size_t` | $O(1)$ | Devuelve total de aristas dirigidas / Returns total directed edges |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Herencia de clase abstracta `Node` para reutilizar valor / Abstract class inheritance `Node` for value reuse | Composición o valor embebido sin clase base / Composition or embedded value without base class | D admite herencia simple limpia de clases con despacho directo en el GC. `abstract class Node` modela fielmente el contrato de base pura sin validaciones ni enlaces propios. / D cleanly supports single class inheritance on the GC heap. `abstract class Node` accurately models the pure base contract without links or validations. |
| Registro de vértices como lista enlazada propia (`GraphNode nextVertex`) / Own linked list vertex registry (`GraphNode nextVertex`) | Tabla hash asociativa (`GraphNode[int]`) o array indexado / Associative hash table (`GraphNode[int]`) or indexed array | Cumple el criterio estricto de implementación manual obligatoria del contrato ($O(V)$ de localización) sin delegar en estructuras hash o tablas de biblioteca estándar. / Adheres strictly to the mandatory manual implementation constraint of the contract ($O(V)$ lookup) without delegating to standard library hash maps or lookup tables. |
| Retorno de vecinos mediante parámetro `out int[]` y retorno `bool` / Neighbour retrieval via `out int[]` parameter and `bool` return | Centinela nulo (`int[]` nulo) o excepción / Null sentinel (`null int[]`) or exception | En D, un slice vacío `[]` y un slice `null` comparten semántica similar. Usar `bool` como retorno distingue de manera no ambigua el fallo (vértice no registrado) de un vértice aislado con vecinos vacíos (`[]`). / In D, an empty slice `[]` and `null` share similar semantics. Returning `bool` unambiguously distinguishes failure (unregistered vertex) from an isolated vertex with empty neighbours (`[]`). |
| Copia defensiva `.dup` en `getNeighbors` / Defensive copy `.dup` in `getNeighbors` | Exponer slice interno directamente / Exposing internal slice directly | Garantiza el aislamiento del resultado ante modificaciones externas de la adyacencia sin mutar el estado del grafo. / Ensures result isolation against external modifications of adjacency without mutating graph internal state. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `Node.init(value)`, `TreeNode.init(value)` | Constructores idiomáticos `this(...)` / Idiomatic class constructors `this(...)` | En D las clases se inicializan mediante constructores `this(...)`. / In D classes are initialized using `this(...)` constructors. |
| `get_value()`, `get_left()`, `set_left(node)`, `is_empty()`, `size()` | Propiedades `@property` y métodos `camelCase` (`value`, `left`, `right`, `isEmpty`, `size`) / `@property` getters/setters and `camelCase` methods | Convención idiomática de nomenclatura y acceso a propiedades en D sin alterar la semántica. / D idiomatic naming and property syntax conventions without altering semantics. |
| Representación de enlaces ausentes / Absent link representation | `null` de D (referencia a objeto nula) / D's `null` (null class reference) | En D, las referencias a clases no asignadas se representan nativamente como `null`, comprobadas mediante `is null` / `!is null`. / In D unassigned class references are natively represented as `null`, checked with `is null` / `!is null`. |
| Caso inmutable en `TreeNode` / Immutable case in `TreeNode` | No aplica (`TreeNode` es una clase mutable con mutación en el lugar) / Not applicable (`TreeNode` is a mutable class with in-place mutation) | El lenguaje y módulo implementan la variante mutable directa; se documenta como caso no aplicable según la especificación. / The language and module implement the direct mutable variant; documented as not applicable per the specification. |
| Ubicación esperada `src/data_structures_advanced.ext` y `test/run_tests.ext` | `source/data_structures_advanced.d` y ejecución directa con `dub test` / `source/data_structures_advanced.d` and direct execution via `dub test` | Convención estándar del gestor DUB en D. / Standard convention of the DUB tool in D. |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `TreeNode.left`, `TreeNode.right` | Enlace ausente / Absent child link | `null` | `(new TreeNode(10)).left is null` |
| `BinaryTree.contains(value)` | Clave no encontrada en el árbol / Value not found in tree | `false` | `(new BinaryTree()).contains(50) == false` |
| `BinaryTree.insert(value)` | No presenta fallo por capacidad / No failure due to capacity exhaustion | `true` | `tree.insert(50) == true` |
| `Graph.addEdge(u, v)` | Vértice origen `u` o destino `v` inexistente / Missing source `u` or target `v` vertex | `false` | `graph.addEdge(10, 99) == false` |
| `Graph.hasEdge(u, v)` | Vértice origen inexistente o arista no presente / Missing source vertex or absent directed edge | `false` | `graph.hasEdge(10, 30) == false` |
| `Graph.getNeighbors(u, out neighbors)` | Vértice `u` inexistente / Missing vertex `u` | `false` | `graph.getNeighbors(99, neighbors) == false` |
| `Node` (base) | Sin operaciones de enlace ni búsqueda / No link or query operations | No aplica / Not applicable | Base abstracta pura de solo valor / Pure abstract value-only base |

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| `TreeNode`: Crear un nodo de árbol / Create a tree node | Sí / Yes | [`test/data_structures_advanced_test.d:94-99`](test/data_structures_advanced_test.d#L94-L99) | `node.value == 10` |
| `TreeNode`: Enlaces iniciales ausentes / Absent initial links | Sí / Yes | [`test/data_structures_advanced_test.d:101-108`](test/data_structures_advanced_test.d#L101-L108) | `node.left is null && node.right is null` |
| `TreeNode`: Enlazar dos hijos / Link two children | Sí / Yes | [`test/data_structures_advanced_test.d:110-117`](test/data_structures_advanced_test.d#L110-L117) | `parent.left.value == 20 && parent.right.value == 30` |
| `TreeNode`: Recorrer cada enlace / Traverse each link | Sí / Yes | [`test/data_structures_advanced_test.d:119-130`](test/data_structures_advanced_test.d#L119-L130) | Navegación a hijos y verificación de hojas con enlaces `null` |
| `TreeNode`: Desenlazar hijos / Unlink children | Sí / Yes | [`test/data_structures_advanced_test.d:132-149`](test/data_structures_advanced_test.d#L132-L149) | Asignar `null` a izquierdo y derecho preservando valor |
| `TreeNode`: Adaptación inmutable (si aplica) / Immutable adaptation (if applicable) | Omitido / Omitted | [`test/data_structures_advanced_test.d:151`](test/data_structures_advanced_test.d#L151) | No aplica: la implementación en D utiliza nodos mutables en el lugar |
| `BinaryTree`: Crear vacío / Create empty | Sí / Yes | [`test/data_structures_advanced_test.d:155-164`](test/data_structures_advanced_test.d#L155-L164) | `isEmpty`, `size == 0`, `contains(50) == false` |
| `BinaryTree`: Insertar la raíz / Insert the root | Sí / Yes | [`test/data_structures_advanced_test.d:166-172`](test/data_structures_advanced_test.d#L166-L172) | Inserta `50`; verifica `size == 1` y pertenencia |
| `BinaryTree`: Insertar menor y mayor / Insert lower and higher | Sí / Yes | [`test/data_structures_advanced_test.d:174-179`](test/data_structures_advanced_test.d#L174-L179) | Inserta `50, 30, 70`; `size == 3` y pertenencia |
| `BinaryTree`: Ramas de varios niveles / Multilevel branches | Sí / Yes | [`test/data_structures_advanced_test.d:181-187`](test/data_structures_advanced_test.d#L181-L187) | Inserta `50, 30, 70, 20, 40`; `size == 5` |
| `BinaryTree`: Valor ausente en árbol no vacío / Missing value in nonempty tree | Sí / Yes | [`test/data_structures_advanced_test.d:189-196`](test/data_structures_advanced_test.d#L189-L196) | `contains(99) == false`, conserva tamaño |
| `BinaryTree`: Duplicado idempotente / Idempotent duplicate | Sí / Yes | [`test/data_structures_advanced_test.d:198-205`](test/data_structures_advanced_test.d#L198-L205) | Reinserta `30`; no duplica ni incrementa tamaño (`size == 3`) |
| `BinaryTree`: Inserciones ordenadas / Ordered insertions | Sí / Yes | [`test/data_structures_advanced_test.d:207-215`](test/data_structures_advanced_test.d#L207-L215) | Inserta `20, 30, 40, 50, 70`; verifica tamaño `5` y no pertenencia de `99` |
| `Graph`: Crear vacío / Create empty | Sí / Yes | [`test/data_structures_advanced_test.d:219-228`](test/data_structures_advanced_test.d#L219-L228) | `isEmpty`, `vertexCount == 0`, `edgeCount == 0`, fallos en arista y vecinos |
| `Graph`: Vértice aislado / Isolated vertex | Sí / Yes | [`test/data_structures_advanced_test.d:230-239`](test/data_structures_advanced_test.d#L230-L239) | `addVertex(10)`; 1 vértice, 0 aristas, vecinos `[]` |
| `Graph`: Etiquetas no consecutivas y arista dirigida / Nonconsecutive labels and directed edge | Sí / Yes | [`test/data_structures_advanced_test.d:241-251`](test/data_structures_advanced_test.d#L241-L251) | Vértices `10, 70`; arista `(10, 70)` presente, `(70, 10)` ausente |
| `Graph`: Vértice duplicado conserva adyacencia / Duplicate vertex preserves adjacency | Sí / Yes | [`test/data_structures_advanced_test.d:253-262`](test/data_structures_advanced_test.d#L253-L262) | Re-registro de vértice existente preserva adyacencia |
| `Graph`: Arista duplicada / Duplicate edge | Sí / Yes | [`test/data_structures_advanced_test.d:264-273`](test/data_structures_advanced_test.d#L264-L273) | Adición duplicada de `(10, 30)` no multiplica contadores |
| `Graph`: Extremo inexistente sin mutación / Missing endpoint without mutation | Sí / Yes | [`test/data_structures_advanced_test.d:275-304`](test/data_structures_advanced_test.d#L275-L304) | Intentos con vértices ausentes fallan y preservan estado intacto |
| `Graph`: Vecinos ordenados y contadores / Sorted neighbours and counts | Sí / Yes | [`test/data_structures_advanced_test.d:306-324`](test/data_structures_advanced_test.d#L306-L324) | Vecinos en orden creciente `[30, 50, 70]` y contadores sincronizados |
| `Graph`: Consulta de arista ausente / Missing-edge query | Sí / Yes | [`test/data_structures_advanced_test.d:326-334`](test/data_structures_advanced_test.d#L326-L334) | Consulta de arista inexistente falla sin alterar estado |
| `Graph`: Vecinos de vértice inexistente / Neighbours of missing vertex | Sí / Yes | [`test/data_structures_advanced_test.d:336-344`](test/data_structures_advanced_test.d#L336-L344) | Consulta de vecinos de `99` falla (`false`), diferenciada de vecinos vacíos |
| `Graph`: Bucle y duplicado / Self-loop and duplicate | Sí / Yes | [`test/data_structures_advanced_test.d:346-358`](test/data_structures_advanced_test.d#L346-L358) | Arista `(10, 10)` permitida e idempotente |
| `Graph`: Aislamiento del resultado de vecinos / Neighbour-result isolation | Sí / Yes | [`test/data_structures_advanced_test.d:360-384`](test/data_structures_advanced_test.d#L360-L384) | Modificación externa sobre copia devuelta no contamina el grafo ni lecturas previas |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Búsqueda lineal $O(V)$ en registro de vértices del grafo / Linear $O(V)$ vertex lookup in graph registry | El coste de localización escala con la cantidad de vértices / Lookup cost scales with vertex count | Decisión obligatoria del contrato para implementar estructuras manuales puras sin colecciones asociativas de biblioteca / Mandatory contract requirement for manual data structure implementation without library associative containers |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** La base abstracta `Node` declara únicamente el campo `_value` accesible mediante la propiedad de lectura `value`. No incluye enlaces a otros nodos ni validaciones de dominio.
- **EN:** The abstract base class `Node` only declares the `_value` field accessible via the `value` read property. It does not include links to other nodes or domain validations.
- **ES:** `TreeNode` hereda de `Node` y añade los punteros de referencia `_left` y `_right`, expuestos mediante setters y getters `@property`. La ausencia de subárbol se modela mediante la referencia nula `null` nativa de D.
- **EN:** `TreeNode` inherits from `Node` and adds reference pointers `_left` and `_right`, exposed through `@property` getters and setters. Subtree absence is modeled using D's native `null` reference.
- **ES:** `BinaryTree` implementa inserción y búsqueda iterativas sin límite de capacidad ni balanceo automático, preservando la invariante del ABB y la cota $O(h)$.
- **EN:** `BinaryTree` implements iterative insertion and lookup without capacity bounds or auto-balancing, preserving the BST invariant and $O(h)$ bound.
- **ES:** `Graph` mantiene un registro enlazado canónico de vértices (`GraphNode nextVertex`). La inserción de aristas ubica la posición ordenada de inserción en el slice dinámico `neighbors` mediante búsqueda lineal $O(d(u))$ y rebanado, evitando el uso de algoritmos de ordenación o estructuras de biblioteca estándar.
- **EN:** `Graph` maintains a canonical linked registry of vertices (`GraphNode nextVertex`). Edge insertion finds the ordered insertion position within the dynamic slice `neighbors` via linear search $O(d(u))$ and slicing, avoiding standard library sorting algorithms or containers.
- **ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.
- **EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

---

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](../../../../docs/core/algorithms/07_Data_Structures_Advanced.md) |
| Primera base del lenguaje / First language reference | [`data_structures_basics`](../data_structures_basics/) |
| Segunda base del lenguaje / Second language reference | [`numbers`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [D Language Documentation](https://dlang.org/spec/spec.html) |

---

*[← Volver a Algoritmos Puros](../README.md) | [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
