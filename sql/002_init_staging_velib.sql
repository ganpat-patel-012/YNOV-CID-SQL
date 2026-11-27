-- TP1 : table brute de l'état des stations Vélib'. Une ligne = une station, telle que l'API l'a renvoyée.
-- À exécuter connecté en staging (connexion oracle-free-staging), touche F5.
CREATE TABLE velib_raw (
    id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- identifiant technique de la ligne
    source        VARCHAR2(100) NOT NULL,                           -- nom de l'API, en dur dans le script : 'velib'
    endpoint      VARCHAR2(500) NOT NULL,                           -- l'URL appelée, sans clé ni secret
    external_id   VARCHAR2(200) NOT NULL,                           -- identifiant de la station dans l'API (station_id)
    ingested_at   TIMESTAMP WITH TIME ZONE DEFAULT SYSTIMESTAMP NOT NULL, -- quand la ligne est arrivée chez nous, rempli par la base
    run_id        VARCHAR2(100) NOT NULL,                           -- identifiant de l'exécution du script
    payload       JSON          NOT NULL,                           -- l'objet station tel que l'API l'a renvoyé, sans transformation
    payload_hash  VARCHAR2(64)  NOT NULL,                           -- SHA-256 du payload de la station, pour détecter les doublons
    -- même station + même contenu = refusé ; même station avec un contenu différent = nouvelle ligne (le staging accumule)
    CONSTRAINT uq_velib_raw UNIQUE (source, external_id, payload_hash)
);
