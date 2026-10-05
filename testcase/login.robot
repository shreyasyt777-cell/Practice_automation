*** Settings ***

Library    Browser
Resource    ../keyword/launch_app.resource
Resource    ../keyword/login.resource

*** Test Cases ***

login
    launch_app
    login
