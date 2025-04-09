*** Settings ***
Resource    ../resources/utils/data_generator.resource
Resource    ../resources/users/delete_user.resource

*** Test Cases ***
Cenário 01: Deletar um usuário existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então eu envio uma requisição DELETE com o ID desse usuário
    E o usuário deve ser removido da base de dados

Cenário 02: Tentar deletar um usuário com ID inexistente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    E eu enviar uma requisição DELETE com um ID inválido
    Então deve retornar uma mensagem "Nenhum registro excluído"