*** Settings ***
Resource    ../resources/api_testing_user.resource
*** Variables ***

*** Test Cases ***
Cenário 01: Atualizar os dados de um usuário existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então eu envio uma requisição PUT com os novos dados
    E a resposta deve conter status 200
    E os dados atualizados devem ser refletidos na próxima consulta

Cenário 02: Tentar atualizar um usuário com ID inexistente
    Quando eu envio uma requisição PUT com um ID inválido
    Então a resposta deve conter status 400 ou 404
    E deve retornar uma mensagem de erro informando que o usuário não existe