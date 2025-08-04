*** Settings ***
Resource    ../resources/Demande_mainteneur_Keyword.robot
Library    ../libraries/servicenow/demandeInterventionMainteneur/ShadowDDI_InterventionMainteneurA.py
Suite Setup    Ouvrir le navigateur ServiceNow


*** Test Cases ***
Test DDI Complet
    [Documentation]    Simule une demande d'information 
    Se connecter à ServiceNow
    Sleep    time_=10

    Cliquer Sur Bouton All
    Sleep    time_=10
    Rechercher Et Selectionner Ticket SAV Ouverts
    Sleep    time_=10
    Naviguer Vers Lien Ticket Spécifique
    Sleep    time_=10
    Remplir Champ Assigned To
    Sleep    time_=10
    cliquer bouton save
    Sleep    time_=10
    Clicker Boutton Demande Intervention
    Sleep    time_=10
    Remplir Champ Source Tag
    Sleep    time_=10
    Remplir Champ Type Intervention
    Sleep    time_=10
    Clicker Bouton Prender RDV Immediat
    Sleep    time_=10
    Choisir Rdv Jplus2 Apres Midi
    Sleep    time_=10
    cliquer_bouton_Reserver_RDV
    Sleep    time_=10
    cliquer_bouton_Modifier_RDV
    Sleep    time_=10
    Modifier Rdv Jplus2 Apres Midi
    Sleep    time_=10
    cliquer bouton Modifier RDV2
    Sleep    time_=10
    clicker bouton Annuler RDV
    Sleep    time_=10
    clicker sur popup ok
    Sleep    time_=10