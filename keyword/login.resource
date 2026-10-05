*** Settings ***

Library    Browser
Library    String
Resource    ../page_object/login_locators.resource

*** Keywords ***

login
    Set Browser Timeout    60s
    New Browser    ${browser}    headless=False
    New Context    ignoreHTTPSErrors=True
    New Page    ${url}

    Wait For Elements State    ${signup-login}    enabled    timeout=20s
    Click    ${signup-login}

    Wait For Elements State    ${login_email}    enabled    timeout=10s
    Fill Text    ${login_email}    ${login_email_text}
    Fill Text    ${login_password}    ${login_password_text}
    Click    ${login}
