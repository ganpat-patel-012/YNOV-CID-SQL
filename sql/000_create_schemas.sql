-- Couche brute : les réponses d'API telles quelles
CREATE USER staging IDENTIFIED BY staging QUOTA UNLIMITED ON users;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO staging;

-- Couche intégration : données nettoyées, typées, dédupliquées
CREATE USER integration IDENTIFIED BY integration QUOTA UNLIMITED ON users;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO integration;

-- Couche mart : tables métier prêtes pour les dashboards
CREATE USER mart IDENTIFIED BY mart QUOTA UNLIMITED ON users;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO mart;

-- Aucun schéma ne voit les tables des autres. Les droits de lecture entre couches
-- (integration lit staging, mart lit integration) seront donnés table par table,
-- plus tard, au moment de la transformation.
