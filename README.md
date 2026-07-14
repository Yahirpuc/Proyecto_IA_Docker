# 🚀 Guía de Inicio

> Esta guía explica cómo configurar el proyecto desde cero, instalar las dependencias necesarias, levantar todos los servicios y verificar que el sistema funcione correctamente.

---

# 📋 Requisitos Previos

Antes de comenzar, asegúrate de contar con el siguiente software instalado.

| Software | Versión recomendada | Obligatorio |
|-----------|---------------------|:-----------:|
| Docker Desktop | Última versión estable | ✅ |
| Docker Compose | Incluido con Docker Desktop | ✅ |
| Git | Última versión | ✅ |
| Node.js | 20 LTS o superior | ✅ |
| Python | 3.12+ | ✅ |
| Ollama | Última versión | ✅ |

---

# 📥 Clonar el Proyecto

Clona el repositorio y accede al directorio del proyecto.

```bash
git clone <URL_DEL_REPOSITORIO>

cd <NOMBRE_DEL_PROYECTO>
```

---

# 📁 Estructura del Proyecto

```text
.
├── backend/                 # API principal
├── frontend/                # Aplicación web
├── docker-compose.yml
├── dockerignore
└── README.md
```

---

# 🤖 Configuración de Ollama

El sistema utiliza **Ollama** para ejecutar localmente el modelo de lenguaje.

## Descargar el modelo

```bash
ollama pull qwen2.5:3b-instruct
```

---

## Verificar modelos instalados

```bash
ollama list
```

Deberías visualizar un resultado similar a:

```text
NAME                     SIZE
qwen2.5:3b-instruct      ...
```

---

## Iniciar Ollama

```bash
ollama serve
```

> **Importante**
>
> Ollama debe permanecer ejecutándose durante todo el tiempo que el proyecto esté funcionando al igual que docker.

---

# 🐳 Levantar el Proyecto

Desde la raíz del repositorio ejecuta:

```bash
docker compose up --build -d
```

Durante la primera ejecución Docker descargará las imágenes necesarias y construirá los contenedores.

Este proceso puede tardar algunos minutos.

---

# ✅ Verificar el Estado

Comprueba que todos los servicios se encuentren activos.

```bash
docker compose ps
```

Resultado esperado:

```text
NAME          STATUS
backend       Up
frontend      Up
...
```

---

# 📜 Consultar los Logs

## Backend

```bash
docker compose logs -f backend
```

---

## Todos los servicios

```bash
docker compose logs -f
```

El sistema estará listo cuando aparezca un mensaje similar a:

```text
[STARTUP] Sistema inicializado correctamente
```

---

# 🌐 Acceder a la Aplicación

Una vez iniciados los servicios abre el navegador.

```text
http://localhost:5173
```

---

# ⚙️ Flujo General del Sistema

```text
                 Usuario
                    │
                    ▼
          Ingresa la URL del producto
                    │
                    ▼
      Detección automática del sitio
                    │
                    ▼
        Inicialización del extractor
                    │
                    ▼
       Extracción de información
                    │
                    ▼
         Obtención de reseñas
                    │
                    ▼
      Limpieza y normalización
                    │
                    ▼
      Clasificación mediante IA
                    │
                    ▼
      Generación de Embeddings
                    │
                    ▼
     Construcción del índice híbrido
          (Vectorial + BM25)
                    │
                    ▼
      Motor RAG Conversacional
                    │
                    ▼
          Respuesta del Asistente
```

---

# 🚀 Uso Básico

Una vez iniciado el sistema:

1. Abre el frontend.
2. Ingresa la URL del producto.
3. Inicia el análisis.
4. Espera a que finalice el procesamiento.
5. Comienza a interactuar con el asistente.

---

# 💬 Ejemplos de Consultas

```text
¿Cuáles son las principales ventajas?

¿Cuáles son las fallas más frecuentes?

Resume todas las opiniones positivas.

Resume las críticas negativas.

¿Qué problemas mencionan los usuarios?

¿Qué tan recomendable es este producto?

¿Qué características reciben mejores opiniones?

Genera un resumen ejecutivo de las reseñas.
```

---

# 🔄 Reiniciar el Proyecto

Detener todos los servicios

```bash
docker compose down
```

---

Reconstruir completamente

```bash
docker compose up --build -d
```

---

Eliminar contenedores y volúmenes

```bash
docker compose down -v
```

---

# 🛠 Solución de Problemas

## Ollama no responde

Comprueba que el servicio esté ejecutándose.

```bash
ollama serve
```

---

## El modelo no existe

Verifica los modelos disponibles.

```bash
ollama list
```

Si no aparece el modelo requerido:

```bash
ollama pull qwen2.5:3b-instruct
```

---

## Backend detenido

Consultar registros.

```bash
docker compose logs backend
```

---

## Ver todos los registros

```bash
docker compose logs -f
```

---

## Reconstruir imágenes

```bash
docker compose build --no-cache

docker compose up -d
```

---

## Limpiar completamente Docker

```bash
docker compose down

docker system prune -f

docker compose up --build -d
```

---

# 📂 Arquitectura del Proyecto

```text
                         Frontend
                             │
                             ▼
                    API REST Backend
                             │
        ┌────────────────────┼────────────────────┐
        ▼                                         ▼
   Gestor IA                             Extractor Web
        │                                         │
        └────────────────────┼────────────────────┘
                             ▼
                    Clasificación LLM
                             ▼
                    Generación Embeddings
                             ▼
                 Base Vectorial (ChromaDB)
                             │
                       BM25 Retriever
                             │
                             ▼
                 Recuperación Híbrida
                             ▼
                Asistente Conversacional
```

---

# 📌 Buenas Prácticas

- Mantén Docker Desktop iniciado antes de ejecutar el proyecto.
- Verifica que Ollama permanezca activo durante toda la ejecución.
- Comprueba que el modelo requerido esté descargado.
- Consulta los logs antes de intentar reiniciar los servicios.
- Después de modificar dependencias, reconstruye las imágenes Docker.
- Mantén actualizado el archivo `.env` con la configuración del entorno.
- No almacenes credenciales sensibles dentro del repositorio.

---

# 🔍 Comandos Útiles

| Acción | Comando |
|---------|----------|
| Levantar proyecto | `docker compose up --build -d` |
| Detener proyecto | `docker compose down` |
| Estado de servicios | `docker compose ps` |
| Ver logs | `docker compose logs -f` |
| Logs backend | `docker compose logs -f backend` |
| Reiniciar | `docker compose restart` |
| Reconstruir imágenes | `docker compose build --no-cache` |
| Modelos instalados | `ollama list` |
| Descargar modelo | `ollama pull qwen2.5:3b-instruct` |
| Iniciar Ollama | `ollama serve` |

---

<div align="center">

## 🎉 ¡Listo!

Si todos los servicios se encuentran activos y el frontend carga correctamente, el sistema está preparado para comenzar a analizar productos e interactuar con el asistente inteligente.

</div>
