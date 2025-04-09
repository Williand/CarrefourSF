*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    ../utils/data_generator.resource
Resource    ../auth/auth_JWT.resource

*** Keywords ***
Então eu envio uma requisição PUT com os novos dados
    Criar Sessão com auth
    Dado que eu criei um novo usuário
    Set Test Variable    ${EMAIL_ATUALIZADO}   ${EMAIL_TESTE}
    Log    ${EMAIL_ATUALIZADO}
    Log    ${EMAIL_TESTE}
    ${body}    Create Dictionary
    ...    nome=Willian Domingues
    ...    email=${EMAIL_ATUALIZADO}
    ...    password=123456
    ...    administrador=true

    ${resposta}    PUT On Session
    ...    alias=ServeRestAuth
    ...    url=/usuarios/${ID_USUARIO}
    ...    json=${body}
    Should Be Equal As Integers    ${resposta.status_code}    200
    Dictionary Should Contain Item    ${resposta.json()}    message    Registro alterado com sucesso

E os dados atualizados devem ser refletidos na próxima consulta
    ${resposta_consulta}    GET On Session
    ...    alias=ServeRestAuth
    ...    url=/usuarios/${ID_USUARIO}
    ...    expected_status=200

    ${dados}    Set Variable    ${resposta_consulta.json()}
    Should Be Equal    ${dados["nome"]}             Willian Domingues
    Should Be Equal    ${dados["email"]}            ${EMAIL_ATUALIZADO}
    Should Be Equal    ${dados["password"]}         123456
    Should Be Equal    ${dados["administrador"]}    true
Então eu envio uma requisição PUT com um email ja sendo usado por outro usuário
    Criar Sessão com auth

    ${body}=    Create Dictionary
    ...    nome=Nome atualizado
    ...    email=${EMAIL_TESTE}
    ...    password=nova123
    ...    administrador=true

    ${resposta}=    PUT On Session
    ...    alias=ServeRestAuth
    ...    url=/usuarios/0uxuPY0cbmQhpEz1
    ...    json=${body}
    ...    expected_status=400
    Set Test Variable    ${RESPOSTA_PUT}    ${resposta}
E deve retornar uma mensagem "Este email já está sendo usado"
    Should Be Equal As Integers    ${RESPOSTA_PUT.status_code}    400
    Dictionary Should Contain Item    ${RESPOSTA_PUT.json()}    message    Este email já está sendo usado