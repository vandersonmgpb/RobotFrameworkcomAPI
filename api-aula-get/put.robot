*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***
${HOST}    https://dummyjson.com

#Rotas
${UPDATE_PRODUCT}    products/id-produto
${DELETE_PRODUCT}    products/id-produto-delete


*** Keywords ***
Atualizar um produto

    [Arguments]    ${id}    ${title}    ${price}    ${brand}    ${description}=none

    &{headers}    Create Dictionary    Content-type=application/json

    &{body}    Create Dictionary    title=${title}    description=${description}    price=${price}    brand=${brand}    

    ${UPDATE_PRODUCT}=    Replace String    ${UPDATE_PRODUCT}    id-produto    ${id}

    PUT    url=${HOST}/${UPDATE_PRODUCT}    headers=${headers}    json=${body}  

Deletar produto de id ${id}

    &{headers}    Create Dictionary    Content-type=application/json

    ${DELETE_PRODUCT}=    Replace String    ${DELETE_PRODUCT}    id-produto-delete    ${id}

    DELETE    url=${HOST}/${DELETE_PRODUCT}    headers=${headers}


*** Test Cases ***
TC01 - Atualizar produto existente
    Atualizar um produto    id=88    title=iphone XR    price=7000    brand=apple

TC02 - Deletar produto específico
    Deletar produto de id 9