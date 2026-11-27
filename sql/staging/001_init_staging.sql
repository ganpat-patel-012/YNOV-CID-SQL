-- Table brute des réponses de l'API météo. Une ligne = une réponse, telle quelle.
CREATE TABLE meteo_raw (
    id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    source        VARCHAR2(100) NOT NULL,           -- 'open-meteo'
    endpoint      VARCHAR2(500) NOT NULL,           -- l'URL appelée, sans la clé
    ingested_at   TIMESTAMP WITH TIME ZONE DEFAULT SYSTIMESTAMP NOT NULL,
    run_id        VARCHAR2(100) NOT NULL,           -- identifiant de l'exécution du script
    payload       JSON           NOT NULL,          -- la réponse de l'API, sans transformation
    payload_hash  VARCHAR2(64)   NOT NULL,          -- empreinte SHA-256 du payload
    CONSTRAINT uq_meteo_raw UNIQUE (source, payload_hash)
);
