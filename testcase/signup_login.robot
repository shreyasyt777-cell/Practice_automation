*** Settings ***
Library    Browser
Resource    ../keyword/singup.resource
Library    string
Resource    ../keyword/login.resource

*** Test Cases ***
TC1
    [Tags]    signup
    signup
TC2
    [Tags]    login
    login
    
    