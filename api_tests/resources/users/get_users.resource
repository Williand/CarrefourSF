*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    ../utils/data_generator.resource
Resource    ../auth/auth_JWT.resource

*** Keywords ***
Então posso consultar os dados do novo usuário
    Criar Sessão com auth
    ${resposta_consulta}    GET On Session    
    ...    alias=ServeRestAuth    
    ...    url=/usuarios?_id=${ID_USUARIO}    
    ...    expected_status=200

    ${usuarios_lista}     Get From Dictionary    ${resposta_consulta.json()}    usuarios
    ${usuario}            Get From List          ${usuarios_lista}    0
    Set Test Variable     ${RESP_CONSULTA}       ${usuario}

E Conferir os dados retornados
    Log     ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome             Willian Domingues
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email            ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password         1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id              ${ID_USUARIO}

E eu enviar uma requisição GET com um ID inválido
    Criar Sessão com auth
    ${resposta_consulta}    GET On Session
    ...    alias=ServeRestAuth
    ...    url=/usuarios?_id=ID_INEXISTENTE_123456789
    ...    expected_status=200
    ${usuarios_lista}     Get From Dictionary    ${resposta_consulta.json()}    usuarios
    Set Test Variable      ${RESP_INVALIDA}       ${usuarios_lista}

Então a resposta deve conter uma lista vazia
    Length Should Be    ${RESP_INVALIDA}    0