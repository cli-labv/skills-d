# Skilld — Ecosistema de Skills para Aplicaciones CLI

Conjunto de skills modulares y reutilizables para construir aplicaciones de línea de comandos (CLI) profesionales, rápidas y seguras. Cada skill cubre una capa específica de la app y se activa solo cuando el usuario la necesita.

## ¿Qué es esto?

Es una colección de instrucciones para agentes que quieren crear o mejorar apps CLI. No es código para ejecutar directamente, es conocimiento procedimental que el agente aplica paso a paso en cada proyecto.

## Skills incluidas

| # | Skill | Para qué sirve |
|---|-------|----------------|
| 1 | `work-directory-management` | Gestiona carpetas `input/` y `output/`, las excluye de Git y las crea al arranque. |
| 2 | `adaptive-menu-system` | Genera menús interactivos adaptados al tipo de app (CLI, GUI, Web, Mobile). |
| 3 | `intelligent-bootstrap-system` | Arranque inteligente con loader dinámico, estados Fresh/Ready/Dirty y flags CLI. |
| 4 | `cli-banner-system` | Sistema de banners para CLI con catálogo de estilos y configuración vía JSON. |
| 5 | `progress-orchestrator` | Barras de progreso y spinners con ciclo de vida completo (start, update, finish, fail, cancel). |
| 6 | `universal-file-scanner` | Escaneo de sistemas de archivos con detección de duplicados, filtros y estadísticas. |
| 7 | `incremental-cache-system` | Caché incremental que evita reprocesar archivos sin cambios (5 niveles de estado). |
| 8 | `parallel-processing-orchestrator` | Procesamiento paralelo con detección automática IO-bound vs CPU-bound. |
| 9 | `universal-input-validation` | Validación de entradas antes de operaciones costosas (3 niveles: fast, standard, deep). |
| 10 | `universal-memory-controller` | Control de memoria con estrategias full-load, chunked, streaming, mmap y temp-file. |
| 11 | `universal-modular-architecture` | Arquitectura modular con inyección de dependencias, contratos y checklist de calidad. |
| 12 | `ascii-banner-generator` | Generador de banners ASCII con alfabeto completo, fuentes, temas y animaciones. |
| 13 | `cli-orchestrator` | Orquestador maestro que define el orden de ejecución y reglas CLI-only. |

## Flujo de ejecución de una app CLI

```
1. Bootstrap          → intelligent-bootstrap-system
2. Banner             → ascii-banner-generator
3. Entrada / Menú     → adaptive-menu-system
4. Validación         → universal-input-validation
5. Escaneo            → universal-file-scanner
6. Caché              → incremental-cache-system
7. Procesamiento      → parallel-processing-orchestrator + universal-memory-controller
8. Progreso           → progress-orchestrator
9. Reporte            → cli-banner-system + salida por terminal
10. Finalización      → limpieza de recursos
```

## Reglas de oro

- **Solo CLI:** No usar skills de web, desktop, móvil o servidores HTTP.
- **Una skill por capa:** Cada módulo tiene una responsabilidad única.
- **Activación por description:** La skill se activa por su descripción en el frontmatter, nunca por el cuerpo.
- **Menos de 500 líneas:** Cada `SKILL.md` se mantiene conciso y sin relleno.

## Cómo usar

1. Lee `cli-orchestrator.md` para entender el orden de fases.
2. Activa la skill correspondiente en cada fase según lo que el usuario pida.
3. Consulta la `SKILL.md` de cada skill para las instrucciones imperativas detalladas.
4. Los archivos `.txt` originales están guardados dentro de cada carpeta de skill como registro de origen.

## Estructura del proyecto

```
skilld/
├── README.md
├── a.txt
├── cli-orchestrator.md
├── ideas-nuevas-skills.md
├── work-directory-management/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 1.txt
├── adaptive-menu-system/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 2.txt
├── ... (una carpeta por skill)
└── ascii-banner-generator/
    ├── SKILL.md
    ├── scripts/
    ├── assets/
    └── 12.txt
```

---

Todas las skills están en `/home/victor/skilld/` y siguen el estándar de estructura de skill-creator (`SKILL.md`, `scripts/`, `references/`, `assets/`).
