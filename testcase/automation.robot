*** Settings ***

Library    SeleniumLibrary

*** Test Cases ***

tc1
    Open Browser    https://automationexercise.com/contact_us    chrome
    ${page_text}=    Get Text    tag=body
    ${page_title}=    Get Title
    Log To Console    ${page_title}
    Log To Console    ${page_text}
    