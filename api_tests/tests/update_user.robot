*** Settings ***
Resource    ../resources/utils/data_generator.resource
Resource    ../resources/users/update_user.resource

*** Test Cases ***
Cenário 01: Atualizar os dados de um usuário existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então eu envio uma requisição PUT com os novos dados
    E os dados atualizados devem ser refletidos na próxima consulta

Cenário 02: Tentar atualizar um usuário com email ja sendo usado
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então eu envio uma requisição PUT com um email ja sendo usado por outro usuário
    E deve retornar uma mensagem "Este email já está sendo usado"