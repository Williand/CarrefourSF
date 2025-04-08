*** Settings ***
Resource    ../resources/create_user_keyword.resource
Resource    ../resources/api_testing_get_user_id.resource
Resource    ../resources/auth_JWT_keyword.resource

*** Variables ***

*** Test Cases ***
Cenário 01: Consultar os dados de um novo usuário
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então posso consultar os dados do novo usuário
    E Conferir os dados retornados

Cenário 02: Tentar buscar um usuário com ID inexistente
    Quando eu envio uma requisição GET com um ID inválido
    Então deve retornar uma mensagem de erro informando que o usuário não existe