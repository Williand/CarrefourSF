*** Settings ***
Resource    ../resources/api_testing_user.resource
*** Variables ***

*** Test Cases ***
Cenário 01: Consultar os dados de um novo usuário
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest
    Então posso consultar os dados do novo usuário
    E Conferir os dados retornados
Cenário 02: Tentar buscar um usuário com ID inexistente
    Quando eu envio uma requisição GETcom um ID inválido
    Então a resposta deve conter status 400 ou 404
    E deve retornar uma mensagem de erro informando que o usuário não existe