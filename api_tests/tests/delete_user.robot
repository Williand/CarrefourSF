*** Settings ***
Resource    ../resources/api_testing_user.resource
*** Variables ***

*** Test Cases ***
Cenário 01: Deletar um usuário existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então eu envio uma requisição DELETE com o ID desse usuário
    E a resposta deve conter status 200
    E o usuário deve ser removido da base de dados

Cenário 02: Tentar deletar um usuário com ID inexistente
    Quando que eu envio uma requisição DELETE com um ID inválido
    Então a resposta deve conter status 400 ou 404
    E deve retornar uma mensagem de erro informando que o usuário não existe