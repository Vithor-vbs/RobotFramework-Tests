*** Settings ***
Documentation    Essa suite esta o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Mais Vendidos"
    [Documentation]    esse teste verifica o menu "Mais Vendidos"
    ...                da Amazon
    [Tags]            menus    categorias
    Acessar o home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Mais Vendidos"
    Verificar se aparece a frase "Mais Vendidos"
    Verificar se aparece a categoria "Mais Vendidos em Eletrônicos" 

 Caso de Teste 02 - Pesquisa por um produto
    [Documentation]       Esse teste verifica a busca de um produto 
    [Tags]                busca_produtos    lista_busca
    Acessar o home page do site Amazon.com.br
    Digitar o nome do produto "Xbox series S" no campo de pesquisa
    Clicar no botão de pesquisa 
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    