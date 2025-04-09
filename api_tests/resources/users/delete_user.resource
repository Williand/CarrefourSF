*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    ../utils/data_generator.resource
Resource    ../auth/auth_JWT.resource

*** Keywords ***
Então eu envio uma requisição DELETE com o ID desse usuário
    Criar Sessão com auth
    ${resposta_delete}    DELETE On Session
    ...    alias=ServeRestAuth
    ...    url=/usuarios/${ID_USUARIO}
    ...    expected_status=200
    Set Test Variable    ${RESPOSTA_DELETE}    ${resposta_delete.json()}
    Dictionary Should Contain Item    ${RESPOSTA_DELETE}    message    Registro excluído com sucesso
    Log    ${RESPOSTA_DELETE}
E o usuário deve ser removido da base de dados
    ${resposta_consulta}    GET On Session
    ...    alias=ServeRestAuth
    ...    url=/usuarios/${ID_USUARIO}
    ...    expected_status=400
    Dictionary Should Contain Item    ${resposta_consulta.json()}    message    Usuário não encontrado
    Log    ${resposta_consulta}

E eu enviar uma requisição DELETE com um ID inválido
    Criar Sessão com auth
    ${resposta_consulta_negativa}    DELETE On Session    
    ...    alias=ServeRestAuth   
    ...    url=/usuarios/0uxuPY0cbmQhpEzo
    ...    expected_status=200
    Set Test Variable    ${RESP_CONSULTA_NEGATIVA}    ${resposta_consulta_negativa.json()}
    Log    ${RESP_CONSULTA_NEGATIVA}
Então deve retornar uma mensagem "Nenhum registro excluído"
    Dictionary Should Contain Item    ${RESP_CONSULTA_NEGATIVA}    message    Nenhum registro excluído
    