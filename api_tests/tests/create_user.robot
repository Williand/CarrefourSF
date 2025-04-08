*** Settings ***
Resource    ../resources/utils/data_generator.resource
Resource    ../resources/users/create_user.resource

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServerRest
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest    email=${EMAIL_TESTE}    status_code_desejado=201
    Então o usuário deve ser cadastrado corretamente
Cenário 02: Cadastrar um usuário ja existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest   email=${EMAIL_TESTE}    status_code_desejado=201
    E repetir o cadastro do usuário
    Então Verificar se a API não permitiu o cadastro repetido