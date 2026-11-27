# YNOV-CID-SQL

Scripts SQL (squelette de la base) du module M1 · Collecte & ingestion de données,
Oracle Database Free, service `FREEPDB1`.

**Nom :** Ganpat Patel · Le script d'ingestion qui alimente ces tables est dans
[YNOV-CID-INGESTION](https://github.com/ganpat-patel-012/YNOV-CID-INGESTION/tree/tp-1)
(le README du TP 1 complet s'y trouve).

## Organisation : un dossier par couche

```
sql/
├── 000_create_schemas.sql      <- administrateur : crée les 3 schémas (toutes couches)
├── staging/                    <- brut, tel que l'API le renvoie   (schéma staging)
├── integration/                <- nettoyé, typé, dédupliqué        (schéma integration, vide)
└── mart/                       <- tables métier pour les dashboards (schéma mart, vide)
```

Chaque dossier correspond à un schéma Oracle : un script d'un dossier s'exécute connecté
avec l'utilisateur du même nom.

## Scripts, à appliquer dans l'ordre

| Script | À exécuter en tant que | Rôle |
|---|---|---|
| `sql/000_create_schemas.sql` | `system` (connexion `oracle-free-admin`) | Crée les schémas `staging`, `integration`, `mart` |
| `sql/staging/001_init_staging.sql` | `staging` (connexion `oracle-free-staging`) | Installation : table d'exemple `meteo_raw` |
| `sql/staging/002_init_staging_velib.sql` | `staging` (connexion `oracle-free-staging`) | **TP 1** : table `velib_raw` (une ligne par station Vélib') |

Dans SQL Developer : ouvrir le script dans la bonne connexion (vérifier le nom dans l'onglet)
et l'exécuter en script avec **F5**.

## TP 1 : pourquoi `002` et pas `001` ?

`001_init_staging.sql` a déjà été appliqué (table `meteo_raw` de l'installation). On ne
modifie jamais un script SQL déjà appliqué : on en ajoute un nouveau, numéroté à la suite.
Ainsi, n'importe qui peut rejouer `000`, `001`, `002` dans l'ordre et obtenir exactement la
même base (principe des outils de migration : Flyway, Liquibase, Alembic).

Le squelette a été commité avant d'écrire le Python : commit `9c5da43` « TP1: squelette staging ».

## Base Oracle

Le conteneur Docker `oracle-free` est créé avec la commande de la fiche
« Prérequis et installation – Séance 1 ». Après un redémarrage du PC : `docker start oracle-free`.
