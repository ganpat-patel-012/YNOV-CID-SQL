# YNOV-CID-SQL

Scripts SQL du module M1 · Collecte & ingestion de données (Oracle Database Free, `FREEPDB1`).

| Script | À exécuter en tant que | Rôle |
|---|---|---|
| `sql/000_create_schemas.sql` | `system` (connexion `oracle-free-admin`) | Crée les schémas `staging`, `integration`, `mart` |
| `sql/001_init_staging.sql` | `staging` (connexion `oracle-free-staging`) | Crée la table brute `meteo_raw` |

Dans SQL Developer : ouvrir le script dans la bonne connexion et l'exécuter en script (F5).

## Base Oracle

```bash
docker run -d --name oracle-free -p 1521:1521 -e ORACLE_PASSWORD=Secret123 -e APP_USER=app -e APP_USER_PASSWORD=app gvenzl/oracle-free:slim
# après un redémarrage :
docker start oracle-free
```

Le script d'ingestion qui alimente `staging.meteo_raw` est dans le dépôt **YNOV-CID-INGESTION**.
