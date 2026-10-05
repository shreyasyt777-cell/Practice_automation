*** Settings ***
Library    Browser
Resource    ../keyword/singup.resource
Library    string
Resource    ../keyword/launch_app.resource

*** Test Cases ***
signup
    launch_app
    signup

    
    