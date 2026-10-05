*** Settings ***

Library    Browser
Library    String
Resource    ../page_object/add_to_cart_locators.resource

*** Keywords ***
add_to_cart
    Set Browser Timeout    60s
    New Browser    chromium    headless=False
    New Context    ignoreHTTPSErrors=True
    New Page    ${url}

    Wait For Elements State    ${product}    enabled    timeout=20s
    Click    ${product}

    Hover    ${first_product}
    Sleep    1s
    Click    ${f_P_add_to_cart}
    Sleep    1s

    Click    ${continue_shopping}
    Sleep    1s

    Hover    ${second_product}
    Sleep    1s
    Click    ${s_p_add_to_cart}
    Sleep    1s

    Click    ${view_cart}

    
