*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${base_url}    https://practice.expandtesting.com/notes/api
${email}       shresans775@gmail.com
${password}    Test@12345

*** Test Cases ***

Register User
    Create Session    api    ${base_url}    verify=True

    ${register_body}=    Create Dictionary    name=shreyass    email=${email}    password=${password}

    ${register_response}=    POST On Session    api    /users/register    data=${register_body}

    Should Be Equal As Integers    ${register_response.status_code}    201

    Log To Console    Register Response: ${register_response.text}


Login User
    Create Session    api    ${base_url}    verify=True

    ${login_body}=    Create Dictionary    email=${email}    password=${password}

    ${login_response}=    POST On Session    api    /users/login    data=${login_body}

    Should Be Equal As Integers    ${login_response.status_code}    200

    ${login_json}=    Evaluate    $login_response.json()

    Log To Console    Login Response: ${login_json}

    ${token}=    Get Value From Json    ${login_json}    $.data.token

    Set Suite Variable    ${token}

    Log To Console    Token: ${token[0]}

Get User Profile
    Create Session    api    ${base_url}    verify=True

    ${headers}=    Create Dictionary    x-auth-token=${token[0]}    accept=application/json

    ${get_response}=    GET On Session    api    /users/profile    headers=${headers}

    Should Be Equal As Integers    ${get_response.status_code}    200

    ${profile_json}=    Evaluate    $get_response.json()

    Log To Console    Profile Response: ${profile_json}

    ${name}=    Get Value From Json    ${profile_json}    $.data.name

    Log To Console    Name: ${name[0]}

    ${email}=    Get Value From Json    ${profile_json}    $.data.email

    Log To Console    Email: ${email[0]}


Update User Profile
    Create Session    api    ${base_url}    verify=True

    ${headers}=    Create Dictionary
    ...    x-auth-token=${token[0]}
    ...    accept=application/json

    ${update_body}=    Create Dictionary
    ...    name=Updated Shreyass
    ...    phone=9896787897
    ...    company=Tecnotree

    ${patch_response}=    PATCH On Session    api    /users/profile    headers=${headers}    data=${update_body}

    Should Be Equal As Integers    ${patch_response.status_code}    200

    Log To Console    PATCH Response: ${patch_response.text}


Verify Updated Profile
    Create Session    api    ${base_url}    verify=True

    ${headers}=    Create Dictionary    x-auth-token=${token[0]}    accept=application/json

    ${get_response}=    GET On Session    api    /users/profile    headers=${headers}

    Should Be Equal As Integers    ${get_response.status_code}    200

    ${profile_json}=    Evaluate    $get_response.json()

    Log To Console    Updated Profile: ${profile_json}

    ${name}=    Get Value From Json    ${profile_json}    $.data.name

    ${phone}=    Get Value From Json    ${profile_json}    $.data.phone

    ${company}=    Get Value From Json    ${profile_json}    $.data.company

    Should Be Equal    ${name[0]}       Updated Shreyass
    Should Be Equal    ${phone[0]}      9896787897
    Should Be Equal    ${company[0]}    Tecnotree