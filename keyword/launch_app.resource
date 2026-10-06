*** Settings ***

Library    Browser
Resource    ../page_object/launch_app_locators.resource

*** Keywords ***

launch_app
    Set Browser Timeout    50s
    New Browser    ${browser}       headless=False
    New Context    ignoreHTTPSErrors=True
    New Page    ${url}