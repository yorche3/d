# Data Structures Basics — D

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) en **D (DMD)**, gestionado con **DUB** y probado con **unittest** integrado en el lenguaje.

El módulo implementa las estructuras enlazadas fundamentales desde cero: la celda enlazada `Node`, la lista enlazada `LinkedList`, la pila `Stack` y la cola `Queue`, compartiendo el mismo tipo de celda sin delegación cruzada y utilizando `-1` como indicador de fallo para operaciones enteras sobre estructuras vacías o elementos ausentes.

---

## 📂 Archivos y estructura / Files & Structure

Describe la estructura del proyecto y el propósito de cada archivo.

| Archivo / Directory | Propósito / Purpose |
|---|---|
| [`source/data_structures_basics.d`](source/data_structures_basics.d) | Código fuente principal: clases `Node`, `LinkedList`, `Stack` y `Queue` / Main source code: `Node`, `LinkedList`, `Stack`, and `Queue` classes |
| [`test/data_structures_basic_test.d`](test/data_structures_basic_test.d) | Pruebas unitarias para las cuatro estructuras / Unit tests for all four structures |
| [`dub.sdl`](dub.sdl) | Configuración de construcción del paquete DUB (target `library`) / DUB package build configuration (`library` target) |
| [`.gitignore`](.gitignore) | Archivos generados excluidos del control de versiones / Ignored generated files |

**Estructura del módulo / Module structure:**

```text
data_structures_basics/
├── dub.sdl
├── .gitignore
├── source/
│   └── data_structures_basics.d
└── test/
    └── data_structures_basic_test.d
```

**Nota sobre la estructura / Note about the structure:**

> **ES:** La estructura difiere de la propuesta en la especificación (`src/` y `test/run_tests.ext`). DUB utiliza convencionalmente `source/` como directorio fuente y `dub test` orquesta y ejecuta las pruebas de forma nativa sin requerir un script ejecutable auxiliar `run_tests.ext`.
>
> **EN:** The layout differs from the specification's proposed structure (`src/` and `test/run_tests.ext`). DUB conventionally uses `source/` as the default source directory, and `dub test` natively discovers and runs tests without requiring an auxiliary executable script `run_tests.ext`.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se configuró como una biblioteca D declarando `targetType "library"` en `dub.sdl`. Cada estructura (`Node`, `LinkedList`, `Stack`, `Queue`) se implementa como una clase de D con encapsulación de campos privados y propiedades (`@property`). Todas las estructuras enlazadas comparten directamente instancias de la clase `Node` como celda elemental, manteniendo sus propios punteros independientes (`_head`/`_tail`, `_top`, `_front`/`_rear`) sin delegar `Stack` ni `Queue` en `LinkedList` ni en estructuras de la biblioteca estándar de D (`std.container`).

**EN:** The project was configured as a D library declaring `targetType "library"` in `dub.sdl`. Each data structure (`Node`, `LinkedList`, `Stack`, `Queue`) is implemented as a D class with private field encapsulation and properties (`@property`). All linked structures share instances of the `Node` class directly as their fundamental cell, managing their own independent pointers (`_head`/`_tail`, `_top`, `_front`/`_rear`) without delegating `Stack` or `Queue` to `LinkedList` or D standard library containers (`std.container`).

---

## 📄 Configuración clave / Key Configuration

### `dub.sdl` — Manifiesto del paquete / Package manifest

**ES:** Declara el nombre del paquete, metadatos y la configuración como biblioteca para evitar que DUB busque un punto de entrada `main`.

**EN:** Declares package name, metadata, and the library target configuration to prevent DUB from expecting a `main` entry point.

```sdl
name "data_structures_basics"
description "Basic linked data structures."
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
dmd -c -o- -w -wi source/data_structures_basics.d test/data_structures_basic_test.d

# Ejecución de la suite de pruebas unitarias / Run unit test suite
dub test
```

**Salida real / Actual output:**

```text
             Generating test runner configuration 'data_structures_basics-test-library' for 'library' (library).
    Starting Performing "unittest" build using ~/dlang/dmd-2.112.0/linux/bin64/dmd for x86_64.
  Up-to-date data_structures_basics ~master: target for configuration [data_structures_basics-test-library] is up to date.
    Finished To force a rebuild of up-to-date targets, run again with --force
     Running data_structures_basics-test-library 
All unit tests have been run successfully.
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.this(value)` | `int → Node` | $O(1)$ | Constructor; inicializa `value` y deja `next` como `null` / Constructor; initializes `value` and leaves `next` as `null` |
| `Node.value` | `void → int` | $O(1)$ | Getter de propiedad del valor / Property getter for value |
| `Node.next` | `void → Node` | $O(1)$ | Getter de propiedad del enlace siguiente / Property getter for next link |
| `Node.next(Node)` | `Node → void` | $O(1)$ | Setter de propiedad para enlazar nodo / Property setter to link node |
| `LinkedList.this()` | `void → LinkedList` | $O(1)$ | Constructor; inicializa cabeza y cola nulas, `count = 0` / Constructor; initializes null head and tail, `count = 0` |
| `LinkedList.isEmpty` | `void → bool` | $O(1)$ | Propiedad que verifica `size == 0` / Property checking `size == 0` |
| `LinkedList.size` | `void → size_t` | $O(1)$ | Propiedad que devuelve el número de nodos / Property returning node count |
| `LinkedList.headValue` | `void → int` | $O(1)$ | Devuelve el valor de la cabeza o `-1` si está vacía / Returns head value or `-1` if empty |
| `LinkedList.insertHead(value)` | `int → void` | $O(1)$ | Inserta un nuevo nodo al inicio / Inserts a new node at the front |
| `LinkedList.insertTail(value)` | `int → void` | $O(1)$ | Inserta un nuevo nodo al final usando `_tail` / Inserts a new node at the end using `_tail` |
| `LinkedList.deleteValue(value)` | `int → bool` | $O(n)$ | Elimina la primera aparición del valor; `true` si éxito, `false` si ausente / Deletes first occurrence; `true` on success, `false` if absent |
| `Stack.this()` | `void → Stack` | $O(1)$ | Constructor; inicializa tope nulo, `count = 0` / Constructor; initializes null top, `count = 0` |
| `Stack.isEmpty` | `void → bool` | $O(1)$ | Propiedad que verifica `size == 0` / Property checking `size == 0` |
| `Stack.size` | `void → size_t` | $O(1)$ | Propiedad que devuelve el número de elementos / Property returning item count |
| `Stack.push(value)` | `int → void` | $O(1)$ | Inserta un elemento en el tope de la pila / Pushes item to top of stack |
| `Stack.peek()` | `void → int` | $O(1)$ | Observa el tope sin mutar; `-1` si está vacía / Inspects top without mutating; `-1` if empty |
| `Stack.pop()` | `void → int` | $O(1)$ | Extrae y devuelve el tope; `-1` si está vacía / Pops and returns top; `-1` if empty |
| `Queue.this()` | `void → Queue` | $O(1)$ | Constructor; inicializa frente y cola nulos, `count = 0` / Constructor; initializes null front and rear, `count = 0` |
| `Queue.isEmpty` | `void → bool` | $O(1)$ | Propiedad que verifica `size == 0` / Property checking `size == 0` |
| `Queue.size` | `void → size_t` | $O(1)$ | Propiedad que devuelve el número de elementos / Property returning item count |
| `Queue.enqueue(value)` | `int → void` | $O(1)$ | Inserta elemento al final de la cola / Enqueues item at rear of queue |
| `Queue.peek()` | `void → int` | $O(1)$ | Observa el frente sin mutar; `-1` si está vacía / Inspects front without mutating; `-1` if empty |
| `Queue.dequeue()` | `void → int` | $O(1)$ | Extrae y devuelve el elemento del frente; `-1` si está vacía / Dequeues and returns front item; `-1` if empty |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Clases por referencia (`class`) para los ADTs y `Node` / Reference classes (`class`) for ADTs and `Node` | Estructuras por valor (`struct`) con punteros explícitos / Value structures (`struct`) with explicit raw pointers | En D las clases son tipos de referencia gestionados en el heap por el recolector de basura (GC). Permite referencias seguras entre nodos (`Node _next`) y referencias a instancias mutables de lista/pila/cola sin manipulación manual de memoria o punteros crudos. / In D, classes are reference types allocated on the GC heap. This allows clean, safe references between nodes (`Node _next`) and mutable structure instances without raw pointer gymnastics. |
| Propiedades idiomáticas `@property` para getters y setters / Idiomatic `@property` for getters and setters | Métodos explícitos `get_value()`, `set_next()`, etc. / Explicit methods `get_value()`, `set_next()`, etc. | Respeta las convenciones idiomáticas de D donde el acceso a miembros encapsulados se expresa como propiedades de sintaxis limpia (`node.value`, `node.next = other`, `list.isEmpty`). / Adheres to D idiomatic guidelines where encapsulated state is accessed with clean property syntax (`node.value`, `node.next = other`, `list.isEmpty`). |
| Retorno booleano en `deleteValue` (`bool`) / Boolean return in `deleteValue` (`bool`) | Retorno entero centinela o tipo Result / Integer sentinel or Result type | Expresa de manera inequívoca y directa el éxito (`true`) o fallo (`false`) de la eliminación según el contrato sin introducir tipos complejos prematuros. / Clearly expresses deletion success (`true`) or failure (`false`) per the contract without premature complex wrapper types. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `Node.init(value)`, `LinkedList.init()`, `Stack.init()`, `Queue.init()` | Constructores de clase `this(...)` y `this()` / Class constructors `this(...)` and `this()` | En D, la inicialización idiomática de tipos de clase se realiza mediante constructores `this(...)`. |
| `get_value()`, `get_next()`, `set_next(next)`, `is_empty()`, `size()`, `get_head()` | Propiedades `@property value`, `@property next`, `@property isEmpty`, `@property size`, `@property headValue` | Convención de nombres `camelCase` y propiedades en D para accesos de consulta sin efectos secundarios. |
| Ausencia de enlace nativa / Native link absence | `null` de D (referencia a clase nula) / D's `null` (null class reference) | En D, las referencias a clases no asignadas se representan nativamente mediante `null`, verificado con `is null` / `!is null`. |
| Ubicación esperada `src/data_structures_basics.ext` y `test/run_tests.ext` | `source/data_structures_basics.d` y ejecución directa con `dub test` / `source/data_structures_basics.d` and direct execution via `dub test` | Convención estándar del gestor DUB en D. |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `LinkedList.headValue` | Lista enlazada vacía (`isEmpty == true`) / Empty linked list (`isEmpty == true`) | `-1` (`FAILURE_VALUE`) | `(new LinkedList()).headValue == -1` |
| `LinkedList.deleteValue(value)` | Valor no encontrado en la lista / Value not found in list | `false` | `(new LinkedList()).deleteValue(99) == false` |
| `Stack.peek()` | Pila vacía (`isEmpty == true`) / Empty stack (`isEmpty == true`) | `-1` (`FAILURE_VALUE`) | `(new Stack()).peek() == -1` |
| `Stack.pop()` | Pila vacía (`isEmpty == true`) / Empty stack (`isEmpty == true`) | `-1` (`FAILURE_VALUE`) | `(new Stack()).pop() == -1` |
| `Queue.peek()` | Cola vacía (`isEmpty == true`) / Empty queue (`isEmpty == true`) | `-1` (`FAILURE_VALUE`) | `(new Queue()).peek() == -1` |
| `Queue.dequeue()` | Cola vacía (`isEmpty == true`) / Empty queue (`isEmpty == true`) | `-1` (`FAILURE_VALUE`) | `(new Queue()).dequeue() == -1` |
| `Node.next` | Enlace siguiente ausente / Absent next link | `null` | `(new Node(10)).next is null` |

---

## ✅ Cobertura de pruebas / Test coverage

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| `Node`: Inicializar y observar valor/enlace / Initialize and observe value/link | Sí / Yes | [`test/data_structures_basic_test.d:33-41`](test/data_structures_basic_test.d#L33-L41) (`assertNodeCases`) | Comprueba preservación de valor y `next is null` / Verifies value preservation and `next is null` |
| `Node`: Inicializar otro nodo, enlazar y recorrer / Initialize another node, link and traverse | Sí / Yes | [`test/data_structures_basic_test.d:42-49`](test/data_structures_basic_test.d#L42-L49) (`assertNodeCases`) | Enlaza segundo nodo y recorre a través de `next` / Links second node and traverses via `next` |
| `LinkedList`: Estado vacío / Empty state | Sí / Yes | [`test/data_structures_basic_test.d:53-61`](test/data_structures_basic_test.d#L53-L61) (`assertLinkedListCases`) | Comprueba `isEmpty`, `size == 0` y `headValue == -1` / Verifies `isEmpty`, `size == 0`, and `headValue == -1` |
| `LinkedList`: Insertar por ambos extremos / Insert at both ends | Sí / Yes | [`test/data_structures_basic_test.d:62-71`](test/data_structures_basic_test.d#L62-L71) (`assertLinkedListCases`) | Inserta `10`, `20` en cola, `5` en cabeza, `10` en cola; verifica `size == 4` y cabeza `5` / Inserts `10`, `20` at tail, `5` at head, `10` at tail; verifies `size == 4` and head `5` |
| `LinkedList`: Eliminar primera aparición / Delete first occurrence | Sí / Yes | [`test/data_structures_basic_test.d:72-78`](test/data_structures_basic_test.d#L72-L78) (`assertLinkedListCases`) | Elimina primer `10`; verifica éxito, cabeza y decremento de tamaño / Deletes first `10`; verifies success, head, and size decrease |
| `LinkedList`: Valor ausente / Absent value | Sí / Yes | [`test/data_structures_basic_test.d:79-85`](test/data_structures_basic_test.d#L79-L85) (`assertLinkedListCases`) | Intenta eliminar `99`; verifica `false` y preservación de tamaño y cabeza / Attempts deleting `99`; verifies `false`, preserving size and head |
| `LinkedList`: Vaciar / Empty the list | Sí / Yes | [`test/data_structures_basic_test.d:86-98`](test/data_structures_basic_test.d#L86-L98) (`assertLinkedListCases`) | Elimina `5`, `20`, `10`; comprueba `isEmpty`, `size == 0` y `headValue == -1` / Deletes `5`, `20`, `10`; verifies `isEmpty`, `size == 0`, and `headValue == -1` |
| `Stack`: Estado vacío y extracción fallida / Empty state and failed removal | Sí / Yes | [`test/data_structures_basic_test.d:102-112`](test/data_structures_basic_test.d#L102-L112) (`assertStackCases`) | Comprueba `isEmpty`, `size == 0`, `peek == -1` y `pop == -1` / Verifies `isEmpty`, `size == 0`, `peek == -1`, and `pop == -1` |
| `Stack`: LIFO y `peek` no mutante / LIFO and non-mutating `peek` | Sí / Yes | [`test/data_structures_basic_test.d:113-121`](test/data_structures_basic_test.d#L113-L121) (`assertStackCases`) | Apila `10`, `20`, `30`; verifica `peek == 30` y `size == 3` / Pushes `10`, `20`, `30`; verifies `peek == 30` and `size == 3` |
| `Stack`: Extracción y reutilización / Removal and reuse | Sí / Yes | [`test/data_structures_basic_test.d:122-135`](test/data_structures_basic_test.d#L122-L135) (`assertStackCases`) | `pop == 30`, `push(40)`, tres `pop` (`40, 20, 10`); comprueba vacío / `pop == 30`, `push(40)`, three pops (`40, 20, 10`); verifies empty |
| `Stack`: Vacío tras extracción / Empty after removal | Sí / Yes | [`test/data_structures_basic_test.d:136-140`](test/data_structures_basic_test.d#L136-L140) (`assertStackCases`) | `pop` sobre vacía devuelve `-1` y mantiene `isEmpty` / `pop` on empty returns `-1` and keeps `isEmpty` |
| `Queue`: Estado vacío y extracción fallida / Empty state and failed removal | Sí / Yes | [`test/data_structures_basic_test.d:144-154`](test/data_structures_basic_test.d#L144-L154) (`assertQueueCases`) | Comprueba `isEmpty`, `size == 0`, `peek == -1` y `dequeue == -1` / Verifies `isEmpty`, `size == 0`, `peek == -1`, and `dequeue == -1` |
| `Queue`: FIFO y `peek` no mutante / FIFO and non-mutating `peek` | Sí / Yes | [`test/data_structures_basic_test.d:155-163`](test/data_structures_basic_test.d#L155-L163) (`assertQueueCases`) | Encola `10`, `20`, `30`; verifica `peek == 10` y `size == 3` / Enqueues `10`, `20`, `30`; verifies `peek == 10` and `size == 3` |
| `Queue`: Extracción y reutilización / Removal and reuse | Sí / Yes | [`test/data_structures_basic_test.d:164-177`](test/data_structures_basic_test.d#L164-L177) (`assertQueueCases`) | `dequeue == 10`, `enqueue(40)`, tres `dequeue` (`20, 30, 40`); comprueba vacío / `dequeue == 10`, `enqueue(40)`, three dequeues (`20, 30, 40`); verifies empty |
| `Queue`: Vacío tras extracción / Empty after removal | Sí / Yes | [`test/data_structures_basic_test.d:178-182`](test/data_structures_basic_test.d#L178-L182) (`assertQueueCases`) | `dequeue` sobre vacía devuelve `-1` y mantiene `isEmpty` / `dequeue` on empty returns `-1` and keeps `isEmpty` |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Dominio de valores limitado a enteros no negativos para operaciones de lectura / Values limited to non-negative integers for retrieval operations | El valor centinela `-1` se utiliza como indicador de estructura vacía en `headValue`, `peek()` y `pop()`/`dequeue()` / Sentinel value `-1` is used as empty structure indicator in `headValue`, `peek()`, and `pop()`/`dequeue()` | Conforme a la política de resultados de la Fase 1, se evitan excepciones y envoltorios opcionales; en fases posteriores se abordan tipos algebraicos `Option`/`Result` / As per Phase 1 result policy, exceptions and optional wrappers are avoided; subsequent phases introduce `Option`/`Result` algebraic types |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** La celda `Node` se define como clase con campos privados `_value` y `_next`. Las referencias entre nodos utilizan la semántica natural de punteros a clases de D, donde la ausencia de nodo es `null`.
- **EN:** The `Node` cell is defined as a class with private fields `_value` and `_next`. Inter-node links use D's natural class reference semantics, where an absent node link is represented as `null`.
- **ES:** `LinkedList`, `Stack` y `Queue` son estructuras independientes y autónomas. Ni `Stack` ni `Queue` encapsulan o delegan operaciones sobre `LinkedList`. Ambas estructuras gestionan directamente sus propios punteros hacia instancias `Node` (`_top` para `Stack`; `_front` y `_rear` para `Queue`).
- **EN:** `LinkedList`, `Stack`, and `Queue` are independent and self-contained structures. Neither `Stack` nor `Queue` wraps or delegates operations to `LinkedList`. Both structures directly manage their own pointers to `Node` instances (`_top` for `Stack`; `_front` and `_rear` for `Queue`).
- **ES:** Las pruebas se implementan mediante 4 bloques `unittest` en D, organizados en funciones auxiliares de aserción (`assertNodeCases`, `assertLinkedListCases`, `assertStackCases`, `assertQueueCases`) que validan la preservación del estado sucesivo exigida por la especificación.
- **EN:** Tests are implemented via 4 `unittest` blocks in D, structured into assertion helpers (`assertNodeCases`, `assertLinkedListCases`, `assertStackCases`, `assertQueueCases`) verifying the sequential state transitions required by the specification.
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
| Especificación / Specification | [`06_Data_Structures_Basics.md`](../../../../docs/core/algorithms/06_Data_Structures_Basics.md) |
| Módulo homologado del lenguaje / Homologated module | [`d/core/foundations/numbers/`](../../foundations/numbers/) |
| Guía de inicialización / Initialisation guide | [`00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [D Language Documentation](https://dlang.org/spec/spec.html) |

---

*[← Volver a Algoritmos Puros](../README.md) | [↑ Volver a Core](../../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
