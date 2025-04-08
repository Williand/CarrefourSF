*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    create_session_keyword.resource
Resource    create_user_keyword.resource

*** Keywords ***
Então o usuário deve ser cadastrado corretamente
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}     _id

E repetir o cadastro do usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=400

Então Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

