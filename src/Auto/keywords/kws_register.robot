*** Settings ***
Documentation        Aqui estarão presente todas as keywords dps testes de cadastro
...                  do site automationpractice.com

Resource    ../../config/package.robot

*** Keywords ***

Acessar a página home do site
    Acessar a página home do site Automation Practice
Clicar em "${BUTTON}"
    Wait Until Element Is Visible    xpath=//*[contains](text(), '${BUTTON}')]
    Click Element                    xpath=//*[contains](text(), '${BUTTON}')]

Informar um e-mail válido
    Wait Until Element Is Visible    email_create
    Input Text    email_create    eduardof.dutra@robot.com.br

Clicar em "Create an account"
    Click Element    xpath=//*[contains](text(), '${BUTTON}')]

Preencher os dados obrigatórios
    Wait Until Element Is Visible    id=
    Click Element                    ${REGISTER.check_mr}

    Input Text    locator    text

Submeter cadastro
Conferir se o cadastro foi efetuado com sucesso