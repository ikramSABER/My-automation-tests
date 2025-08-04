*** Settings ***
Resource    ../resources/Fermeture_Ticket_KeyW.robot
Library    ../libraries/servicenow/demandeInterventionMainteneur/ShadowFermetureTicket.py
Suite Setup    Ouvrir le navigateur ServiceNow


*** Test Cases ***
Test Qualité Mail Complet
    [Documentation]    Simule une demande d'information 
    Se connecter à ServiceNow
    Sleep    time_=10
    Naviguer Vers Lien du Ticket Creer par API

    Verifier Etat Clos
    Sleep    time_=10
    

