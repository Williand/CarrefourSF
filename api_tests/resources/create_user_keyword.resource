*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    create_session_keyword.resource

*** Keywords ***
Dado que eu criei um novo usuário
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Log    Minha palavra aleatoria: ${palavra_aleatoria}@emailteste.com
    Set Global Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}

Quando eu cadastrar o usuário na ServerRest
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary
    ...    nome=Willian Domingues  
    ...    email=${EMAIL_TESTE} 
    ...    password=1234
    ...    administrador=true
    Log    ${body}

    Criar Sessão na ServeRest

    ${resposta}    POST On Session    
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    
    Log    ${resposta.json()}
    IF    ${resposta.status_code}==201
        Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]} 
    END
    Set Test Variable    ${RESPOSTA}      ${resposta.json()}