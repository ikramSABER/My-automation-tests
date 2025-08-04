*** Settings ***
Resource    ../resources/Qualite_mail_Keywords.robot
Library    ../libraries/servicenow/demandeInterventionMainteneur/ShadowQualiteMail.py
Suite Setup    Ouvrir le navigateur ServiceNow


*** Test Cases ***
Test Qualité Mail Complet
    [Documentation]    Simule une demande d'information 
    Se connecter à ServiceNow
    Sleep    time_=10
    Naviguer Vers Lien du Ticket Creer par API
    

    Verifier Etat Actif
    Sleep    time_=5
    Verifier Etape Technique Attente Docs
    Sleep    time_=5
    Verifier Groupe Affectation Attente Photo Client