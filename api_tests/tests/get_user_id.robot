*** Settings ***
Resource    ../resources/utils/data_generator.resource
Resource    ../resources/users/get_user_id.resource

*** Test Cases ***
Cenário 01: Consultar os dados de um novo usuário
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então posso consultar os dados do novo usuário
    E Conferir os dados retornados

Cenário 02: Tentar buscar um usuário com ID inexistente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Quando eu envio uma requisição GET com um ID inválido
    Então deve retornar uma mensagem de erro informando que o usuário não existe