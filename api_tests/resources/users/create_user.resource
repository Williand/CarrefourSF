*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    ../utils/data_generator.resource

*** Keywords ***
Então o usuário deve ser cadastrado corretamente
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}     _id

E repetir o cadastro do usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=400

Então Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado

