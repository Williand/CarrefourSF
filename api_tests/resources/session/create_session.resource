*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Resource    ../auth/auth_JWT.resource
Resource    ../users/create_user.resource

*** Keywords ***
Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}
Criar Sessão com auth
    Login com Sucesso
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json    authorization=${AUTH_TOKEN}
    Create Session    alias=ServeRestAuth    url=https://serverest.dev    headers=${headers}