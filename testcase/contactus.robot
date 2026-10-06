*** Settings ***
Library    Browser
Resource    ../keyword/contactus.resource
Resource    ../keyword/launch_app.resource    


*** Test Cases ***
contactus
    launch_app
    contact_us
    