*** Settings ***
Documentation        Aqui estarão presentes todos os exercícios da aula de automação.
...                  Então não se sinta perdido pois aqui a gente descreve o que ta fazendo.

*** Variables ***
&{PESSOA}        nome=Eduardo    
...              sobrenome=Fernandes
...              idade=28
...              endereço=Rua Coroados
...              carro=Porche
...              data_nascimento=06/06/2005

@{FRUTAS}      
...        banana
...        morango
...        abacaxi
...        melancia
...        manga

*** Keywords ***
Somar dois numeros
#Esse é onde os argumentos estão dentro da keywords
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${SOMA}

Criar email com nome sobrenome e idade
    [Arguments]    ${Nome}    ${Sobrenome}    ${Idade}
    ${EMAIL}    Catenate    ${Nome}_${Sobrenome}_${Idade}@robot.com
    [Return]        ${EMAIL}

Somar os numeros "${NUM_A}" e "${NUM_B}"
#Esse é o embutido onde o argumento esta "embutido" na keyword
     ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    ${SOMA}

Contar de 0 a 9
    FOR    ${counter}    IN RANGE    0    9
        Log To Console    ${counter}
    END

Imprimir lista de frutas
    @{FRUTAS}    Create List    Banana    Maçã    Manga    Morango    Abacaxi
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console    ${fruta}
    END

Imprimindo em qual numero estou
    Log To Console    \n
    FOR    ${counter}    IN RANGE    0    11
       IF    ${counter} == 5
           Log To Console    Estou no numero: ${counter}
       ELSE IF    ${counter} == 8
           Log To Console    Estou no numero: ${counter}
       END
    END

Imprimir paises
    @{PAISES}      Create List    Espanha    Japão    Eua    França    Brasil
    FOR    ${pais}    IN    @{PAISES}
        Log To Console    Eu ja fui para: ${pais}
    END

*** Test Cases ***
Cenario: Fui para pais
    [Tags]    PAISES
    Imprimir paises

Cenario: Imprimindo de 0 a 10
    [Tags]    ESTOU
    Imprimindo em qual numero estou

Cenario: Imprimir lista de FRUTAS
    [Tags]    FRUTAS
    Imprimir lista de frutas

Cenario: Validar contagem de 0 a 9
    [Tags]    contador
    Contar de 0 a 9

Cenario: Apresentar nome sobrenome e idade como um email
    [Tags]    EMAIL
    ${EMAIL}    Criar email com nome sobrenome e idade    Eduardo   Dutra    16
    Log To Console    ${EMAIL}    

Cenario: Validar soma de dois numeros
    [Tags]    SOMA
    ${RESULTADO}    Somar dois numeros    5    7

Cenario: Somar numero com argumento embutido
    [Tags]    EMBUTIDO
    Somar os numeros "5" e "12"

Imprimindo no console as informações da PESSOA
    [Tags]        PESSOAL
     Log To Console    \n
    #O \n na linha de cima é apenas por estética
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.endereço}
    Log To Console    ${PESSOA.carro}
    Log To Console    ${PESSOA.data_nascimento}

Cenario: Validar impressão da lista
    [Tags]        LISTA
    Log To Console    \n
    #O \n na linha de cima é apenas por estética
    Log To Console    ${FRUTAS[0]}
    Log To Console    ${FRUTAS[1]}
    Log To Console    ${FRUTAS[2]}
    Log To Console    ${FRUTAS[3]}
    Log To Console    ${FRUTAS[4]}
    