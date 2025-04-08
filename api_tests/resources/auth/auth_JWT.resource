*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    ../session/create_session.resource
Resource    ../users/create_user.resource

*** Keywords ***
Login com Sucesso
    [Documentation]    Login na API e armazena o token JWT
    Log    ${EMAIL_TESTE}
    ${body}    Create Dictionary
    ...    email=${EMAIL_TESTE}
    ...    password=1234
    
    Criar Sessão na ServeRest

    ${response}    POST On Session
    ...    alias=ServeRest
    ...    url=/login
    ...    json=${body}
    Should Be Equal As Integers    ${response.status_code}    200
    ${token}    Get From Dictionary    ${response.json()}    authorization
    Set Global Variable    ${AUTH_TOKEN}    ${token}
    Log    ${AUTH_TOKEN}