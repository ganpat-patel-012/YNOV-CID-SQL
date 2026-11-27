# Couche staging (brut)

Tables `<source>_raw` : une ligne par objet renvoyé par l'API, payload JSON tel quel,
avec les colonnes de traçabilité (source, endpoint, ingested_at, run_id, payload_hash).

À exécuter connecté en **staging** (connexion `oracle-free-staging`), dans l'ordre :

| Script | Table |
|---|---|
| `001_init_staging.sql` | `meteo_raw` (exemple de l'installation) |
| `002_init_staging_velib.sql` | `velib_raw` (TP 1) |

Écrite par : les scripts d'ingestion · Lue par : la couche integration.
