*** Settings ***
Library    Browser
Resource    ../keyword/signup.resource
Library    string
Resource    ../keyword/launch_app.resource

*** Test Cases ***
signup
    launch_app
    signup

    
    