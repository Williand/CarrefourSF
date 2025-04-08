*** Settings ***
Resource    ../resources/api_testing_user.resource
*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServerRest
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest
    Então o usuário deve ser cadastrado corretamente
Cenário 02: Cadastrar um usuário ja existente
    Dado que eu criei um novo usuário
    Quando eu cadastrar o usuário na ServerRest
    E repetir o cadastro do usuário
    Então Verificar se a API não permitiu o cadastro repetido