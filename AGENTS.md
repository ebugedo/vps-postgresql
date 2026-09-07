# Directrices de Trabajo y Reglas de Permisos para Agentes de IA
Este documento establece las normas obligatorias de operación y comportamiento para cualquier agente de IA o colaborador en este proyecto.

---

## 1. Principio General de Autorización Previa

<Callout type="warning" title="Restricción de Operación">
Queda strictly prohibido crear, modificar, mover o eliminar cualquier archivo, recurso, entorno de configuración o infraestructura sin la **autorización explícita y previa del usuario humano**.
</Callout>

### Normas de Autorización:
* **Sin Suposiciones:** No asumas permisos implícitos. Si un paso requiere crear o alterar elementos en el sistema, debes solicitar confirmación expresando qué se va a hacer.
* **Propuesta Previa:** Antes de ejecutar cualquier acción destructiva o de creación, debes presentar un resumen de las modificaciones propuestas y esperar la confirmación explícita (ej. "Sí", "Procede", "Autorizado").

---

## 2. Flujo de Trabajo Obligatorio en Git

Toda modificación de código o documentación contenida en repositorios Git debe seguir estrictamente el flujo descrito a continuación. No se permiten cambios directos en ramas principales (`main`, `master`, `develop`, etc.).

<Steps>
  <Step title="Solicitar Autorización para Crear la Rama" subtitle="Permiso requerido">
    Proponer el nombre de la nueva rama descriptiva (ej. `feature/nueva-funcionalidad` o `fix/correccion-bug`) y esperar la autorización previa del usuario antes de ejecutar la creación.
  </Step>

  <Step title="Crear la Rama" subtitle="Comando Git">
    Una vez autorizada, crear la rama localmente e ingresar a ella:
    
    ```bash
    git checkout -b <nombre-de-la-rama>
    ```
  </Step>

  <Step title="Confirmar el Commit" subtitle="Permiso requerido">
    Mostrar el mensaje de commit propuesto y la lista de archivos modificados al usuario para obtener su aprobación antes de empaquetar los cambios.
  </Step>

  <Step title="Ejecutar Commit" subtitle="Comando Git">
    Crear el commit en la rama autorizada:

    ```bash
    git add .
    git commit -m "tipo: descripción clara del cambio"
    ```
  </Step>

  <Step title="Solicitar Autorización para Push" subtitle="Permiso requerido">
    Pedir autorización explícita para subir los cambios locales al repositorio remoto.
  </Step>

  <Step title="Hacer Push al Repositorio Remoto" subtitle="Comando Git">
    Subir la rama al servidor remoto:

    ```bash
    git push origin <nombre-de-la-rama>
    ```
  </Step>

  <Step title="Crear la Pull Request (PR)" subtitle="Paso final">
    Presentar el título y descripción del Pull Request al usuario para su autorización previa y procedimiento de apertura de la PR mediante la CLI de Git/GitHub o interfaz web.
  </Step>
</Steps>

---

## 3. Resumen de Verificación de Pasos

Para verificar que el proceso se ha cumplido correctamente en cada ciclo de trabajo:

1. ¿El usuario autorizó la creación de la rama?
2. ¿Los cambios se realizaron **exclusivamente** dentro de esa rama?
3. ¿Se autorizó y ejecutó el commit?
4. ¿Se autorizó y ejecutó el push hacia la rama remota?
5. ¿Se autorizó la creación de la Pull Request hacia la rama principal?

Si la respuesta a cualquiera de estos puntos **no es "Sí"**, la operación debe detenerse inmediatamente.
