*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    create_user_keyword.resource

*** Keywords ***
Então posso consultar os dados do novo usuário
    ${resposta_consulta}    GET On Session    alias=ServeRest    url=/usuarios/${ID_USUARIO}    expected_status=200
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}

E Conferir os dados retornados
    Log     ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome             Willian Domingues
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email            ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password         1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id              ${ID_USUARIO}
Quando eu envio uma requisição GET com um ID inválido
    Criar Sessão com auth
    ${resposta_consulta_negativa}    GET On Session    alias=ServeRestAuth   url=/usuarios/0uxuPY0cbmQhpEzo   expected_status=400
    Set Test Variable    ${RESP_CONSULTA_NEGATIVA}    ${resposta_consulta_negativa.json()}
    Log    ${RESP_CONSULTA_NEGATIVA}
Então deve retornar uma mensagem de erro informando que o usuário não existe
    Dictionary Should Contain Item    ${RESP_CONSULTA_NEGATIVA}    message    Usuário não encontrado