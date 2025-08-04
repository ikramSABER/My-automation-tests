*** Settings ***
Resource    ../resources/servicenow_keywordsTCO.robot
Suite Setup    Ouvrir le navigateur ServiceNow
#Suite Teardown    Fermer le navigateur

*** Test Cases ***
Création et vérifications d’un ticket sur ServiceNow
    [Documentation]    Simule la création d’un ticket TCO ServiceNow et vérifie l’ensemble des éléments requis.
    Se connecter à ServiceNow
    Sleep    5s
    Naviguer à la création du ticket tco
    Sleep    5s
    Remplir les champs du ticket tco
    Sleep    5s
    remplir_champ_assigned_to
    Sleep    5s
    forcer_raz
    Sleep    5s
    statut_active
    Sleep    5s
    remplir_date_relance
    Sleep    5s
    Selectionner Trt Usine
    Sleep    5s
    enregistrer_ticket
    Sleep    5s
    enregistrer_apres_affectation
    Sleep    5s