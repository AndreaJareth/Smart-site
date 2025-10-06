# Pipelines Simulados de Datos (ETL/ELT)


Repositorio ejemplo para demostrar un pipeline de datos con:
- **Airflow** (orquestación) y alternativa **Prefect** opcional.
- **Great Expectations** (validación de calidad de datos) integrada en Python.
- **dbt** (modelado ELT) opcional y desacoplado.
- **PostgreSQL** como destino analítico (Docker Compose).
- **Datos sintéticos** para pruebas.
- **Logs y reportes** para evidencias.


## 1) Requisitos
- Docker y Docker Compose
- Python 3.10+
- `make` (opcional pero recomendado)


## 2) Instalación rápida
```bash
python -m venv .venv && source .venv/bin/activate # Windows: .venv\Scripts\activate
pip install -r requirements.txt
