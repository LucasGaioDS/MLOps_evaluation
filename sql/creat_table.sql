CREATE TABLE dpe_logement (
    id SERIAL PRIMARY KEY,
    n_dpe TEXT DEFAULT '',
    type_batiment TEXT DEFAULT '',
    type_energie_principale_chauffage TEXT DEFAULT '',
    modele_dpe TEXT DEFAULT '',
    etiquette_dpe TEXT DEFAULT '',
    categorie_enr TEXT DEFAULT '',
    version_dpe FLOAT DEFAULT NULL,
    score TEXT DEFAULT NULL,
    ndepartement_ban TEXT DEFAULT '',
    nregion_ban TEXT DEFAULT '',
    code_insee_ban TEXT DEFAULT '',
    nom_commune_ban TEXT DEFAULT '',
    nom_commune_brut TEXT DEFAULT '',
    code_postal_ban TEXT DEFAULT '',
    code_postal_brut TEXT DEFAULT '',
    adresse_ban TEXT DEFAULT '',
    adresse_brute TEXT DEFAULT '',
    complement_d_adresse_logement TEXT DEFAULT '',
    nom_rue_ban TEXT DEFAULT '',
    identifiant_ban TEXT DEFAULT '',
    methode_application_dpe TEXT DEFAULT '',
    date_etablissement_dpe DATE DEFAULT NULL,
    date_reception_dpe DATE DEFAULT NULL,
    date_visite_diagnostiqueur DATE DEFAULT NULL,
    date_fin_validite_dpe DATE DEFAULT NULL,
    surface_habitable_immeuble FLOAT DEFAULT NULL,
    surface_habitable_logement FLOAT DEFAULT NULL,
    nombre_niveau_immeuble INT DEFAULT NULL,
    nombre_niveau_logement INT DEFAULT NULL,
    nombre_appartement INT DEFAULT NULL,
    appartement_non_visite_0_1 BOOLEAN DEFAULT NULL,
    hauteur_sous_plafond FLOAT DEFAULT NULL,
    ubat_w_m2_k FLOAT DEFAULT NULL,
    qualite_isolation_enveloppe TEXT DEFAULT '',
    qualite_isolation_menuiseries TEXT DEFAULT '',
    qualite_isolation_murs TEXT DEFAULT '',
    qualite_isolation_plancher_bas TEXT DEFAULT '',
    emission_ges_ecs FLOAT DEFAULT NULL,
    emission_ges_ecs_depensier FLOAT DEFAULT NULL,
    emission_ges_chauffage FLOAT DEFAULT NULL,
    emission_ges_chauffage_depensier FLOAT DEFAULT NULL,
    emission_ges_refroidissement FLOAT DEFAULT NULL,
    emission_ges_refroidissement_depensier FLOAT DEFAULT NULL,
    emission_ges_auxiliaires FLOAT DEFAULT NULL,
    emission_ges_5_usages FLOAT DEFAULT NULL,
    emission_ges_5_usages_par_m2 FLOAT DEFAULT NULL,
    emission_ges_5_usages_energie_n1 FLOAT DEFAULT NULL,
    emission_ges_eclairage FLOAT DEFAULT NULL,
    conso_ecs_e_finale FLOAT DEFAULT NULL,
    conso_ecs_depensier_e_finale FLOAT DEFAULT NULL,
    conso_ecs_e_primaire FLOAT DEFAULT NULL,
    conso_ecs_depensier_e_primaire FLOAT DEFAULT NULL,
    conso_chauffage_e_finale FLOAT DEFAULT NULL,
    conso_chauffage_depensier_e_finale FLOAT DEFAULT NULL,
    conso_chauffage_e_primaire FLOAT DEFAULT NULL,
    conso_chauffage_depensier_e_primaire FLOAT DEFAULT NULL,
    conso_refroidissement_e_finale FLOAT DEFAULT NULL,
    conso_refroidissement_depensier_e_finale FLOAT DEFAULT NULL,
    conso_refroidissement_e_primaire FLOAT DEFAULT NULL,
    conso_refroidissement_depensier_e_primaire FLOAT DEFAULT NULL,
    conso_auxiliaires_e_finale FLOAT DEFAULT NULL,
    conso_auxiliaires_e_primaire FLOAT DEFAULT NULL,
    conso_eclairage_e_finale FLOAT DEFAULT NULL,
    conso_eclairage_e_primaire FLOAT DEFAULT NULL,
    conso_5_usages_e_finale FLOAT DEFAULT NULL,
    conso_5_usages_e_primaire FLOAT DEFAULT NULL,
    conso_5_usages_m2_e_finale FLOAT DEFAULT NULL,
    conso_5_usages_e_finale_energie_n1 FLOAT DEFAULT NULL,
    cout_ecs FLOAT DEFAULT NULL,
    cout_ecs_depensier FLOAT DEFAULT NULL,
    cout_chauffage FLOAT DEFAULT NULL,
    cout_chauffage_depensier FLOAT DEFAULT NULL,
    cout_chauffage_energie_n1 FLOAT DEFAULT NULL,
    cout_refroidissement FLOAT DEFAULT NULL,
    cout_refroidissement_depensier FLOAT DEFAULT NULL,
    cout_auxiliaires FLOAT DEFAULT NULL,
    cout_eclairage FLOAT DEFAULT NULL,
    cout_total_5_usages FLOAT DEFAULT NULL,
    coordonnee_cartographique_x_ban FLOAT DEFAULT NULL,
    coordonnee_cartographique_y_ban FLOAT DEFAULT NULL,
    score_ban FLOAT DEFAULT NULL,
    geopoint TEXT DEFAULT '',
    statut_geocodage TEXT DEFAULT '',
    rand INT DEFAULT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
    modified_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
    i INT DEFAULT NULL,
    id_d TEXT DEFAULT ''
);
