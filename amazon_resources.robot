*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_MAISVENDIDOS}    //a[contains(.,'Mais Vendidos')]
${HEADER_MAISVENDIDOS}    //span[contains(@class,'a-size-extra-large a-color-base _p13n-zg-banner-landing-page-header_style_zgLandingPageBannerText__3HlJo')]   

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome 
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar o home page do site Amazon.com.br
    Go To    url=${URL}
     Wait Until Element Is Visible    locator=${MENU_MAISVENDIDOS}

Entrar no menu "Mais Vendidos"
    Click Element    locator=${MENU_MAISVENDIDOS}

verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    #Wait Until Element is Visible    locator=${HEADER_MAISVENDIDOS}

Verificar se o título da página fica "${TITLE}"
    Title Should Be    title=${TITLE}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//h2[contains(.,'${NOME_CATEGORIA}')]
 
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]


#GHERKIN BDD ------------------------------------

Dado que estou na home page da Amazon.com.br
    Acessar o home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Mais Vendidos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Mais Vendidos"


E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Mais Vendidos em Eletrônicos" 

#Teste 2

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome do produto "Xbox series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se aparece a frase "Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
